
import 'package:coderecet/Pages/Home.dart';
import 'package:coderecet/Pages/Profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
//import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';


class Emergency extends StatefulWidget {
  const Emergency({Key? key}) : super(key: key);

  @override
  State<Emergency> createState() => _EmergencyState();
}

class _EmergencyState extends State<Emergency> {
  // Controllers for text fields
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController animalController = TextEditingController();

  @override
  void dispose() {
    // Dispose controllers to avoid memory leaks
    nameController.dispose();
    phoneNumberController.dispose();
    animalController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Emergency'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add_alert),
            color: Colors.blue,
            tooltip: 'Navigate to Profile',
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => Profile()));
            },
          ),
          IconButton(
            icon: const Icon(Icons.person_add_alt),
            color: Colors.black,
            tooltip: 'Navigate to Home',
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => Home()));
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: [
            SizedBox(height: 10),
            SizedBox(
              width: 450.0,
              height: 450.0,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 215, 213, 213),
                ),
                child: FlutterMap(
                  options: MapOptions(
                    center: LatLng(42.1444, 13.6116),
                    zoom: 12,
                  ),
                  children: [
                    TileLayer(
                       urlTemplate:'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                       userAgentPackageName: 'com.example.app',
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter name',
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: phoneNumberController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter Phone number',
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: animalController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter animal',
              ),
            ),
            SizedBox(height: 05,),
            MaterialButton(
              onPressed: () {
                // Show pop-up message
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Submission Recorded'),
                      content: Text('Your submission has been recorded.'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('OK'),
                        ),
                      ],
                    );
                  },
                );
                // You can upload the data to the database here
                String Name = nameController.text;
                String phoneNumber = phoneNumberController.text;
                String Animal = animalController.text;
                
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
                'Submit',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Color.fromARGB(255, 255, 0, 0),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }


}