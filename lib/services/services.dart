import 'dart:convert';

import 'package:ipfs_client_flutter/ipfs_client_flutter.dart';
import 'dart:js' as js;
import 'package:http/http.dart' as http;

class IPFSServices {
  //  var input = {
//                               "address": "dkvubefu",
//                               "content": {
//                                 'images': '',
//                                 'text': '',
//                               }
//                             };
//                             String jinput = json.encode(input);
//                             var some = await createAlbum(jinput);
//                             Map ad = json.decode(some.body.toString());
//                             var ssd = await getAl(ad['link'][0]['path']); // getting the path of the data.
//                             var finalOp = json.decode(ssd.body); // _toJson
//                             Map finalMap = Map.from(finalOp); // toMap
//                             Map finafinalMap =
//                                 json.decode(finalMap.keys.toList()[0]); //_toJson of key(main content)

  Future createAlbum(String title) async {
    return await http.post(
      Uri.parse('http://localhost:8000/upload'),
      headers: <String, String>{
        "Content-Type": "application/x-www-form-urlencoded",
      },
      encoding: Encoding.getByName('utf-8'),
      body: title,
    );
  }

  Future<http.Response> getAl(String title) {
    return http.get(
      Uri.parse(title),
    );
  }
}
