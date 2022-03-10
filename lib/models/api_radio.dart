import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:rawa_fm/models/radio_modal.dart';

class ApiRadio{
  Future<RadioModal> _fetchRadio(String url) async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return RadioModal.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load album');
    }
  }

  Stream<RadioModal> getRadio(int index) => Stream.periodic(const Duration(seconds: 1)).asyncMap(
        (_) => _fetchRadio('https://rawa.fm/api/now/$index'),
  );
}