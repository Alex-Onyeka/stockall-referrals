import 'package:flutter/material.dart';
import 'package:stockallref/components/main_button.dart';
import 'package:stockallref/main.dart';
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
    // if (returnUserProvider(
    //       context,
    //       listen: false,
    //     ).currentReferree ==
    //     null) {
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
          return SafeArea(
            child: Scaffold(
              body: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15.0,
                ),
                child: ListView(
                  children: [
                    // TopNavBar(),
                    SizedBox(height: 30),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10.0,
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                style: TextStyle(
                                  color: primary(context),
                                  fontWeight:
                                      FontWeight.bold,
                                ),
                                'All Time Records',
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          ContainerWidget(
                            isAllTime: true,
                            number: '25',
                            title: 'Total Shops Registered',
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment:
                                MainAxisAlignment
                                    .spaceBetween,
                            spacing: 10,
                            children: [
                              Expanded(
                                child: ContainerWidget(
                                  isAllTime: false,
                                  number: '25',
                                  title: 'Total Verified',
                                ),
                              ),
                              Expanded(
                                child: ContainerWidget(
                                  isAllTime: false,
                                  number: 'N25',
                                  title: 'Total Revenue',
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 15),
                          Divider(color: primary(context)),
                          SizedBox(height: 15),
                          Row(
                            children: [
                              Text(
                                style: TextStyle(
                                  color: primary(context),
                                  fontWeight:
                                      FontWeight.bold,
                                ),
                                'Current Week Records',
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          ContainerWidget(
                            isAllTime: false,
                            number: '25',
                            title: 'Total Registered',
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment:
                                MainAxisAlignment
                                    .spaceBetween,
                            spacing: 10,
                            children: [
                              Expanded(
                                child: ContainerWidget(
                                  isAllTime: false,
                                  number: '25',
                                  title: 'Total Verified',
                                ),
                              ),
                              Expanded(
                                child: ContainerWidget(
                                  isAllTime: false,
                                  number: '25',
                                  title: 'Total Unverified',
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment:
                                MainAxisAlignment
                                    .spaceBetween,
                            spacing: 10,
                            children: [
                              Expanded(
                                child: ContainerWidget(
                                  isAllTime: false,
                                  number: '25',
                                  title: 'Total Unpaid',
                                ),
                              ),
                              Expanded(
                                child: ContainerWidget(
                                  isAllTime: false,
                                  number: '25',
                                  title: 'Total Paid',
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Divider(
                            color: primaryFaint(context),
                          ),
                          SizedBox(height: 10),
                          ContainerWidget(
                            isAllTime: false,
                            isTotalRevenue: true,
                            number: 'N25',
                            title: 'Total Revenue',
                          ),
                          SizedBox(height: 10),
                          MainButtonBlue(
                            text: 'Logout',
                            action: () async {
                              await AuthService().logOut();
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }
      },
    );
    // } else {
    //   return Scaffold(
    //     body: Center(
    //       child: Padding(
    //         padding: const EdgeInsets.symmetric(
    //           horizontal: 30.0,
    //         ),
    //         child: Column(
    //           spacing: 10,
    //           mainAxisAlignment: MainAxisAlignment.center,
    //           children: [
    //             Text(
    //               style: TextStyle(
    //                 fontSize: 25,
    //                 fontWeight: FontWeight.bold,
    //               ),
    //               'Home',
    //             ),
    //             SizedBox(height: 20),
    //             Text(
    //               style: TextStyle(
    //                 fontSize: 18,
    //                 fontWeight: FontWeight.bold,
    //               ),
    //               returnUserProvider(
    //                         context,
    //                       ).currentReferree ==
    //                       null
    //                   ? 'User Not Set'
    //                   : returnUserProvider(
    //                     context,
    //                   ).currentReferree!.name,
    //             ),
    //             Text(
    //               style: TextStyle(
    //                 fontSize: 18,
    //                 fontWeight: FontWeight.bold,
    //               ),
    //               returnShopProvider(context)
    //                   .getCurrentWeekPaidShops(context)
    //                   .length
    //                   .toString(),
    //             ),
    //             SizedBox(height: 20),
    //             MainButtonBlue(
    //               text: 'Logout',
    //               action: () async {
    //                 await AuthService().logOut();
    //               },
    //             ),
    //             SizedBox(height: 10),
    //             MainButtonBlue(
    //               text: 'View Shops',
    //               action: () async {
    //                 Navigator.push(
    //                   context,
    //                   MaterialPageRoute(
    //                     builder: (context) {
    //                       return ShopsPage();
    //                     },
    //                   ),
    //                 );
    //               },
    //             ),
    //           ],
    //         ),
    //       ),
    //     ),
    //   );
    // }
  }
}

class ContainerWidget extends StatelessWidget {
  final String title;
  final String number;
  final bool isAllTime;
  final bool? isTotalRevenue;

  const ContainerWidget({
    super.key,
    required this.title,
    required this.number,
    required this.isAllTime,
    this.isTotalRevenue,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 15,
        horizontal: 15,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: primaryFaint(context)),
      ),
      child: Center(
        child: Column(
          children: [
            Row(
              mainAxisAlignment:
                  isTotalRevenue != null
                      ? MainAxisAlignment.center
                      : MainAxisAlignment.start,
              children: [
                Text(
                  style: TextStyle(
                    fontSize: isAllTime ? 15 : 13,
                    color: Colors.grey.shade600,
                  ),
                  title,
                ),
              ],
            ),
            Row(
              mainAxisAlignment:
                  isTotalRevenue != null
                      ? MainAxisAlignment.center
                      : MainAxisAlignment.start,
              children: [
                Text(
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: isAllTime ? 25 : 18,
                    fontWeight: FontWeight.bold,
                    color: primary(context),
                  ),
                  number,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class TopNavBar extends StatelessWidget {
  const TopNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(15, 15, 15, 20),
      decoration: BoxDecoration(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            spacing: 5,
            children: [
              CircleAvatar(child: Icon(Icons.person)),
              Text('User Name'),
            ],
          ),
          Icon(Icons.menu),
        ],
      ),
    );
  }
}
