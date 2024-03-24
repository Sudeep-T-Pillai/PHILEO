import 'package:coderecet/Pages/Emergency.dart';
import 'package:coderecet/Pages/GetStarted.dart';
import 'package:coderecet/Pages/Home.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppBar(
            title: const Text('Profile'),
            actions: <Widget>[
              IconButton(
                icon: const Icon(Icons.add_alert),
                color: Colors.red,
                tooltip: 'Navigate to Emergency',
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => Emergency()));
                },
              ),

               IconButton(
                icon: const Icon(Icons.home),
                color: Colors.black,
                tooltip: 'Navigate to Home',
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => Home()));
                },
              ),

            ],
          ),
          SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Text(
                        'Username',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  SizedBox(
                    width: double.infinity,
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Text(
                        'Phonenumber',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 15,),
                 MaterialButton(
              onPressed: () {
                print('Context: $context'); 
                Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => GetStarted()));
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
                'DELETE ACCOUNT',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Color.fromARGB(255, 255, 0, 0),
                ),
              ),
            )
                ],
              ),
            ),
          ),
            
             SizedBox(height: 10,),
             
            SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 10.0), 
            child: SafeArea(
            child: SizedBox(
            width: 450.0,
            height: 500.0,
            child: DecoratedBox(
            decoration: BoxDecoration(
            color: Color.fromARGB(255, 215, 213, 213),
            ),
           ),
          ),
         ),
        ),
        ],
      ),
    );
  }
}
