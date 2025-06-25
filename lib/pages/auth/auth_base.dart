// import 'package:flutter/material.dart';
// // import 'package:stockallref/components/main_button.dart';
// // import 'package:stockallref/components/main_button_transparent.dart';
// // import 'package:stockallref/constants/images.dart';
// // import 'package:stockallref/pages/auth/login.dart';
// // import 'package:stockallref/pages/auth/sign_up.dart';

// class AuthBase extends StatelessWidget {
//   const AuthBase({super.key});

//   @override
//   Widget build(BuildContext context) {
//     print('Entered AuthBase Build');
//     return Scaffold(
//       // backgroundColor: Colors.white,
//       body: SingleChildScrollView(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Container(
//               height:
//                   MediaQuery.of(context).size.height * 0.56,
//               color: Colors.white,
//               child: Stack(
//                 children: [
//                   Center(
//                     child: Positioned(
//                       top: 20,
//                       child: Image.asset(
//                         'splashImage',
//                         height: 420,
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                   ),
//                   Container(
//                     width: double.infinity,
//                     color: const Color.fromARGB(
//                       210,
//                       255,
//                       255,
//                       255,
//                     ),
//                     child: Center(
//                       child: Image.asset(
//                         'mainLogoFull',
//                         height: 30,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             ClipRRect(
//               borderRadius: BorderRadius.only(
//                 topLeft: Radius.circular(20),
//                 topRight: Radius.circular(20),
//               ),
//               child: Container(
//                 padding: EdgeInsets.symmetric(
//                   horizontal: 30,
//                 ),
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                 ),
//                 child: Padding(
//                   padding: const EdgeInsets.only(top: 20.0),
//                   child: Column(
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.symmetric(
//                           horizontal: 50.0,
//                         ),
//                         child: Text(
//                           textAlign: TextAlign.center,
//                           style: TextStyle(
//                             height: 0,
//                             color: Colors.grey.shade900,
//                             fontSize: 30,
//                             fontWeight: FontWeight.bold,
//                           ),
//                           'Welcome',
//                         ),
//                       ),
//                       SizedBox(height: 20),
//                       Text(
//                         textAlign: TextAlign.center,
//                         style: TextStyle(fontSize: 14),
//                         'Your smart inventory companion. Track stock, manage sales, and grow your business with ease — all in one place. Let\'s simplify your workflow and boost your efficiency. 🚀',
//                       ),
//                       SizedBox(height: 20),

//                       Padding(
//                         padding: const EdgeInsets.symmetric(
//                           horizontal: 20.0,
//                         ),
//                         child: Column(
//                           children: [
//                             // MainButtonBlue(
//                             //   action: () {
//                             //     // Navigator.push(
//                             //     //   context,
//                             //     //   MaterialPageRoute(
//                             //     //     builder: (context) {
//                             //     //       return AuthBase();
//                             //     //     },
//                             //     //   ),
//                             //     // );
//                             //   },
//                             //   text: 'Create an Account',
//                             // ),
//                             // SizedBox(height: 10),
//                             // MainButtonTransparent(
//                             //   text: 'Login',
//                             //   action: () {
//                             //     // Navigator.push(
//                             //     //   context,
//                             //     //   MaterialPageRoute(
//                             //     //     builder: (context) {
//                             //     //       return Login();
//                             //     //     },
//                             //     //   ),
//                             //     // );
//                             //   },
//                             // ),
//                             SizedBox(height: 50),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';

// class AuthBase extends StatelessWidget {
//   const AuthBase({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(body: Center(child: Text('Made it')));
//   }
// }

import 'package:flutter/material.dart';
// import 'package:stockallref/components/email_textfield.dart';
// import 'package:stockallref/components/general_textfield.dart';
// import 'package:stockallref/components/main_button.dart';
// import 'package:stockallref/components/password_textfield.dart';
// import 'package:stockallref/constants/functions.dart';
// import 'package:stockallref/constants/images.dart';
// import 'package:stockallref/supabase/auth_service.dart';
// import 'package:stockallref/theme/theme.dart';

class AuthBase extends StatefulWidget {
  const AuthBase({super.key});

  @override
  State<AuthBase> createState() => _AuthBaseState();
}

class _AuthBaseState extends State<AuthBase> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController state = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController confirmPassword =
      TextEditingController();
  bool isLoading = false;

  // final supabase = AuthService();
  // Future<void> createAccount() async {
  //   try {
  //     if (email.text.isEmpty ||
  //         password.text.isEmpty ||
  //         confirmPassword.text.isEmpty ||
  //         name.text.isEmpty ||
  //         state.text.isEmpty ||
  //         phone.text.isEmpty) {
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(
  //           content: Text(
  //             'All Fields must be set before account can be created',
  //           ),
  //         ),
  //       );
  //     } else if (!isValidEmail(email.text)) {
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(content: Text('Email Not Valid')),
  //       );
  //     } else if (password.text != confirmPassword.text) {
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(
  //           content: Text('Password Does not match'),
  //         ),
  //       );
  //     } else {
  //       setState(() {
  //         isLoading = true;
  //       });
  //       await supabase.createAccount(
  //         email: email.text.trim(),
  //         password: password.text.trim(),
  //         name: name.text.trim(),
  //         phone: phone.text.trim(),
  //         state: state.text.trim(),
  //       );
  //       if (mounted) {
  //         Navigator.of(context).pop();
  //       }
  //     }
  //   } catch (e) {
  //     setState(() {
  //       isLoading = false;
  //     });
  //     if (mounted) {
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(
  //           content: Text(
  //             'Failed to create Account: ${e.toString().split(',')[0].split(':')[1]}',
  //           ),
  //         ),
  //       );
  //     }
  //   }
  // }

  @override
  void dispose() {
    super.dispose();
    email.dispose();
    password.dispose();
    confirmPassword.dispose();
    name.dispose();
    phone.dispose();
    state.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:
          () =>
              FocusManager.instance.primaryFocus?.unfocus(),
      child: SafeArea(
        child: Stack(
          children: [
            Scaffold(
              body: Center(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15.0,
                    ),
                    child: Column(
                      children: [
                        Image.asset(
                          'mainLogoFull',
                          height: 25,
                        ),
                        SizedBox(height: 15),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 30,
                            vertical: 15,
                          ),
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(5),
                            boxShadow: [
                              BoxShadow(
                                color: const Color.fromARGB(
                                  27,
                                  0,
                                  0,
                                  0,
                                ),
                                blurRadius: 10,
                              ),
                            ],
                            color: Colors.white,
                          ),
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(
                                  vertical: 5.0,
                                ),
                            child: Column(
                              mainAxisAlignment:
                                  MainAxisAlignment.center,
                              spacing: 5,
                              children: [
                                Text(
                                  style: TextStyle(
                                    fontSize: 27,
                                    fontWeight:
                                        FontWeight.w500,
                                  ),
                                  'Create Account',
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(
                                        horizontal: 5.0,
                                      ),
                                  child: Text(
                                    textAlign:
                                        TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight:
                                          FontWeight.normal,
                                      color:
                                          Colors
                                              .grey
                                              .shade500,
                                    ),
                                    'Enter All necessary info below to Create an account.',
                                  ),
                                ),
                                // SizedBox(height: 10),
                                // GeneralTextfield(
                                //   controller: name,
                                //   label: 'Enter Name',
                                // ),
                                // SizedBox(height: 5),
                                // TextFieldEmail(
                                //   controller: email,
                                // ),
                                // SizedBox(height: 5),
                                // TextFieldPassword(
                                //   controller: password,
                                //   label: 'Enter Password',
                                // ),
                                // SizedBox(height: 5),
                                // TextFieldPassword(
                                //   controller:
                                //       confirmPassword,
                                //   label: 'Confirm Password',
                                // ),
                                // SizedBox(height: 5),
                                // GeneralTextfield(
                                //   controller: phone,
                                //   label:
                                //       'Enter Phone Number',
                                //   isPhone: true,
                                // ),
                                // SizedBox(height: 5),
                                // GeneralTextfield(
                                //   controller: state,
                                //   label: 'Enter State',
                                // ),
                                // SizedBox(height: 10),
                                // MainButtonBlue(
                                //   action: () async {
                                //     await createAccount();
                                //   },
                                //   text: 'Sign Up',
                                // ),
                                SizedBox(height: 10),
                                Material(
                                  color: Colors.transparent,
                                  child: Ink(
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.of(
                                          context,
                                        ).pop();
                                      },
                                      child: Container(
                                        padding:
                                            EdgeInsets.symmetric(
                                              vertical: 5,
                                            ),
                                        child: Center(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment
                                                    .center,
                                            spacing: 5,
                                            children: [
                                              Text(
                                                style: TextStyle(
                                                  color:
                                                      Colors
                                                          .grey
                                                          .shade800,
                                                  fontWeight:
                                                      FontWeight
                                                          .normal,
                                                ),
                                                'Already Have an Account? ',
                                              ),
                                              // Text(
                                              //   style: TextStyle(
                                              //     color: secondary(
                                              //       context,
                                              //     ),
                                              //     fontWeight:
                                              //         FontWeight
                                              //             .w700,
                                              //   ),
                                              //   'Login',
                                              // ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Visibility(
              visible: isLoading,
              child: Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
