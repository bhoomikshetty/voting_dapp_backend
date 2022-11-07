class Polls {
// question answer section ma polls..  checkbox type.
  final String questions;
  String id;

  Map getMap(String id, List options, String name, String des, String address) {
    Map inputFormat = {
      "$id": {
        "id": "$id",
        "address" : address,
        "options": options,
        "name": name,
        "description": des,
      },
    };
    return inputFormat;
  }

  Polls({required this.questions, required this.id});

  getInputFormat() {
    return {};
  }
}
