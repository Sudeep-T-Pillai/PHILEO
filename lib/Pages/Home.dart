import 'package:coderecet/Pages/Emergency.dart';
import 'package:coderecet/Pages/GetStarted.dart';
import 'package:coderecet/Pages/Profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.person_add_alt),
            color: Colors.blue,
            tooltip: 'Navigate to Profile',
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => Profile()));
            },
          ),
          IconButton(
            icon: const Icon(Icons.add_alert),
            color: Colors.red,
            tooltip: 'Navigate to Emergency',
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => Emergency()));
            },
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          // Set your background color here
          color: Color.fromARGB(248, 255, 255, 255), // Example background color
        ),
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            children: [
              SizedBox(height: 10),
              Center(
                child: MaterialButton(
                  onPressed: () {
                    print('Context: $context');
                    Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => Emergency()));
                  },
                  color: Color.fromARGB(255, 254, 255, 252),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 100.0,
                    vertical: 10.0,
                  ),
                  child: const Text(
                    'Submit a complaint',
                    style: TextStyle(
                      fontSize: 19.0,
                      color: Color.fromARGB(255, 255, 1, 1),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Center(
                child: MaterialButton(
                  onPressed: () async {
                    const number = '+91 8075639733'; // set the desired number here
                    bool? res = await FlutterPhoneDirectCaller.callNumber(number);
                  },
                  color: Color.fromARGB(255, 255, 252, 252),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 159.0,
                    vertical: 10.0,
                  ),
                  child: const Text(
                    'SOS',
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 19.0,
                      color: Color.fromARGB(255, 255, 1, 1),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 40),
              Text(
                'Reports',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                width: 450.0,
                height: 550.0,
                child: ListView.builder(
                  itemCount: 10, // Adjust itemCount as needed
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        print('Tapped on Report ${index + 1}');
                      },
                      child: Container(
                        height: 90, // Adjust the height of each report item as needed
                        margin: EdgeInsets.symmetric(vertical: 1, horizontal: 10),
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7), // Example border radius value
                          color:Color.fromARGB(223, 204, 205, 203) // Example color value
                        ),
                        child: Center(
                          child: Text(
                            'Thiruvananthapuram:Wild animal attacks continued unabated in various parts of Kerala ${index + 1}',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
