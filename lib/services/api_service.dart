import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sistem_kel3/models/pengumuman.dart';

class ApiService {
  static const String baseUrl = 'http://192.168.1.2/api';

  static Future<List<Pengumuman>> fetchPengumuman() async {
    final response = await http.get(Uri.parse('$baseUrl/pengumuman'));

    if (response.statusCode == 200) {
      List jsonData = json.decode(response.body);
      return jsonData.map((e) => Pengumuman.fromJson(e)).toList();
    } else {
      throw Exception('Gagal memuat pengumuman');
    }
  }
}
