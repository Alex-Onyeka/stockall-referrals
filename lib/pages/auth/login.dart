import 'package:flutter/material.dart';
import 'package:stockallref/components/email_textfield.dart';
import 'package:stockallref/components/main_button.dart';
import 'package:stockallref/components/password_textfield.dart';
import 'package:stockallref/constants/functions.dart';
import 'package:stockallref/constants/images.dart';
import 'package:stockallref/supabase/auth_service.dart';
import 'package:stockallref/theme/theme.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  final supabase = AuthService();
  bool isLoading = false;

  Future<void> login() async {
    try {
      if (email.text.isEmpty || password.text.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Email and password fields can be empty',
            ),
          ),
        );
      } else if (!isValidEmail(email.text)) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Email Not Valid')),
        );
      } else {
        setState(() {
          isLoading = true;
        });
        await supabase.login(
          email.text.trim(),
          password.text.trim(),
        );
        if (mounted) {
          Navigator.of(context).pop();
        }
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Login Failed:  ${e.toString().split(',')[0].split(':')[1]}',
            ),
          ),
        );
      }
    }
  }

  @override
  void dispose() {
    super.dispose();
    email.dispose();
    password.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:
          () =>
              FocusManager.instance.primaryFocus?.unfocus(),
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
                      Image.asset(mainLogoFull, height: 25),
                      SizedBox(height: 30),
                      Container(
                        padding: EdgeInsets.all(30),
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
                                vertical: 20.0,
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
                                'Login',
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
                                  'Enter your email and Password below to login.',
                                ),
                              ),
                              SizedBox(height: 10),
                              TextFieldEmail(
                                controller: email,
                              ),
                              SizedBox(height: 5),
                              TextFieldPassword(
                                controller: password,
                                label: 'Enter Password',
                              ),
                              SizedBox(height: 10),
                              MainButtonBlue(
                                action: () async {
                                  await login();
                                },
                                text: 'Login',
                              ),
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
                                              'Don\'t have an account? ',
                                            ),
                                            Text(
                                              style: TextStyle(
                                                color:
                                                    secondary(
                                                      context,
                                                    ),
                                                fontWeight:
                                                    FontWeight
                                                        .w700,
                                              ),
                                              'SignUp',
                                            ),
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
    );
  }
}
