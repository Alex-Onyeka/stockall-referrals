import 'package:flutter/material.dart';
import 'package:stockallref/components/app_bar.dart';
import 'package:stockallref/components/bottom_nav.dart';
import 'package:stockallref/main.dart';
import 'package:stockallref/pages/home/dashoard.dart';
import 'package:stockallref/pages/profile/profile_page.dart';
import 'package:stockallref/pages/shops/shops_page.dart';
import 'package:stockallref/supabase/auth_service.dart';
import 'package:stockallref/theme/theme.dart';

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
    ).getCurrentReferree();
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
    }
  }

  @override
  Widget build(BuildContext context) {
    if (returnUserProvider(context).currentReferree ==
        null) {
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
                body: Center(
                  child: Text('An Error Occured'),
                ),
              );
            } else {
              return Scaffold(
                body: Column(
                  children: [
                    TopNavBar(
                      current:
                          returnUserProvider(
                            context,
                            listen: true,
                          ).currentIndex,
                      amount:
                          returnUserProvider(
                                    context,
                                    listen: true,
                                  ).currentIndex ==
                                  1
                              ? 15
                              : 15,
                      title:
                          returnUserProvider(
                            context,
                          ).currentReferree!.name,
                      widget:
                          returnUserProvider(
                                    context,
                                    listen: true,
                                  ).currentIndex ==
                                  1
                              ? SortButtonTopBar()
                              : null,
                    ),
                    Expanded(
                      child: Builder(
                        builder: (context) {
                          if (returnUserProvider(
                                context,
                                listen: true,
                              ).currentIndex ==
                              0) {
                            return Dashboard();
                          } else if (returnUserProvider(
                                context,
                                listen: true,
                              ).currentIndex ==
                              1) {
                            return ShopsPage();
                          } else {
                            return ProfilePage();
                          }
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20.0,
                      ),
                      child: BottomNav(
                        logoutAction: () async {
                          Navigator.of(context).pop();
                          await AuthService().logOut();
                        },
                        currentIndex:
                            returnUserProvider(
                              context,
                              listen: true,
                            ).currentIndex,
                        action: () {
                          returnUserProvider(
                            context,
                            listen: false,
                          ).navigate(0);
                        },
                        action2: () {
                          returnUserProvider(
                            context,
                            listen: false,
                          ).navigate(1);
                        },
                        action3: () {
                          returnUserProvider(
                            context,
                            listen: false,
                          ).navigate(2);
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
    } else {
      return SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              TopNavBar(
                current:
                    returnUserProvider(
                      context,
                      listen: true,
                    ).currentIndex,
                amount:
                    returnUserProvider(
                              context,
                              listen: true,
                            ).currentIndex ==
                            1
                        ? 15
                        : 15,
                title:
                    returnUserProvider(
                      context,
                    ).currentReferree!.name,
                widget:
                    returnUserProvider(
                              context,
                              listen: true,
                            ).currentIndex ==
                            1
                        ? SortButtonTopBar()
                        : null,
              ),
              Expanded(
                child: Builder(
                  builder: (context) {
                    if (returnUserProvider(
                          context,
                          listen: true,
                        ).currentIndex ==
                        0) {
                      return Dashboard();
                    } else if (returnUserProvider(
                          context,
                          listen: true,
                        ).currentIndex ==
                        1) {
                      return ShopsPage();
                    } else {
                      return ProfilePage();
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                ),
                child: BottomNav(
                  logoutAction: () async {
                    Navigator.of(context).pop();
                    await AuthService().logOut();
                  },
                  currentIndex:
                      returnUserProvider(
                        context,
                        listen: true,
                      ).currentIndex,
                  action: () {
                    returnUserProvider(
                      context,
                      listen: false,
                    ).navigate(0);
                  },
                  action2: () {
                    returnUserProvider(
                      context,
                      listen: false,
                    ).navigate(1);
                  },
                  action3: () {
                    returnUserProvider(
                      context,
                      listen: false,
                    ).navigate(2);
                  },
                ),
              ),
            ],
          ),
        ),
      );
    }
  }
}

class SortButtonTopBar extends StatelessWidget {
  const SortButtonTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      offset: Offset(-20, 30),
      color: Colors.white,
      itemBuilder: (context) {
        return [
          PopupMenuItem(
            onTap: () {
              returnShopProvider(
                context,
                listen: false,
              ).filterAction(0);
            },
            child: Padding(
              padding: const EdgeInsets.only(
                left: 10.0,
                right: 15,
              ),
              child: Text(
                style: TextStyle(
                  fontWeight:
                      returnShopProvider(
                                context,
                              ).currentFilter ==
                              0
                          ? FontWeight.bold
                          : FontWeight.normal,
                  color:
                      returnShopProvider(
                                context,
                              ).currentFilter ==
                              0
                          ? primary(context)
                          : Colors.grey.shade500,
                ),
                'All Shops',
              ),
            ),
          ),
          PopupMenuItem(
            onTap: () {
              returnShopProvider(
                context,
                listen: false,
              ).filterAction(1);
            },
            child: Padding(
              padding: const EdgeInsets.only(
                left: 10.0,
                right: 15,
              ),
              child: Text(
                style: TextStyle(
                  fontWeight:
                      returnShopProvider(
                                context,
                              ).currentFilter ==
                              1
                          ? FontWeight.bold
                          : FontWeight.normal,
                  color:
                      returnShopProvider(
                                context,
                              ).currentFilter ==
                              1
                          ? primary(context)
                          : Colors.grey.shade500,
                ),
                'Weeks Registered Shops',
              ),
            ),
          ),
          PopupMenuItem(
            onTap: () {
              returnShopProvider(
                context,
                listen: false,
              ).filterAction(2);
            },
            child: Padding(
              padding: const EdgeInsets.only(
                left: 10.0,
                right: 15,
              ),
              child: Text(
                style: TextStyle(
                  fontWeight:
                      returnShopProvider(
                                context,
                              ).currentFilter ==
                              2
                          ? FontWeight.bold
                          : FontWeight.normal,
                  color:
                      returnShopProvider(
                                context,
                              ).currentFilter ==
                              2
                          ? primary(context)
                          : Colors.grey.shade500,
                ),
                'All Unverified Shops',
              ),
            ),
          ),
          PopupMenuItem(
            onTap: () {
              returnShopProvider(
                context,
                listen: false,
              ).filterAction(3);
            },
            child: Padding(
              padding: const EdgeInsets.only(
                left: 10.0,
                right: 15,
              ),
              child: Text(
                style: TextStyle(
                  fontWeight:
                      returnShopProvider(
                                context,
                              ).currentFilter ==
                              3
                          ? FontWeight.bold
                          : FontWeight.normal,
                  color:
                      returnShopProvider(
                                context,
                              ).currentFilter ==
                              3
                          ? primary(context)
                          : Colors.grey.shade500,
                ),
                'Weeks Verified Shops',
              ),
            ),
          ),
          PopupMenuItem(
            onTap: () {
              returnShopProvider(
                context,
                listen: false,
              ).filterAction(4);
            },
            child: Padding(
              padding: const EdgeInsets.only(
                left: 10.0,
                right: 15,
              ),
              child: Text(
                style: TextStyle(
                  fontWeight:
                      returnShopProvider(
                                context,
                              ).currentFilter ==
                              4
                          ? FontWeight.bold
                          : FontWeight.normal,
                  color:
                      returnShopProvider(
                                context,
                              ).currentFilter ==
                              4
                          ? primary(context)
                          : Colors.grey.shade500,
                ),
                'All Unpaid Shops',
              ),
            ),
          ),
          PopupMenuItem(
            onTap: () {
              returnShopProvider(
                context,
                listen: false,
              ).filterAction(5);
            },
            child: Padding(
              padding: const EdgeInsets.only(
                left: 10.0,
                right: 15,
              ),
              child: Text(
                style: TextStyle(
                  fontWeight:
                      returnShopProvider(
                                context,
                              ).currentFilter ==
                              5
                          ? FontWeight.bold
                          : FontWeight.normal,
                  color:
                      returnShopProvider(
                                context,
                              ).currentFilter ==
                              5
                          ? primary(context)
                          : Colors.grey.shade500,
                ),
                'Weeks Paid Shops',
              ),
            ),
          ),
        ];
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10.0,
              vertical: 5,
            ),
            child: Text(
              style: TextStyle(
                fontSize: 14,
                // fontWeight: FontWeight.bold,
              ),
              'Filter:',
            ),
          ),
          Icon(Icons.more_vert_rounded),
        ],
      ),
    );
  }
}
