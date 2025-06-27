import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stockallref/components/main_button.dart';
import 'package:stockallref/constants/functions.dart';
import 'package:stockallref/main.dart';
import 'package:stockallref/pages/profile/edit_account.dart';
import 'package:stockallref/theme/theme.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    var user =
        returnUserProvider(
          context,
          listen: true,
        ).currentReferree!;
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20.0,
          ),
          child: Center(
            child: RefreshIndicator(
              onRefresh: () {
                return returnUserProvider(
                  context,
                  listen: false,
                ).getCurrentReferree();
              },
              backgroundColor: Colors.white,
              color: primary(context),
              displacement: 10,
              child: ListView(
                children: [
                  Column(
                    children: [
                      SizedBox(height: 10),
                      Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey.shade100,
                        ),
                        child: Center(
                          child: Icon(
                            size: 50,
                            color: primaryFaint(context),
                            Icons.person,
                          ),
                        ),
                      ),
                      SizedBox(height: 15),
                      Column(
                        spacing: 15,
                        children: [
                          Text(
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                            user.name,
                          ),
                          NewWidget(
                            title: 'Title',
                            text: user.email,
                          ),
                          Row(
                            spacing: 20,
                            mainAxisAlignment:
                                MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: NewWidget(
                                  title: 'Phone Number',
                                  text: user.phone,
                                ),
                              ),
                              Expanded(
                                child: NewWidget(
                                  action: () async {
                                    await Clipboard.setData(
                                      ClipboardData(
                                        text: user.refCode,
                                      ),
                                    );
                                    if (context.mounted) {
                                      ScaffoldMessenger.of(
                                        context,
                                      ).showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'Referral Code Copied to clipboard (${user.refCode})',
                                          ),
                                        ),
                                      );
                                    }
                                  },
                                  isRef: true,
                                  title: 'Referral Code',
                                  text: user.refCode,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            spacing: 20,
                            mainAxisAlignment:
                                MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: NewWidget(
                                  title: 'Bank Name',
                                  text:
                                      user.bankName ??
                                      'Not Set',
                                ),
                              ),

                              Expanded(
                                child: NewWidget(
                                  title: 'Account Number',
                                  text:
                                      user.accountNumber ??
                                      'Not Set',
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment:
                                MainAxisAlignment.center,
                            spacing: 20,
                            children: [
                              Expanded(
                                child: NewWidget(
                                  title: 'State',
                                  text: user.state,
                                ),
                              ),
                              Expanded(
                                child: NewWidget(
                                  title: 'Account Name',
                                  text:
                                      user.accountName ??
                                      'Not Set',
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20.0,
                        ),
                        child: MainButtonBlue(
                          text: 'Edit Account',
                          action: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return EditAccount();
                                },
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(height: 30),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class NewWidget extends StatelessWidget {
  const NewWidget({
    super.key,
    required this.text,
    required this.title,
    this.action,
    this.isRef,
  });
  final bool? isRef;
  final String text;
  final String title;
  final Function()? action;

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.grey.shade100,
      ),
      child: InkWell(
        onTap: () {
          if (isRef != null) {
            action!();
          }
        },
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Column(
            children: [
              Text(
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  color: secondary(context),
                  fontSize: 11,
                ),
                title,
              ),
              Row(
                spacing: 10,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: Text(
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 14,
                      ),
                      cutLongText(text, 25),
                    ),
                  ),
                  Visibility(
                    visible: isRef != null,
                    child: Icon(
                      size: 14,
                      color: secondary(context),
                      Icons.copy,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
