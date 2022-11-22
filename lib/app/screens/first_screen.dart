import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_selection/app/screens/dashboard_screen.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({Key? key}) : super(key: key);

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Center(
          child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.teal),
            padding: MaterialStateProperty.all(const EdgeInsets.all(10)),
            textStyle:
                MaterialStateProperty.all(const TextStyle(fontSize: 16))),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const DashboardScreen()),
          );
        },
        child: const Text("Click here To Go Dashboard->"),
      )),
    ));
  }
}
