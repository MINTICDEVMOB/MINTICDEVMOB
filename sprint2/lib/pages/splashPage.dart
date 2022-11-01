import 'package:flutter/material.dart';
import 'package:sprint2/pages/loginPage.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  void initState(){
    _closeSplash();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Image(
                image: AssetImage("assets/images/gaia.png"),
              ),
            ],
          ),
        ),
      ),
    );
  }
  //Función del tiempo de 2segundos
  Future<void> _closeSplash() async{
    Future.delayed(const Duration(seconds: 3), () async{
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const LoginPage())
      );
    });
  }
}
