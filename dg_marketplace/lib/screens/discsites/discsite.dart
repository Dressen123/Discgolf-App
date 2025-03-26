import 'package:flutter/material.dart';
import 'package:dg_marketplace/screens/discmodel/discmodel.dart'; // Import DiscService
import 'package:dg_marketplace/screens/backend/database.dart'; // Import Disc model

class DiscListScreen extends StatefulWidget {
  @override
  _DiscListScreenState createState() => _DiscListScreenState();
}

class _DiscListScreenState extends State<DiscListScreen> {
  late Future<List<Disc>> _discs;

  @override
  void initState() {
    super.initState();
    _discs = DiscService().fetchDiscs(); // Fetch discs from the backend
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Discs")),
      body: FutureBuilder<List<Disc>>(
        future: _discs,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No discs available.'));
          }

          // Display discs in a ListView
          List<Disc> discs = snapshot.data!;
          return ListView.builder(
            itemCount: discs.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(discs[index].name),
                subtitle: Text(
                    'Speed: ${discs[index].speed}, Glide: ${discs[index].glide}, Turn: ${discs[index].turn}, Fade: ${discs[index].fade}'),
              );
            },
          );
        },
      ),
    );
  }
}
