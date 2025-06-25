import 'package:flutter/material.dart';
// import 'package:stockallref/components/main_button.dart';
// import 'package:stockallref/components/main_button_transparent.dart';
import 'package:stockallref/constants/images.dart';
// import 'package:stockallref/pages/auth/login.dart';
// import 'package:stockallref/pages/auth/sign_up.dart';

class AuthBase extends StatelessWidget {
  const AuthBase({super.key});

  @override
  Widget build(BuildContext context) {
    print('Entered AuthBase Build');
    return Scaffold(
      // backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height:
                  MediaQuery.of(context).size.height * 0.56,
              color: Colors.white,
              child: Stack(
                children: [
                  Center(
                    child: Positioned(
                      top: 20,
                      child: Image.asset(
                        splashImage,
                        height: 420,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    color: const Color.fromARGB(
                      210,
                      255,
                      255,
                      255,
                    ),
                    child: Center(
                      child: Image.asset(
                        mainLogoFull,
                        height: 30,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 30,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 50.0,
                        ),
                        child: Text(
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            height: 0,
                            color: Colors.grey.shade900,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                          'Welcome',
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 14),
                        'Your smart inventory companion. Track stock, manage sales, and grow your business with ease — all in one place. Let\'s simplify your workflow and boost your efficiency. 🚀',
                      ),
                      SizedBox(height: 20),

                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20.0,
                        ),
                        child: Column(
                          children: [
                            // MainButtonBlue(
                            //   action: () {
                            //     // Navigator.push(
                            //     //   context,
                            //     //   MaterialPageRoute(
                            //     //     builder: (context) {
                            //     //       return SignUp();
                            //     //     },
                            //     //   ),
                            //     // );
                            //   },
                            //   text: 'Create an Account',
                            // ),
                            // SizedBox(height: 10),
                            // MainButtonTransparent(
                            //   text: 'Login',
                            //   action: () {
                            //     // Navigator.push(
                            //     //   context,
                            //     //   MaterialPageRoute(
                            //     //     builder: (context) {
                            //     //       return Login();
                            //     //     },
                            //     //   ),
                            //     // );
                            //   },
                            // ),
                            SizedBox(height: 50),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';

// class AuthBase extends StatelessWidget {
//   const AuthBase({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(body: Center(child: Text('Made it')));
//   }
// }
