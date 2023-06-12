import '../models/post.dart';
import 'package:http/http.dart' as http;

class RemoteService {
  Future<List<User>?> getPosts() async {
    var client = http.Client();
    var uri = Uri.parse('http://127.0.0.1:8000/api/users/');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return userFromJson(json);
    }
    return null;
  }
}
