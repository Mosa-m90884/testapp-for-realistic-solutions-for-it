import 'package:progress_dialog_null_safe/progress_dialog_null_safe.dart';

import '../../../imports.dart';
import '../Main.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    //_emailController.text="cvb";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          padding: EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppName(),
                const SizedBox(height: 30.0),
                TextBuilder(
                  text: 'Login',
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
                const SizedBox(height: 10.0),
                TextBuilder(
                  text: 'Please sign in to continue.',
                  fontSize: 15.0,
                  color: Colors.black,
                ),
                const SizedBox(height: 20.0),
                CustomTextField(
                    labelText: 'Email',
                    controller: _emailController,
                    hintText: 'example@example.com',
                    prefixIcon: Icons.email),
                const SizedBox(height: 20.0),
                CustomTextField(
                    labelText: 'Password',
                    controller: _passwordController,
                    hintText: 'Password',
                    prefixIcon: Icons.lock),
                Align(
                  alignment: Alignment.centerRight,
                  child: InkWell(
                    onTap: () {
                      _emailController.text = 'drghamdakhol@gmail.com';
                      _passwordController.text = '12345678';
                      //  print(_emailController.text);
                    },
                    child: TextBuilder(
                      text: 'Forgot Password',
                      fontSize: 12,
                      color: Colors.blue,
                    ),
                  ),
                ),
                const SizedBox(height: 30.0),
                Center(
                  child: MaterialButton(
                    height: 55.0,
                    color: Colors.black,
                    minWidth: 250,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    onPressed: () async {
                      ProgressDialog pr = ProgressDialog(
                        context,
                        type: ProgressDialogType.normal,
                        isDismissible: true,

                        /// your body here
                        customBody: LinearProgressIndicator(
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.blueAccent),
                          backgroundColor: Colors.white,
                        ),
                      );
                      final ScaffoldMessengerState Msg =
                          ScaffoldMessenger.of(context);
                      //Provider.of<AuthController>(context,listen: false).isLoggedIn =false;
                      if (_emailController.text != '' &&
                          _passwordController.text != '') {
                        pr.show();
                        await Provider.of<AuthController>(context,
                                listen: false)
                            .login(loginData: {
    "email": _emailController.text,
    "password": _passwordController.text,
    "c_password": _passwordController.text}
    );
                        if (Provider.of<AuthController>(context, listen: false)
                            .isLoggedIn) {
                          await Provider.of<ProductProvider>(context,
                                  listen: false)
                              .getProducts();
                          pr.hide();
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) => MainPage()));
                        }

                      } else {
                        Msg.showSnackBar(
                          const SnackBar(
                              backgroundColor: Colors.red,
                              content:
                                  TextBuilder(text: 'The fields is required')),
                        );
                      }
                    },
                    child: TextBuilder(
                      text: 'Login',
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                const SizedBox(height: 50.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextBuilder(
                      text: "Don't have an account? ",
                      color: Colors.black,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => Register()));
                      },
                      child: TextBuilder(
                        text: 'Sign Up',
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
