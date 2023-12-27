import 'package:finet/widgets/image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Introduction extends StatefulWidget {
  @override
  _IntroductionState createState() => _IntroductionState();
}

class _IntroductionState extends State<Introduction> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
              child: ImageWidget(assetPath: 'assets/wallet.png', size: 40),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 4.0, horizontal: 40.0),
                  child: RichText(
                    text: TextSpan(
                      text: 'Ready to ease your ',
                      style: TextStyle(
                        fontSize: 38.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: GoogleFonts.dmSans().fontFamily,
                        color: Colors.black,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'money',
                          style: TextStyle(
                            fontSize: 38.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: GoogleFonts.dmSans().fontFamily,
                            foreground: Paint()
                              ..shader = LinearGradient(
                                colors: [
                                  Color(0xFF438BEF),
                                  Color(0xFF4C4BF3),
                                ],
                              ).createShader(
                                Rect.fromLTWH(0.0, 0.0, 600.0, 70.0),
                              ),
                          ),
                        ),
                        TextSpan(
                          text: ' management?',
                          style: TextStyle(
                            fontSize: 38.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: GoogleFonts.dmSans().fontFamily,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 14.0, horizontal: 30.0),
                  child: Text(
                    'Monitor your spending, track your income, and organize your investments in one place.',
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w500,
                      fontFamily: GoogleFonts.dmSans().fontFamily,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20.0, horizontal: 30.0),
                    child: DecoratedBox(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(colors: [
                            Color(0xFF438BEF),
                            Color(0xFF4C4BF3),
                          ]),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              foregroundColor: Colors.transparent,
                              // disabledForegroundColor: Colors.transparent,
                              shadowColor: Colors.transparent,
                              elevation: 0,
                            ),
                            onPressed: () {
                              Navigator.pushNamed(context, '/login');
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 20.0, horizontal: 20.0),
                              child: Text(
                                "I’ve used Finet before. Log me in!",
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: GoogleFonts.dmSans().fontFamily,
                                  color: Colors.white,
                                ),
                              ),
                            )))),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 5.0, horizontal: 30.0),
                  child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border(
                          top: BorderSide(color: Color(0xFF438BEF), width: 2),
                          left: BorderSide(color: Color(0xFF438BEF), width: 2),
                          right: BorderSide(color: Color(0xFF438BEF), width: 2),
                          bottom: BorderSide(
                              color: Color(0xFF438BEF),
                              width: 6), // Set a thicker border at the bottom
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
                            print("Sign up");
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 20.0, horizontal: 65.0),
                            child: Text(
                              "I'm new. Sign me up!",
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                                fontFamily: GoogleFonts.dmSans().fontFamily,
                                color: Color(0xFF438BEF),
                              ),
                            ),
                          ))),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
