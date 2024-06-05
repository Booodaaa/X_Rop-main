import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weather_app/view/signup.dart';
import '../widgets/app_colors.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
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
      // body: Container(
      //   child: Image.asset("assets/images/pppppppppppp.png"),
      // ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              AppColors.color2,
              AppColors.color1,
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              (Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  // Icon(
                  //   Icons.home,
                  // ),
                  Text(
                    "X-Robot",
                    style: TextStyle(
                      fontSize: 50,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              )),
            ],
          ),
        ),
      ),
    );
  }
}
