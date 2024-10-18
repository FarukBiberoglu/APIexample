import 'dart:convert';
import 'package:untitled2/utils/models/comments_model.dart';
import 'package:http/http.dart' as http;

import '../constans/api_constants.dart';

class APIServices {
  Future<List<CommentsModel>> getComments() async {
    final response = await http.get(Uri.parse(url));

    // HTTP isteğinin başarılı olup olmadığını kontrol et
    if (response.statusCode == 200) {
      List<CommentsModel> comments = [];
      List<dynamic> responseList = jsonDecode(response.body);

      // Döngüde sınırı kontrol et
      for (var i = 0; i < responseList.length; i++) {
        comments.add(CommentsModel.fromJson(responseList[i]));
      }

      return comments;
    } else {
      // Hata durumunda bir istisna fırlat
      throw Exception('Failed to load comments');
    }
  }
}
