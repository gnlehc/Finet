import 'package:finet/widgets/image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginForm extends StatelessWidget {
  @override
  final TextEditingController usernameController;
  final TextEditingController passwordController;
  final FocusNode usernameFocus = FocusNode();
  final FocusNode passwordFocus = FocusNode();

  LoginForm({
    Key? loginForm,
    required this.usernameController,
    required this.passwordController,
  }) : super(key: loginForm) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 100),
            const Image(
              image: AssetImage('assets/wallet.png'),
              width: 40,
              fit: BoxFit.scaleDown,
            ),
            // const SizedBox(height: 10),
            const Text(
              'Login',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                fontFamily: 'Gabarito',
                letterSpacing: 1.0,
              ),
            ),
            // const SizedBox(height: 10),
            TextButton(
              onPressed: () {
                // Navigate to the '/register' route
                Navigator.pushNamed(context, '/register');
              },
              child: const Text(
                'New? Sign up here.',
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            // const SizedBox(height: 40),
            Container(
              alignment: Alignment.topLeft,
              child: Text(
                'Username',
                style: TextStyle(
                  fontSize: 18.0,
                  fontFamily: 'Gabarito',
                  letterSpacing: 1.0,
                  color: Colors.green[600],
                ),
              ),
            ),
            // const SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(
                  color: const Color.fromARGB(255, 223, 223, 223),
                  width: 1.0,
                ),
              ),
              child: TextFormField(
                controller: usernameController,
                decoration: const InputDecoration(
                  hintText: 'janedoe',
                  hintStyle: TextStyle(
                      fontSize: 14, color: Colors.grey, fontFamily: 'Gabarito'),
                  border: InputBorder.none,
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green, width: 1.0),
                  ),
                ),
              ),
            ),
            // const SizedBox(height: 20),
            Container(
              alignment: Alignment.topLeft,
              child: Text(
                'Password',
                style: TextStyle(
                  fontSize: 18.0,
                  fontFamily: GoogleFonts.dmSans().fontFamily,
                  letterSpacing: 1.0,
                  color: Colors.green[600],
                ),
              ),
            ),
            // const SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(
                  color: const Color.fromARGB(255, 223, 223, 223),
                  width: 1.0,
                ),
              ),
              child: TextFormField(
                controller: passwordController,
                decoration: const InputDecoration(
                  hintText: 'Character must be between 6-8 characters',
                  hintStyle: TextStyle(
                      fontSize: 14, color: Colors.grey, fontFamily: 'Gabarito'),
                  border: InputBorder.none,
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green, width: 1.0),
                  ),
                ),
                obscureText: true,
              ),
            ),
            // const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green[600], // Background color
                foregroundColor: Colors.white, // Text color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0), // Rounded border
                  side: const BorderSide(color: Colors.blue), // Border color
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontFamily: 'Gabarito',
                    letterSpacing: 1.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}

class FadePageRouteBuilder<T> extends PageRouteBuilder<T> {
  final WidgetBuilder builder;

  FadePageRouteBuilder({required this.builder})
      : super(
          pageBuilder: (context, animation, secondaryAnimation) =>
              builder(context),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(1.0, 0.0);
            const end = Offset.zero;
            const curve = Curves.easeInOut;

            var tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
            var offsetAnimation = animation.drive(tween);

            return SlideTransition(position: offsetAnimation, child: child);
          },
        );
}
