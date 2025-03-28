import 'package:flutter/material.dart';
import 'package:dg_marketplace/screens/discmodel/discmodel.dart'; // Import DiscService
import 'package:dg_marketplace/screens/backend/database.dart'; // Import Disc model

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
  final TextEditingController _idController = TextEditingController();

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
                  keyboardType: TextInputType.number,
                ),
                TextField(
                  controller: _glideController,
                  decoration: InputDecoration(labelText: "Glide"),
                  keyboardType: TextInputType.number,
                ),
                TextField(
                  controller: _turnController,
                  decoration: InputDecoration(labelText: "Turn"),
                  keyboardType: TextInputType.number,
                ),
                TextField(
                  controller: _fadeController,
                  decoration: InputDecoration(labelText: "Fade"),
                  keyboardType: TextInputType.number,
                ),
                TextField(
                  controller: _companyController,
                  decoration: InputDecoration(labelText: "Company"),
                ),
                TextField(
                  controller: _idController,
                  decoration: InputDecoration(labelText: "Discnumber"),
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text("Cancel"),
              ),
              TextButton(
                onPressed: () async {
                  Disc newDisc = Disc(
                    id: int.parse(_idController.text),
                    name: _nameController.text,
                    speed: int.parse(_speedController.text),
                    glide: int.parse(_glideController.text),
                    turn: int.parse(_turnController.text),
                    fade: int.parse(_fadeController.text),
                    company: _companyController.text,
                  );

                  await DiscService().addDisc(newDisc).then((_) {
                    setState(() {
                      _discs = DiscService().fetchDiscs();
                    });
                  });

                  // Clear fields and close dialog
                  _nameController.clear();
                  _speedController.clear();
                  _glideController.clear();
                  _turnController.clear();
                  _fadeController.clear();
                  _companyController.clear();
                  Navigator.of(context).pop();
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
