import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ImageRepository {
  late final int userId;
  Future<List<Map<String, dynamic>>> fetchImages() async {
    final url =
        Uri.parse('https://ub-office.mn/mobile/room/tools/data/$userId');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        List<Map<String, dynamic>> images =
            List<Map<String, dynamic>>.from(data);
        print(response.body);

        print('success i');
        return images;
      } else {
        print(response.body);
        throw Exception('Failed to fetch images');
      }
    } catch (e) {
      rethrow;
    }
  }
}

class ImageListPage extends StatefulWidget {
  const ImageListPage({super.key});

  @override
  _ImageListPageState createState() => _ImageListPageState();
}

class _ImageListPageState extends State<ImageListPage> {
  late ImageRepository _repository;
  List<Map<String, dynamic>> _images = [];
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _repository = ImageRepository();
    _fetchImages();
  }

  Future<void> _fetchImages() async {
    setState(() {
      _isLoading = true;
    });

    try {
      List<Map<String, dynamic>> images = await _repository.fetchImages();
      setState(() {
        _images = images;
      });
    } catch (e) {
      print('Error: $e');
      // Handle the exception or display an error message
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image List'),
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: _images.length,
              itemBuilder: (context, index) {
                final image = _images[index];
                return InkWell(
                  onTap: () {
                    print(image['image']);
                  },
                  child: ListTile(
                    title: Text(image['name']),
                    subtitle: Text(image['description']),
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                        'https://ub-office.mn/${image['url']}',
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
