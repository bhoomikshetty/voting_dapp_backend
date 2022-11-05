import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'metamask_provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Color.fromARGB(255, 120, 39, 134),
              Color.fromARGB(255, 0, 0, 0),
              Color.fromARGB(255, 4, 83, 148),
            ],
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: 500,
              height: 500,
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.only(left: 60),
              child: const Welcome(),
            ),
            Expanded(
              child: Column(
                children: [
                  const SizedBox(height: 40),
                  Text(
                    'Connect your',
                    style: GoogleFonts.lato(
                      color: Colors.white,
                      fontSize: 40,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'Metamask Wallet...',
                    style: GoogleFonts.lato(
                      color: Colors.white,
                      fontSize: 40,
                    ),
                    textAlign: TextAlign.right,
                  ),
                  const SizedBox(height: 40),
                  Container(
                    width: 300,
                    height: 120,
                    alignment: Alignment.centerLeft,
                    child: const MetaMask(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MetaMask extends StatelessWidget {
  const MetaMask({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MetaMaskProvider()..start(),
      builder: (context, child) {
        return Container(
          alignment: Alignment.centerRight,
          child: Consumer<MetaMaskProvider>(
            builder: (context, provider, child) {
              late final String message;
              if (provider.isConnected && provider.isInOperatingChain) {
                message = 'Connected';
              } else if (provider.isConnected && !provider.isInOperatingChain) {
                message =
                    'Wrong chain. Please connect to -\n${MetaMaskProvider.operatingChainName}';
              } else if (provider.isEnabled) {
                return MaterialButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  onPressed: () => context.read<MetaMaskProvider>().connect(),
                  color: Colors.white,
                  padding: const EdgeInsets.all(10),
                  child: Image.asset(
                    'assets/images/metamask.png',
                    width: 250,
                  ),
                );
              } else {
                message = 'Please use a Web3 supported browser.';
              }
              return Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    message,
                    style: GoogleFonts.roboto(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}

class Welcome extends StatelessWidget {
  const Welcome({super.key});
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.transparent,
      elevation: 0,
      child: Stack(
        children: [
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                shape: BoxShape.rectangle,
                color: const Color.fromARGB(255, 47, 47, 49).withOpacity(0.3),
              ),
            ),
          ),
          Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 20, left: 20),
                child: RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Welcome to',
                        style: GoogleFonts.lato(
                          color: Colors.white,
                          fontSize: 55,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      TextSpan(
                        text: '\n      VotersFeild.',
                        style: GoogleFonts.lato(
                          color: Colors.white,
                          fontSize: 55,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Center(
                  child: Image.asset(
                    'assets/images/vote2_1.png',
                    height: 300,
                    width: 300,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class GradientText extends StatelessWidget {
  const GradientText(
    this.text, {
    super.key,
    required this.gradient,
    this.style,
  });
  final String text;
  final TextStyle? style;
  final Gradient gradient;
  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) => gradient.createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      child: Text(text, style: style),
    );
  }
}
