import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiPage extends StatefulWidget {
  @override
  _ApiPageState createState() => _ApiPageState();
}

class _ApiPageState extends State<ApiPage> {
  String _data = "Press the button to fetch data";

  Future<void> _fetchData() async {
    final url = 'https://jsonplaceholder.typicode.com/posts/1'; // Example API URL
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          _data = data['title'] ?? "No data found";
        });
      } else {
        setState(() {
          _data = "Failed to load data";
        });
      }
    } catch (e) {
      setState(() {
        _data = "Error: $e";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('API Integration'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              _data,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _fetchData,
              child: Text('Fetch Data'),
            ),
          ],
        ),
      ),
    );
  }
}

