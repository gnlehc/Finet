import 'dart:convert';
import 'dart:io';

import 'package:finet/model/login_response_model.dart';
import 'package:finet/user_auth/firebase_auth_services.dart';
import 'package:finet/views/pages/home_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  LoginFormState createState() {
    return LoginFormState();
  }
}

class LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscurePassword = true;

  @override
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
              Center(
                  child: Padding(
                padding: const EdgeInsets.only(right: 40, left: 40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 40),
                    const Text(
                      'Login',
                      style: TextStyle(
                          fontFamily: 'DMSans',
                          fontWeight: FontWeight.w600,
                          fontSize: 28.0,
                          color: Colors.black),
                    ),
                    const SizedBox(height: 12),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/register');
                      },
                      child: const Text(
                        'New? Register here.',
                        style: TextStyle(
                          fontFamily: 'DMSans',
                          fontWeight: FontWeight.w600,
                          fontSize: 14.0,
                          color: Color.fromARGB(255, 74, 108, 255),
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Email',
                            style: TextStyle(
                              fontSize: 14.0,
                              fontFamily: 'DMSans',
                              letterSpacing: 1.0,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF438BEF),
                            ),
                          ),
                          const SizedBox(height: 12),
                          TextFormField(
                            controller: _emailController,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 12.0, vertical: 12.0),
                              hintText: 'janedoe@gmail.com',
                              hintStyle: const TextStyle(
                                fontFamily: 'DMSans',
                                fontWeight: FontWeight.w500,
                                fontSize: 13.0,
                                color: Colors.grey,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: const BorderSide(
                                  color: Color.fromARGB(255, 224, 224, 224), // Light grey color
                                  width: 1.0,
                                ),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your email';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 18),
                          const Text(
                            'Password',
                            style: TextStyle(
                              fontSize: 14.0,
                              fontFamily: 'DMSans',
                              letterSpacing: 1.0,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF438BEF),
                            ),
                          ),
                          const SizedBox(height: 12),
                          TextFormField(
                            obscureText: true,
                            controller: _passwordController,
                            decoration: InputDecoration(
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _obscurePassword
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: const Color(0xFF438BEF),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _obscurePassword = !_obscurePassword;
                                    });
                                  },
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 12.0, vertical: 12.0),
                                hintText: '',
                                hintStyle: const TextStyle(
                                  fontFamily: 'DMSans',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12.0,
                                  color:
                                      Colors.grey, // Customize the text color
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: const BorderSide(
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
                          const SizedBox(height: 24),
                          Align(
                              alignment: Alignment.centerRight,
                              child: DecoratedBox(
                                  decoration: BoxDecoration(
                                    gradient: const LinearGradient(colors: [
                                      Color(0xFF438BEF),
                                      Color(0xFF4C4BF3),
                                    ]),
                                    borderRadius: BorderRadius.circular(20),
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
                                          _login();
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
                                            color: Colors.white,
                                          ),
                                        ),
                                      )))),
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

  Future<void> _login() async {
  String email = _emailController.text;
  String password = _passwordController.text;
  const String url = "https://10.0.2.2:7002/api/login";

  final Map<String, String> headers = {
    'Content-Type': 'application/json',
  };
  final Map<String, dynamic> data = {
    'email': email,
    'password': password,
  };

  try {
    final apiUrl = Uri.parse(url);
    final httpClient = HttpClient();

    // Open a connection
    final request = await httpClient.postUrl(apiUrl);

    // Set headers
    headers.forEach((key, value) {
      request.headers.add(key, value);
    });

    // Convert data to JSON and write it to the request
    request.write(jsonEncode(data));

    // Send the request
    final response = await request.close();

    // Check if the request was successful (status code 200)
    if (response.statusCode == HttpStatus.ok) {
      // Read the response
      final responseBody = await response.transform(utf8.decoder).join();

      // Parse the response using LoginResponseDTO
      final jsonResponse = jsonDecode(responseBody);

      // Extract the token and data
      final token = jsonResponse['Token'];
      final loginResponseData = LoginResponseDTO.fromJson(jsonResponse['Data']);

      // Access properties of the parsed response as needed
      print('Token: $token');
      print('StatusCode: ${loginResponseData.statusCode}');
      print('ErrorMessage: ${loginResponseData.errorMessage}');
      print('UserID: ${loginResponseData.userId}');
      print('Username: ${loginResponseData.username}');
    } else {
      print('Request failed with status: ${response.statusCode}');
    }
  } catch (error) {
    print('Error during API call: $error');
  }
}


  // final http.Response response = await http.post(
      //   Uri.parse(url),
      //   headers: headers,
      //   body: jsonEncode(data),
      // );
      // final Map<String, dynamic> responseData = json.decode(response.body);
      // final LoginResponseDTO loginResponse = LoginResponseDTO.fromJson(responseData);
      // if (loginResponse.statusCode != null) {
      // print("Login Response: ${loginResponse.statusCode}");
      // }else{
      //   print("Login Response null");
      // }
      // if(loginResponse.statusCode == 200){
      //   print("Login successful");
      //   Navigator.pushNamed(context, '/home');
      // }else{
      //   // print("Login Response null");
      // }


  // User? user =
  //     await _auth.signInWithEmailAndPassword(context, email, password);

  // if (user != null) {
  //   print("User successfully logged in");
  //   Provider.of<UserProvider>(context, listen: false)
  //       .setUserEmail(user.email);
  //   Navigator.pushNamed(context, '/home');
  // } else {
  //   print("Error in logging in");
  // }
}
