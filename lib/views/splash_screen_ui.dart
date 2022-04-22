import 'package:flutter/material.dart';
import 'package:flutter_app_mydiaryfood/views/home_ui.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class splashScreenUI extends StatefulWidget {
  const splashScreenUI({ Key? key }) : super(key: key);

  @override
  State<splashScreenUI> createState() => _splashScreenUIState();
}

class _splashScreenUIState extends State<splashScreenUI> {

  @override
  void initState() {
    // โค้ด Delay หน้าจอ
    Future.delayed(
      Duration(
        seconds: 3,
      ),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => homeUI(),
        ),
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              FontAwesomeIcons.bowlFood,
              color:  Colors.white,
              size: MediaQuery.of(context).size.width * 0.33,
            ),
            // ignore: prefer_const_constructors
            Text(
              'My Diary Food',
              style: TextStyle(
                fontSize: 25.0,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            CircularProgressIndicator(
              color: Colors.yellow,
            ),
          ],
        ),
      ),
    );
  }
}