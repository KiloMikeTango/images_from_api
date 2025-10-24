class ImageModel {
  int? id;
  String? url;
  String? title;

  ImageModel({this.id, this.url, this.title});

  ImageModel.fromJson(Map<String, dynamic> parsedJson) {
    id = parsedJson['id'];
    title = parsedJson['title'];
    url = parsedJson['url'];
  }
}
