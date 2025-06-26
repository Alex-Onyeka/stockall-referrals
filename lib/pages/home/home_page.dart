import 'package:flutter/material.dart';
import 'package:stockallref/components/app_bar.dart';
import 'package:stockallref/components/bottom_nav.dart';
import 'package:stockallref/main.dart';
import 'package:stockallref/pages/home/dashoard.dart';
import 'package:stockallref/supabase/auth_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<void> getUser() async {
    await returnUserProvider(
      context,
      listen: false,
    ).getReferreeById(AuthService().currentUser!.id);
  }

  late Future<void> userFuture;
  @override
  void initState() {
    super.initState();
    userFuture = getUser();
  }

  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: FutureBuilder(
        future: userFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState ==
              ConnectionState.waiting) {
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else if (snapshot.hasError) {
            return Scaffold(
              body: Center(child: Text('An Error Occured')),
            );
          } else {
            return Scaffold(
              body: Column(
                children: [
                  TopNavBar(
                    title:
                        returnUserProvider(
                          context,
                        ).currentReferree!.name,
                  ),
                  Expanded(
                    child: Builder(
                      builder: (context) {
                        if (currentIndex == 0) {
                          return Dashboard();
                        } else if (currentIndex == 1) {
                          return Scaffold();
                        } else {
                          return Scaffold();
                        }
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20.0,
                    ),
                    child: BottomNav(
                      currentIndex: currentIndex,
                      action: () {
                        setState(() {
                          currentIndex = 0;
                        });
                      },
                      action2: () {
                        setState(() {
                          currentIndex = 1;
                        });
                      },
                      action3: () {
                        setState(() {
                          currentIndex = 2;
                        });
                      },
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
