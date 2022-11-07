class suggestionBox{
  // Question
  // textbox,
    
  final String question;
  final String id;
  final String suggestions;
  suggestionBox({required this.question,required this.suggestions,required this.id});
    
  Map getMap(String id, String address, {String? text, String? image}) {
    Map inputFormat = {
      "$id": {
        "id": "$id",
        "address": address,
        "content": {
          "text": text ?? "",
          "file_type": text != null ? "text" : "image",
        }
      },
    };
    return inputFormat;
  }

}