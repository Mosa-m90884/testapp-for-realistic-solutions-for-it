import '../model/auth.dart';

class UserResponse {
  late User user;

  UserResponse.fromJson(Map<String, dynamic> json) {
    user = User.fromJson(json['data']);
  }
} //end of response
