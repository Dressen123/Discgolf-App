import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:dg_marketplace/screens/discmodel/discmodel.dart'; // Import Disc model

class DiscService {
  final String baseUrl = 'http://10.58.176.72:3000/api/discs';

  Future<List<Disc>> fetchDiscs() async {
    try {
      final response = await http.get(Uri.parse(baseUrl));

      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        return data.map((disc) => Disc.fromJson(disc)).toList();
      } else {
        throw Exception('Failed to load discs');
      }
    } catch (e) {
      print('Error fetching discs: $e');
      rethrow;
    }
  }

  // Add Disc to Backend API
  Future<void> addDisc(Disc disc) async {
    try {
      final response = await http.post(
        Uri.parse(baseUrl),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(disc.toJson()),
      );

      if (response.statusCode != 201) {
        throw Exception('Failed to add disc');
      }
    } catch (e) {
      print('Error adding disc: $e');
      rethrow;
    }
  }
}
