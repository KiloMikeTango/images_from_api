class ImageModel {
  int? id;
  String? url;
  String? title;

  ImageModel({this.id, this.url, this.title});

  ImageModel.fromJson(Map<String, dynamic> decodedJson) {
    id = decodedJson['id'];
    title = decodedJson['title'];
    url = decodedJson['url'];
  }
}
