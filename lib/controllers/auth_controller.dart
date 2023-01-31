import 'package:get_storage/get_storage.dart';
import 'package:untitled1/imports.dart';

import '../model/auth.dart';
import '../responses/user_response.dart';

class AuthController  with ChangeNotifier {
  var _user = User();
  bool _isLoggedIn=false;

  User get user=>_user;
  bool get isLoggedIn=>_isLoggedIn;
  @override
  void onInit() async {
  //  await genreController.getGenres();
    redirect();
    //super.onInit();
  }

  Future<void> redirect() async {
    var token = await GetStorage().read('login_token');

    if (token != null) {
     // getUser();
    }

  } //end of redirect

  Future<void> login({required Map<String, dynamic> loginData}) async {
  //  showLoading();
    _isLoggedIn = false;
    await GetStorage().write('login_token', null);

    var response = await Api.login(loginData: loginData);
    print(response);
    var userResponse = UserResponse.fromJson(response.data);
    await GetStorage().write('login_token', userResponse.user.token);
    _user = userResponse.user;
    _isLoggedIn = true;
     notifyListeners();
  //  hideLoading();

  } //end of login
  Future<void> register({required Map<String, dynamic> loginData}) async {
    //  showLoading();
    _isLoggedIn = false;
    await GetStorage().write('login_token', null);


    var response = await Api.register(registerData: loginData);
    var userResponse = UserResponse.fromJson(response.data);
    await GetStorage().write('login_token', userResponse.user.token);
    _user = userResponse.user;
    _isLoggedIn = true;
    notifyListeners();
    //  hideLoading();

  }
}