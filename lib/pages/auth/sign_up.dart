import 'package:flutter/material.dart';
import 'package:stockallref/components/email_textfield.dart';
import 'package:stockallref/components/general_textfield.dart';
import 'package:stockallref/components/main_button.dart';
import 'package:stockallref/components/password_textfield.dart';
import 'package:stockallref/constants/functions.dart';
import 'package:stockallref/constants/images.dart';
import 'package:stockallref/supabase/auth_service.dart';
import 'package:stockallref/theme/theme.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController search = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController confirmPassword =
      TextEditingController();
  bool isLoading = false;

  List<String> states = [
    "Abia",
    "Adamawa",
    "Akwa Ibom",
    "Anambra",
    "Bauchi",
    "Bayelsa",
    "Benue",
    "Borno",
    "Cross River",
    "Delta",
    "Ebonyi",
    "Edo",
    "Ekiti",
    "Enugu",
    "FCT - Abuja",
    "Gombe",
    "Imo",
    "Jigawa",
    "Kaduna",
    "Kano",
    "Katsina",
    "Kebbi",
    "Kogi",
    "Kwara",
    "Lagos",
    "Nasarawa",
    "Niger",
    "Ogun",
    "Ondo",
    "Osun",
    "Oyo",
    "Plateau",
    "Rivers",
    "Sokoto",
    "Taraba",
    "Yobe",
    "Zamfara",
  ];

  String? selectedState;
  bool isOpen = false;

  final supabase = AuthService();
  Future<void> createAccount() async {
    try {
      if (email.text.isEmpty ||
          password.text.isEmpty ||
          confirmPassword.text.isEmpty ||
          name.text.isEmpty ||
          selectedState == null ||
          phone.text.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'All Fields must be set before account can be created',
            ),
          ),
        );
      } else if (!isValidEmail(email.text)) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Email Not Valid')),
        );
      } else if (password.text != confirmPassword.text) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Password Does not match'),
          ),
        );
      } else {
        setState(() {
          isLoading = true;
        });
        await supabase.createAccount(
          email: email.text.trim(),
          password: password.text.trim(),
          name: name.text.trim(),
          phone: phone.text.trim(),
          state: selectedState!.trim(),
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
              'Failed to create Account: ${e.toString().split(',')[0].split(':')[1]}',
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
    confirmPassword.dispose();
    name.dispose();
    phone.dispose();
    search.dispose();
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
            Stack(
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
                              mainLogoFull,
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
                                    BorderRadius.circular(
                                      5,
                                    ),
                                boxShadow: [
                                  BoxShadow(
                                    color:
                                        const Color.fromARGB(
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
                                      MainAxisAlignment
                                          .center,
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
                                            TextAlign
                                                .center,
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight:
                                              FontWeight
                                                  .normal,
                                          color:
                                              Colors
                                                  .grey
                                                  .shade500,
                                        ),
                                        'Enter All necessary info below to Create an account.',
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    GeneralTextfield(
                                      controller: name,
                                      label: 'Enter Name',
                                    ),
                                    SizedBox(height: 5),
                                    TextFieldEmail(
                                      controller: email,
                                    ),
                                    SizedBox(height: 5),
                                    TextFieldPassword(
                                      controller: password,
                                      label:
                                          'Enter Password',
                                    ),
                                    SizedBox(height: 5),
                                    TextFieldPassword(
                                      controller:
                                          confirmPassword,
                                      label:
                                          'Confirm Password',
                                    ),
                                    SizedBox(height: 5),
                                    GeneralTextfield(
                                      controller: phone,
                                      label:
                                          'Enter Phone Number',
                                      isPhone: true,
                                    ),
                                    SizedBox(height: 5),
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          isOpen = !isOpen;
                                        });
                                      },
                                      child: Container(
                                        padding:
                                            EdgeInsets.symmetric(
                                              horizontal:
                                                  15,
                                              vertical: 12,
                                            ),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(
                                                5,
                                              ),
                                          border: Border.all(
                                            color:
                                                Colors
                                                    .grey
                                                    .shade400,
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment
                                                  .spaceBetween,
                                          children: [
                                            Text(
                                              style: TextStyle(
                                                color:
                                                    selectedState !=
                                                            null
                                                        ? primary(
                                                          context,
                                                        )
                                                        : Colors.grey.shade400,
                                              ),
                                              selectedState ??
                                                  'Select State',
                                            ),
                                            Icon(
                                              color:
                                                  Colors
                                                      .grey,
                                              isOpen
                                                  ? Icons
                                                      .keyboard_arrow_up_rounded
                                                  : Icons
                                                      .keyboard_arrow_down_rounded,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    MainButtonBlue(
                                      action: () async {
                                        await createAccount();
                                      },
                                      text: 'Sign Up',
                                    ),
                                    SizedBox(height: 10),
                                    Material(
                                      color:
                                          Colors
                                              .transparent,
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
                                                  vertical:
                                                      5,
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
                                                          Colors.grey.shade800,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                    ),
                                                    'Already Have an Account? ',
                                                  ),
                                                  Text(
                                                    style: TextStyle(
                                                      color: secondary(
                                                        context,
                                                      ),
                                                      fontWeight:
                                                          FontWeight.w700,
                                                    ),
                                                    'Login',
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
            Visibility(
              visible: isOpen,
              child: Scaffold(
                backgroundColor: const Color.fromARGB(
                  61,
                  0,
                  0,
                  0,
                ),
                body: Center(
                  child: Column(
                    mainAxisAlignment:
                        MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 20,
                            horizontal: 20,
                          ),
                          margin: EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 20,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.circular(5),
                          ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment
                                        .spaceBetween,
                                spacing: 10,
                                children: [
                                  Opacity(
                                    opacity: 0,
                                    child: IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.clear,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight:
                                          FontWeight.bold,
                                    ),
                                    'Select Your State',
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      setState(() {
                                        isOpen = false;
                                        search.clear();
                                      });
                                    },
                                    icon: Icon(Icons.clear),
                                  ),
                                ],
                              ),
                              // Divider(
                              //   color: Colors.grey.shade300,
                              // ),
                              GeneralTextfield(
                                controller: search,
                                label: 'Search State',
                                onChanged: (p0) {
                                  setState(() {});
                                },
                              ),
                              Expanded(
                                child: ListView.builder(
                                  itemCount:
                                      states
                                          .where(
                                            (state) => state
                                                .contains(
                                                  search
                                                      .text,
                                                ),
                                          )
                                          .toList()
                                          .length,
                                  itemBuilder: (
                                    context,
                                    index,
                                  ) {
                                    var state =
                                        states
                                            .where(
                                              (
                                                state,
                                              ) => state
                                                  .contains(
                                                    search
                                                        .text,
                                                  ),
                                            )
                                            .toList()[index];
                                    return ListTile(
                                      onTap: () {
                                        setState(() {
                                          selectedState =
                                              state;
                                          isOpen = false;
                                          search.clear();
                                        });
                                      },
                                      title: Text(state),
                                      trailing: Icon(
                                        size: 18,
                                        color:
                                            Colors
                                                .grey
                                                .shade500,
                                        Icons.check,
                                      ),
                                    );
                                  },
                                ),
                              ),
                              SizedBox(height: 10),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment
                                        .center,
                                spacing: 10,
                                children: [
                                  Expanded(
                                    child: Material(
                                      color:
                                          Colors
                                              .transparent,
                                      child: Ink(
                                        child: InkWell(
                                          onTap: () {
                                            setState(() {
                                              isOpen =
                                                  false;
                                              search
                                                  .clear();
                                            });
                                          },
                                          child: Container(
                                            padding:
                                                EdgeInsets.symmetric(
                                                  vertical:
                                                      10,
                                                  horizontal:
                                                      10,
                                                ),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                    5,
                                                  ),
                                              border: Border.all(
                                                color:
                                                    primaryFaint(
                                                      context,
                                                    ),
                                              ),
                                            ),
                                            child: Center(
                                              child: Text(
                                                'Cancel',
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  // Expanded(
                                  //   child: Material(
                                  //     color:
                                  //         Colors.transparent,
                                  //     child: Ink(
                                  //       decoration: BoxDecoration(
                                  //         color: primary(
                                  //           context,
                                  //         ),
                                  //         borderRadius:
                                  //             BorderRadius.circular(
                                  //               5,
                                  //             ),
                                  //       ),
                                  //       child: InkWell(
                                  //         onTap: () {
                                  //           selectedState
                                  //         },
                                  //         child: Container(
                                  //           padding:
                                  //               EdgeInsets.symmetric(
                                  //                 vertical:
                                  //                     10,
                                  //                 horizontal:
                                  //                     10,
                                  //               ),

                                  //           child: Center(
                                  //             child: Text(
                                  //               style: TextStyle(
                                  //                 color:
                                  //                     Colors
                                  //                         .white,
                                  //               ),
                                  //               'Cancel',
                                  //             ),
                                  //           ),
                                  //         ),
                                  //       ),
                                  //     ),
                                  //   ),
                                  // ),
                                ],
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
          ],
        ),
      ),
    );
  }
}
