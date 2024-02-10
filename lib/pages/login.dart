import 'package:finet/model/quickaddtrans.dart';
import 'package:finet/user_auth/firebase_auth_services.dart';
import 'package:finet/user_auth/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';


import 'package:provider/provider.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  LoginFormState createState() {
    return LoginFormState();
  }
}

class LoginFormState extends State<LoginForm> {
  final FirebaseAuthService _auth = FirebaseAuthService();
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(top: 40, right: 20, left: 20),
                  child: Image(
                    image: AssetImage('assets/img/wallet.png'),
                    width: 40,
                    height: 40,
                  ),
                ),
              ),
              Center(
                  child: Padding(
                padding: const EdgeInsets.only(right: 20, left: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 120),
                    Text(
                      'Login',
                      style: TextStyle(
                          fontFamily: 'DMSans',
                          fontWeight: FontWeight.w600,
                          fontSize: 38.0,
                          color: Colors.black),
                    ),
                    SizedBox(height: 12),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/register');
                      },
                      child: Text(
                        'New? Register here.',
                        style: TextStyle(
                          fontFamily: 'DMSans',
                          fontWeight: FontWeight.w600,
                          fontSize: 16.0,
                          color: Color.fromARGB(255, 74, 108, 255),
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                    SizedBox(height: 24),
                    Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Email',
                            style: TextStyle(
                              fontSize: 16.0,
                              fontFamily: 'DMSans',
                              letterSpacing: 1.0,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF438BEF),
                            ),
                          ),
                          SizedBox(height: 12),
                          TextFormField(
                            controller: _emailController,
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 15.0, vertical: 12.0),
                                hintText: 'janedoe@gmail.com',
                                hintStyle: TextStyle(
                                  fontFamily: 'DMSans',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16.0,
                                  color: Colors.grey,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide(
                                    color: Color(0xFF438BEF),
                                    width: 1.0,
                                  ),
                                )),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your email';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 24),
                          Text(
                            'Password',
                            style: TextStyle(
                              fontSize: 16.0,
                              fontFamily: 'DMSans',
                              letterSpacing: 1.0,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF438BEF),
                            ),
                          ),
                          SizedBox(height: 12),
                          TextFormField(
                            obscureText: true,
                            controller: _passwordController,
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 15.0, vertical: 12.0),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide(
                                    color: Color(0xFF438BEF),
                                    width: 1.0,
                                  ),
                                )),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your password';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 24),
                          DecoratedBox(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                border: const Border(
                                  top: BorderSide(
                                      color: Color(0xFF438BEF), width: 2),
                                  left: BorderSide(
                                      color: Color(0xFF438BEF), width: 2),
                                  right: BorderSide(
                                      color: Color(0xFF438BEF), width: 2),
                                  bottom: BorderSide(
                                      color: Color(0xFF438BEF), width: 6),
                                ),
                              ),
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.transparent,
                                    foregroundColor: Colors.transparent,
                                    shadowColor: Colors.transparent,
                                    elevation: 0,
                                  ),
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      _login(context);
                                    }
                                  },
                                  child: const Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 10.0, horizontal: 10.0),
                                    child: Text(
                                      "Login",
                                      style: TextStyle(
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: 'DMSans',
                                        color: Color(0xFF438BEF),
                                      ),
                                    ),
                                  )))
                        ],
                      ),
                    ),
                  ],
                ),
              )),
            ],
          ),
        ));
  }

  void _login(BuildContext context) async {
    String email = _emailController.text;
    String password = _passwordController.text;

    User? user =
        await _auth.signInWithEmailAndPassword(context, email, password);

    if (user != null) {
      print("User successfully logged in");
      Provider.of<UserProvider>(context, listen: false)
          .setUserEmail(user.email);
      Navigator.pushNamed(context, '/home');
    } else {
      print("Error in creating user");
    }
  }

}
