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

  @override
  void initState() {
    super.initState();
    _discs = DiscService()
        .fetchDiscs(); // Fetch discs from the backend "DiscService() is function imported from another file."
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Discs")),
      body: FutureBuilder<List<Disc>>(
        future: _discs,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // THis condition checks if the Future is still in progress, it this case it shows another function to show that it is still in progress
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
