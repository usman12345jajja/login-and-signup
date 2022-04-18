import 'package:flutter/material.dart';
import 'package:login/pages/forgot_password.dart';
import 'package:login/pages/signup.dart';
import 'package:login/pages/user/user_main.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();

  var email = '';
  var password = '';

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  userLogin() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => UserMain(),
      ),
    );
  }

  // ignore: must_call_super
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
          child: ListView(
            children: [
              Container(
                padding: EdgeInsets.only(top: 10),
                child: Column(
                  children: [
                    Image.asset('assets/download.png'),
                  ],
                ),
              ),
              Container(
                child: Text(
                  "Welcome Back!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.cyan,
                    fontSize: 25,
                  ),
                ),
              ),
              Container(
                child: Text(
                  "Sign in to continue",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.only(top: 1),
                margin: EdgeInsets.symmetric(vertical: 10),
                child: TextFormField(
                    autofocus: false,
                    decoration: InputDecoration(
                      hintText: 'Email: ',
                      prefixIcon: Icon(Icons.email),
                      border: OutlineInputBorder(),
                      errorStyle: TextStyle(color: Colors.redAccent),
                    ),
                    controller: emailController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Enter Email';
                      } else if (!value.contains('@')) {
                        return 'Please Enter Valid Email';
                      }
                      return null;
                    }),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: TextFormField(
                    autofocus: false,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Password: ',
                      prefixIcon: Icon(Icons.lock),
                      border: OutlineInputBorder(),
                      errorStyle: TextStyle(
                        color: Colors.redAccent,
                        fontSize: 15,
                      ),
                    ),
                    controller: passwordController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Enter Password';
                      }
                      return null;
                    }),
              ),
              SizedBox(height: 10),
              Container(
                margin: EdgeInsets.only(left: 60),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          setState(() {
                            email = emailController.text;
                            password = passwordController.text;
                          });
                          userLogin();
                        }
                      },
                      child: Text(
                        'SIGNIN',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () => {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ForgotPassword(),
                          ),
                        ),
                      },
                      child: Text(
                        'Forgot Password ?',
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: new Container(
                          margin: const EdgeInsets.only(left: 10, right: 20),
                          child: Divider(
                            color: Colors.black,
                            height: 36,
                          ),
                        ),
                      ),
                      Text(
                        "or",
                        style: TextStyle(fontSize: 25),
                      ),
                      Expanded(
                        child: new Container(
                          margin: const EdgeInsets.only(
                            left: 10,
                            right: 15,
                          ),
                          color: Colors.black54,
                          height: 1,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 8),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () => {
                        Navigator.pushAndRemoveUntil(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (context, a, b) => Signup(),
                              transitionDuration: Duration(seconds: 0),
                            ),
                            (route) => false)
                      },
                      child: Text(
                        'Create An Account',
                        style: TextStyle(fontSize: 20, color: Colors.black54),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
