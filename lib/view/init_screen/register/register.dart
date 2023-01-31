import 'package:flutter/material.dart';
import 'package:progress_dialog_null_safe/progress_dialog_null_safe.dart';
import 'package:untitled1/view/init_screen/Main.dart';
import '../../../imports.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _cpasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppName(),
              const SizedBox(height: 30.0),
              TextBuilder(
                  text: 'Create Account',
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold),
              const SizedBox(height: 20.0),
              CustomTextField(
                  labelText: 'name',
                  controller: _nameController,
                  hintText: 'name',
                  prefixIcon: Icons.email),
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
              const SizedBox(height: 20.0),
              CustomTextField(
                  labelText: 'Confirm Password',
                  controller: _cpasswordController,
                  hintText: 'Confirm Password',
                  prefixIcon: Icons.lock),
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
                    print(_emailController.text);
                    ScaffoldMessengerState Msg = ScaffoldMessenger.of(context);
                    if (
                    _nameController.text !=null&&
                    _emailController.text != '' &&
                        _passwordController.text != '' &&
                        _cpasswordController.text != '') {
                      pr.show();
                   await   Provider.of<AuthController>(context, listen: false)
                          .register(loginData: {
                            'name':_nameController.text,
                        'email': _emailController.text,
                        'password': _passwordController.text,
                        'c_password': _cpasswordController.text
                      });
                      if (Provider.of<AuthController>(context, listen: false)
                          .isLoggedIn) {
                        pr.hide();
                        Provider.of<ProductProvider>(context, listen: false)
                            .getProducts();
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
                    text: 'Sign Up',
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
                    text: "Have have an account? ",
                    color: Colors.black,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context, MaterialPageRoute(builder: (_) => Login()));
                    },
                    child: TextBuilder(
                      text: 'Sign In',
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
