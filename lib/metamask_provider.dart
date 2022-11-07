import 'package:flutter/material.dart';
import 'package:flutter_web3/flutter_web3.dart';

class MetaMaskProvider extends ChangeNotifier {
  static const operatingChainID = 5;
  static const operatingChainName = 'Goerli Testnet';
  String currentAddress = '';
  int currentChainID = -1;
  bool get isEnabled => ethereum != null;
  bool get isInOperatingChain => currentChainID == operatingChainID;
  bool get isConnected => isEnabled && currentAddress.isNotEmpty;
  Future<void> connect() async {
    if (isEnabled) {
      final accs = await ethereum!.requestAccount();
      if (accs.isNotEmpty) {
        currentAddress = accs.first;
      }
      currentChainID = await ethereum!.getChainId();
      
      notifyListeners();
    }
  }

  reset() {
    currentAddress = '';
    currentChainID = -1;
    notifyListeners();
  }

  start() {
    if (isEnabled) {
      ethereum!.onAccountsChanged((accounts) {
        reset();
      });
      ethereum!.onChainChanged((accounts) {
        reset();
      });
    }
  }
}
