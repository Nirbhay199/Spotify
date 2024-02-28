import 'package:firebase/constant/api_constant.dart';
import 'package:firebase/web/ui/add_musician/model/song.dart';
import 'package:http/http.dart' as http;

import 'package:http_parser/http_parser.dart';
class ApiHandler {
  Future<String> uploadMultiple(type, files, {List<Song>? songNames}) async {

    var formData = http.MultipartRequest(
        'POST', Uri.parse('$appBaseUrl$uploadUrl'));
    for (int i = 0; i < files.length; i++) {
      formData.files.add(
        http.MultipartFile.fromBytes(
          'files',
          files[i].bytes!.toList(),
          filename: songNames!=null ? songNames[i].songName.text : files[i].name,
          contentType: MediaType(type, files[i].extension ?? 'jpeg'),
        ),
      );
    }
    var response = await formData.send();
    if (response.statusCode == 200) {
      var responseData = await response.stream.bytesToString();
      print(responseData);
      return responseData;
    } else {
      return 'Failed to upload image. Status code: ${response.statusCode}';
    }
  }
}
