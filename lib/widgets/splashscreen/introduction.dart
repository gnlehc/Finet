import 'package:flutter/material.dart';

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
          const Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
              child: Image(
                image: AssetImage('assets/img/wallet.png'),
                width: 40, // Set the width
                height: 40,
              ),
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
                      style: const TextStyle(
                        fontSize: 38.0,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'DMSans',
                        color: Colors.black,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'money',
                          style: TextStyle(
                            fontSize: 38.0,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'DMSans',
                            foreground: Paint()
                              ..shader = const LinearGradient(
                                colors: [
                                  Color(0xFF438BEF),
                                  Color(0xFF4C4BF3),
                                ],
                              ).createShader(
                                const Rect.fromLTWH(0.0, 0.0, 600.0, 70.0),
                              ),
                          ),
                        ),
                        const TextSpan(
                          text: ' management?',
                          style: TextStyle(
                            fontSize: 38.0,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'DMSans',
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 14.0, horizontal: 30.0),
                  child: Text(
                    'Monitor your spending, track your income, and organize your investments in one place.',
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'DMSans',
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
                              Navigator.pushNamed(context, '/login');
                            },
                            child: const Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 20.0, horizontal: 20.0),
                              child: Text(
                                "I’ve used Finet before. Log me in!",
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'DMSans',
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
                        border: const Border(
                          top: BorderSide(color: Color(0xFF438BEF), width: 2),
                          left: BorderSide(color: Color(0xFF438BEF), width: 2),
                          right: BorderSide(color: Color(0xFF438BEF), width: 2),
                          bottom: BorderSide(
                              color: Color(0xFF438BEF),
                              width: 6),
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
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 20.0, horizontal: 65.0),
                            child: Text(
                              "I'm new. Sign me up!",
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'DMSans',
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
