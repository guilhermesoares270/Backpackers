class ImageModel{
  int id;
  String url;
  String title;

  ImageModel(this.id, this.url, this.title);

  ImageModel.fromJson(Map<String, dynamic> convertedJson){
      id = convertedJson['id'];
      url = convertedJson['url'];
      title = convertedJson['title'];
  }
}