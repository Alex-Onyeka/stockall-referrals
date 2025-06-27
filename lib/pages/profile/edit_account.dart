import 'package:flutter/material.dart';
import 'package:stockallref/classes/referrees.dart';
import 'package:stockallref/components/confimation_dialog.dart';
import 'package:stockallref/components/general_textfield.dart';
import 'package:stockallref/components/main_button.dart';
import 'package:stockallref/main.dart';
import 'package:stockallref/supabase/auth_service.dart';
import 'package:stockallref/theme/theme.dart';

class EditAccount extends StatefulWidget {
  const EditAccount({super.key});

  @override
  State<EditAccount> createState() => _EditAccountState();
}

class _EditAccountState extends State<EditAccount> {
  TextEditingController phone = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController bank = TextEditingController();
  TextEditingController accountName =
      TextEditingController();
  TextEditingController accountNumber =
      TextEditingController();

  bool isLoading = false;

  bool isDone = false;

  final supabase = AuthService();
  Future<void> updateAccount() async {
    var userP = returnUserProvider(context);
    var user = userP.currentReferree!;
    try {
      if (bank.text.isEmpty ||
          name.text.isEmpty ||
          accountName.text.isEmpty ||
          accountNumber.text.isEmpty ||
          phone.text.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'All Fields must be set before account can be created',
            ),
          ),
        );
      } else {
        showDialog(
          context: context,
          builder: (context) {
            return ConfirmationDialog(
              title: 'Are you sure?',
              text:
                  'You are about to update your account details, are you sure you want to proceed?',
              action: () async {
                Navigator.of(context).pop();
                setState(() {
                  isLoading = true;
                });
                await userP.updateReferree(
                  Referree(
                    id: AuthService().currentUser!.id,
                    createdDate: user.createdDate,
                    name: name.text,
                    email: user.email,
                    phone: phone.text,
                    state: user.state,
                    refCode: user.refCode,
                    isAdmin: user.isAdmin,
                    accountName: accountName.text,
                    accountNumber: accountNumber.text,
                    bankName: bank.text,
                  ),
                );
                await userP.getCurrentReferree();
                setState(() {
                  isDone = true;
                  isLoading = false;
                });
              },
            );
          },
        );
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
    bank.dispose();
    name.dispose();
    accountName.dispose();
    accountNumber.dispose();
    phone.dispose();
  }

  @override
  void initState() {
    super.initState();
    setDetails();
  }

  void setDetails() {
    var user = returnUserProvider(context).currentReferree!;
    name.text = user.name;
    phone.text = user.phone;
    bank.text = user.bankName ?? '';
    accountName.text = user.accountName ?? '';
    accountNumber.text = user.accountNumber ?? '';
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
            appBar: AppBar(
              leading: InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: SizedBox(
                  width: 50,
                  child: Icon(
                    Icons.arrow_back_ios_new_rounded,
                  ),
                ),
              ),
              title: Text(
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                'Edit Account Details',
              ),
              centerTitle: true,
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30.0,
                ),
                child: Column(
                  spacing: 20,
                  children: [
                    SizedBox(height: 20),
                    GeneralTextfield(
                      isActive: !isDone,
                      controller: name,
                      label: 'Enter Name',
                    ),
                    GeneralTextfield(
                      isActive: !isDone,
                      controller: phone,
                      isPhone: true,
                      label: 'Enter Phone Number',
                    ),
                    Column(
                      children: [
                        SizedBox(height: 15),
                        Row(
                          children: [
                            Text('Account Details'),
                          ],
                        ),
                        Divider(
                          color: primaryFaint(context),
                        ),
                      ],
                    ),
                    GeneralTextfield(
                      isActive: !isDone,
                      controller: bank,
                      label: 'Enter Bank Name',
                    ),
                    GeneralTextfield(
                      isActive: !isDone,
                      controller: accountName,
                      label: 'Account Name',
                    ),
                    GeneralTextfield(
                      isActive: !isDone,
                      isPhone: true,
                      controller: accountNumber,
                      label: 'Account Number',
                    ),
                    MainButtonBlue(
                      text:
                          isDone ? 'Done' : 'Save Details',
                      action: () {
                        if (isDone) {
                          Navigator.of(context).pop();
                        } else {
                          updateAccount();
                        }
                      },
                    ),
                    SizedBox(height: 30),
                  ],
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
