import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:voting_dapp/services/constants.dart';
import 'package:web3dart/web3dart.dart';

class EthereumUtils {
  late http.Client httpClient;
  late Web3Client ethClient;
  String contractAddress = "0xfdsvjbvljnvlkrnvklrnv";

  void initialSetup() {
    httpClient = http.Client();
    String infura =
        "https://goerli.infura.io/v3/b7b4ee102e7644ccb30ab368a8d3b2f9";
    ethClient = Web3Client(infura, httpClient);
  }

  Future<DeployedContract> getDeployedContract() async {
    String abi = await rootBundle.loadString("assets/abi.json");
    final contract = DeployedContract(ContractAbi.fromJson(abi, "FirstCoin"),
        EthereumAddress.fromHex(contractAddress));

    return contract;
  }

  Future getQuote() async {
    List<dynamic> result = await query("getQuote", []);
    var myData = result[0];
    return myData;
  }

  Future<String> withdrawCoin(double amount) async {
    var bigAmount = BigInt.from(amount);
    var response = await submit("withdrawBalance", [bigAmount]);
    return response ?? '';
  }

  Future<String> depositCoin(double amount) async {
    var bigAmount = BigInt.from(amount);
    var response = await submit("depositBalance", [bigAmount]);
    return response ?? '';
  }

  Future<List<dynamic>> query(String functionName, List<dynamic> args) async {
    final contract = await getDeployedContract();
    final ethFunction = contract.function(functionName);
    final result = await ethClient.call(
        contract: contract, function: ethFunction, params: args);
    return result;
  }

  Future<String?> submit(String functionName, List<dynamic> args) async {
    try {
      EthPrivateKey credential =
          EthPrivateKey.fromHex(Metamask_private_address);
      DeployedContract contract = await getDeployedContract();
      final ethFunction = contract.function(functionName);
      final result = await ethClient.sendTransaction(
          credential,
          Transaction.callContract(
              contract: contract,
              function: ethFunction,
              parameters: args,
              maxGas: 100000),
          chainId: 4);
      return result;
    } catch (e) {
      print("Something wrong happened!");
      return null;
    }
  }
}
