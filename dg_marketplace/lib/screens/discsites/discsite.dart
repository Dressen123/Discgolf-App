import 'package:flutter/material.dart';
import 'package:dg_marketplace/screens/discmodel/discmodel.dart'; // Import DiscService
import 'package:dg_marketplace/screens/database/database.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

//Used chatGPT for part of the code.

class DiscListScreen extends StatefulWidget {
  @override
  _DiscListScreenState createState() => _DiscListScreenState();
}

class _DiscListScreenState extends State<DiscListScreen> {
  late Future<List<Disc>> _discs;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _speedController = TextEditingController();
  final TextEditingController _glideController = TextEditingController();
  final TextEditingController _turnController = TextEditingController();
  final TextEditingController _fadeController = TextEditingController();
  final TextEditingController _companyController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _discs = DiscService()
        .fetchDiscs(); // Fetch discs from the backend "DiscService() is function imported from another file."
  }

  // Function to add a new disc
  void _addDisc() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Add a Disc"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                    controller: _nameController,
                    decoration: InputDecoration(labelText: "Name")),
                TextField(
                    controller: _speedController,
                    decoration: InputDecoration(labelText: "Speed"),
                    keyboardType: TextInputType.number),
                TextField(
                    controller: _glideController,
                    decoration: InputDecoration(labelText: "Glide"),
                    keyboardType: TextInputType.number),
                TextField(
                    controller: _turnController,
                    decoration: InputDecoration(labelText: "Turn"),
                    keyboardType: TextInputType.number),
                TextField(
                    controller: _fadeController,
                    decoration: InputDecoration(labelText: "Fade"),
                    keyboardType: TextInputType.number),
                TextField(
                    controller: _companyController,
                    decoration: InputDecoration(labelText: "Company")),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text("Cancel"),
              ),
              TextButton(
                onPressed: () async {
                  final url = Uri.parse("http://localhost:3000/api/discs");
                  final response = await http.post(
                    url,
                    headers: {"Content-Type": "application/json"},
                    body: jsonEncode({
                      // Handle empty ID
                      "name": _nameController.text,
                      "speed": int.tryParse(_speedController.text) ??
                          0, // Prevent errors
                      "glide": int.tryParse(_glideController.text) ?? 0,
                      "turn": int.tryParse(_turnController.text) ?? 0,
                      "fade": int.tryParse(_fadeController.text) ?? 0,
                      "company": _companyController.text,
                    }),
                  );

                  print(
                      "Response: ${response.statusCode} - ${response.body}"); // Debugging

                  if (response.statusCode == 201) {
                    setState(() {
                      _discs = DiscService().fetchDiscs();
                    });
                    Navigator.of(context).pop();
                  } else {
                    print("Error: ${response.statusCode} - ${response.body}");
                  }

                  // Clear fields
                  _nameController.clear();
                  _speedController.clear();
                  _glideController.clear();
                  _turnController.clear();
                  _fadeController.clear();
                  _companyController.clear();
                },
                child: const Text("Add"),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
            "Discs",
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            IconButton(onPressed: _addDisc, icon: const Icon(Icons.add))
          ],
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: const Color.fromRGBO(34, 37, 41, 1)),
      body: FutureBuilder<List<Disc>>(
        future: _discs,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // This condition checks if the Future is still in progress, it this case it shows another function to show that it is still in progress
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
                child: Text(
                    'Error: ${snapshot.error}')); // Checks if there is an error while fetching the data.
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            // If no data was returned it shows "No discs available"
            return Center(child: Text('No discs available.'));
          }

          // Display discs in a ListView
          List<Disc> discs =
              snapshot.data!; //Containes the data from the future
          return ListView.builder(
            //This displays the list of items, where the nu ber of items is not known in advance.
            itemCount: discs
                .length, //Checks the length of the "discs" variable that now container the data from the future function.
            itemBuilder: (context, index) {
              // Defines how each item in the list should be built.
              return ListTile(
                title: Text(discs[index].name), //Title of the disc.
                subtitle: Text(
                    //Here and line under displays the speed, glide, turn and fade of the disc.
                    'Speed: ${discs[index].speed}, Glide: ${discs[index].glide}, Turn: ${discs[index].turn}, Fade: ${discs[index].fade}'),
              );
            },
          );
        },
      ),
    );
  }
}
