import 'package:flutter/material.dart';
import 'package:stockallref/components/main_button.dart';
import 'package:stockallref/main.dart';
import 'package:stockallref/pages/shops_page.dart';
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

  Future<void> fetchShops() async {
    await returnShopProvider(
      context,
      listen: false,
    ).fetchReferreeShops(
      returnUserProvider(context).currentReferree!.refCode,
    );
  }

  late Future<void> userFuture;

  @override
  void initState() {
    super.initState();
    if (returnUserProvider(
          context,
          listen: false,
        ).currentReferree ==
        null) {
      userFuture = getUser();
      initFutures();
    }
  }

  Future<void> initFutures() async {
    await getUser();
    await fetchShops();
  }

  @override
  Widget build(BuildContext context) {
    if (returnUserProvider(
          context,
          listen: false,
        ).currentReferree ==
        null) {
      return FutureBuilder(
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
              body: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30.0,
                  ),
                  child: Column(
                    spacing: 10,
                    mainAxisAlignment:
                        MainAxisAlignment.center,
                    children: [
                      Text(
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                        'Home',
                      ),
                      SizedBox(height: 20),
                      Text(
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        returnUserProvider(
                                  context,
                                ).currentReferree ==
                                null
                            ? 'User Not Set'
                            : returnUserProvider(
                              context,
                            ).currentReferree!.name,
                      ),
                      Text(
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        returnShopProvider(context)
                            .getCurrentWeekPaidShops(
                              context,
                            )
                            .length
                            .toString(),
                      ),
                      SizedBox(height: 20),
                      MainButtonBlue(
                        text: 'Logout',
                        action: () async {
                          await AuthService().logOut();
                        },
                      ),
                      SizedBox(height: 10),
                      MainButtonBlue(
                        text: 'View Shops',
                        action: () async {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return ShopsPage();
                              },
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
        },
      );
    } else {
      return Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 30.0,
            ),
            child: Column(
              spacing: 10,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                  'Home',
                ),
                SizedBox(height: 20),
                Text(
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  returnUserProvider(
                            context,
                          ).currentReferree ==
                          null
                      ? 'User Not Set'
                      : returnUserProvider(
                        context,
                      ).currentReferree!.name,
                ),
                Text(
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  returnShopProvider(context)
                      .getCurrentWeekPaidShops(context)
                      .length
                      .toString(),
                ),
                SizedBox(height: 20),
                MainButtonBlue(
                  text: 'Logout',
                  action: () async {
                    await AuthService().logOut();
                  },
                ),
                SizedBox(height: 10),
                MainButtonBlue(
                  text: 'View Shops',
                  action: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return ShopsPage();
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      );
    }
  }
}
