class PostModel {
  //image , title bar
  String id;
  String? image_url;
  String title_bar;
  String address;
  String? text;
  PostModel({
    required this.address,
    required this.id,
    required this.title_bar,
    this.image_url,
    this.text,
  });

  Map getMap() {
    Map inputFormat = {
      "$id": {
        "id": "$id",
        "address": address,
        "content": {
          "text": text ?? "",
          "image": image_url ?? "",
          "file_type": text != null ? "text" : "image",
        }
      },
    };
    return inputFormat;
  }
}
