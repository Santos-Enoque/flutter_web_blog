import 'package:http/http.dart' as http;
import 'dart:convert';
class UserService{
  Future register(String username, String email, String password)async{
      String url = "https://disgusted-vapors.000webhostapp.com/register.php?username=$username&email=$email&password=$password";
      http.Response response = await http.get(url);
      Map<String, dynamic> body = jsonDecode(response.body);
      return body;
  }
}