import 'package:flutter/material.dart';
import 'package:http/http.dart' show get;
import 'package:images_from_internet/src/widgets/image_list.dart';
import 'models/image_model.dart';
import 'dart:convert';

class App extends StatefulWidget {
  const App({super.key});

  @override
  createState() => _AppState();
}

class _AppState extends State<App> {
  int count = 0;
  List<ImageModel> images = [];

  void _fetchImage() async {
    if (count != 5) {
      count++;
      Uri parsedUrl = Uri.parse(
        "https://my-fake-json-api.netlify.app/images.json/$count",
      );

      var response = await get(parsedUrl);
      var jsonDecodedBody = json.decode(response.body);
      ImageModel imageModel = ImageModel.fromJson(jsonDecodedBody);

      setState(() {
        images.add(imageModel);
      });
    } else {
      count = 1;
      Uri parsedUrl = Uri.parse(
        "https://my-fake-json-api.netlify.app/images.json/$count",
      );

      var response = await get(parsedUrl);
      var jsonDecodedBody = json.decode(response.body);
      ImageModel imageModel = ImageModel.fromJson(jsonDecodedBody);
      setState(() {
        images.add(imageModel);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: ImageList(images: images),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _fetchImage();
          },

          foregroundColor: Colors.white,
          backgroundColor: Colors.blue,
          child: Icon(Icons.add),
        ),
        appBar: AppBar(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          title: Text("Let's See Images!"),
        ),
      ),
    );
  }
}
