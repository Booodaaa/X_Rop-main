import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class carcontrol extends StatefulWidget {
  const carcontrol({Key? key}) : super(key: key);

  @override
  State<carcontrol> createState() => _carcontrolState();
}

class _carcontrolState extends State<carcontrol> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("controller"),
      ),
      body: Center(
        child: InkWell(
            onTap: () {
              setState(() {
                x = "https://x-robot.future-developers.cloud/control.html";
                _launchUrl();
              });
            },
            child: Text(
              " drive ",
              style:
                  TextStyle(color: Colors.yellow, fontWeight: FontWeight.bold),
            )),
      ),
    );
  }
}

var x;
final Uri _url = Uri.parse(x);
Future<void> _launchUrl() async {
  if (!await launchUrl(_url)) {
    throw Exception('Could not launch $_url');
  }
}
