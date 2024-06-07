import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weather_app/view/signup.dart';

class SplashPage extends StatefulWidget {
  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  @override
  // ignore: unused_element
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    Future.delayed(const Duration(seconds: 3), (() {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => SignUpPage()),
      );
    }));
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                child: Image.asset("assets/images/pppppppppppp.png"),
              ),
              SizedBox(
                height: 40,
              ),
              Text(
                "X-Robot",
                style: TextStyle(
                  fontSize: 50,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              )
            ]),
      ),
    );
  }
}
