import 'package:coderecet/Pages/Home.dart';
import 'package:coderecet/Pages/Profile.dart';
import 'package:flutter/material.dart';
import 'package:coderecet/Pages/Login.dart';

class GetStarted extends StatefulWidget {
  const GetStarted({ Key? key }) : super(key: key);

  @override
  State<GetStarted> createState() => _GetStartedState(); // Return _GetStartedState here
}

class _GetStartedState extends State<GetStarted> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("lib/components/image/AAANAAAA Padam.jpg"),
                  fit: BoxFit.cover,

                ),
              ),
            ),
          ),
          Positioned(
            bottom: 120.0,
            left: 125.0, 
            child: MaterialButton(
              onPressed: () { 
                print('Context: $context'); 
                Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => Home()));
              },
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 10.0,
              ),
              child: const Text(
                'Get Started',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Color.fromARGB(255, 110, 158, 136),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
