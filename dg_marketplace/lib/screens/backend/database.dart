import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:dg_marketplace/screens/discmodel/discmodel.dart'; // Import the Disc model

class DiscService {
  // Function to fetch discs from the Node.js backend API
  Future<List<Disc>> fetchDiscs() async {
    try {
      final response =
          await http.get(Uri.parse('http://localhost:3000/api/discs'));

      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        List<Disc> discs = data.map((disc) => Disc.fromJson(disc)).toList();
        return discs;
      } else {
        throw Exception('Failed to load discs');
      }
    } catch (e) {
      print('Error fetching discs: $e');
      rethrow;
    }
  }
}
