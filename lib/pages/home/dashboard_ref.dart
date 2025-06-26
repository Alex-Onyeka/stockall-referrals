import 'package:flutter/material.dart';
import 'package:stockallref/components/container_widget.dart';
import 'package:stockallref/components/main_button.dart';
import 'package:stockallref/main.dart';
import 'package:stockallref/supabase/auth_service.dart';
import 'package:stockallref/theme/theme.dart';

class DashboardRef extends StatefulWidget {
  const DashboardRef({super.key});

  @override
  State<DashboardRef> createState() => _DashboardRefState();
}

class _DashboardRefState extends State<DashboardRef> {
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

  late Future<void> shopsFuture;

  @override
  void initState() {
    super.initState();
    if (returnUserProvider(
              context,
              listen: false,
            ).currentReferree !=
            null &&
        returnShopProvider(
          context,
          listen: false,
        ).refShops.isEmpty) {
      shopsFuture = fetchShops();
      fetchShops();
    }
  }

  Future<void> initFutures() async {
    await getUser();
    await fetchShops();
  }

  @override
  Widget build(BuildContext context) {
    if (returnShopProvider(
      context,
      listen: false,
    ).refShops.isEmpty) {
      return FutureBuilder(
        future: shopsFuture,
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
            return Expanded(
              child: RefreshIndicator(
                onRefresh: () {
                  return initFutures();
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15.0,
                  ),
                  child: ListView(
                    children: [
                      SizedBox(height: 10),
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
                            SizedBox(height: 15),
                            ContainerWidget(
                              isAllTime: true,
                              number: '25',
                              title:
                                  'Total Shops Registered',
                            ),
                            SizedBox(height: 15),
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
                            SizedBox(height: 30),
                            // Divider(color: primary(context)),
                            // SizedBox(height: 15),
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
                            SizedBox(height: 15),
                            ContainerWidget(
                              isAllTime: false,
                              number: '25',
                              title: 'Total Registered',
                            ),
                            SizedBox(height: 15),
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
                                    title:
                                        'Total Unverified',
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 15),
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
                            // SizedBox(height: 20),
                            // Divider(
                            //   color: primaryFaint(context),
                            // ),
                            SizedBox(height: 25),
                            ContainerWidget(
                              isAllTime: false,
                              isTotalRevenue: true,
                              number: 'N25',
                              title: 'Total Revenue',
                            ),
                            SizedBox(height: 15),
                            MainButtonBlue(
                              text: 'Logout',
                              action: () async {
                                await AuthService()
                                    .logOut();
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
    } else {
      return Expanded(
        child: RefreshIndicator(
          onRefresh: () {
            return initFutures();
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15.0,
            ),
            child: ListView(
              children: [
                SizedBox(height: 10),
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
                              fontWeight: FontWeight.bold,
                            ),
                            'All Time Records',
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      ContainerWidget(
                        isAllTime: true,
                        number: '25',
                        title: 'Total Shops Registered',
                      ),
                      SizedBox(height: 15),
                      Row(
                        mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
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
                      SizedBox(height: 30),
                      // Divider(color: primary(context)),
                      // SizedBox(height: 15),
                      Row(
                        children: [
                          Text(
                            style: TextStyle(
                              color: primary(context),
                              fontWeight: FontWeight.bold,
                            ),
                            'Current Week Records',
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      ContainerWidget(
                        isAllTime: false,
                        number: '25',
                        title: 'Total Registered',
                      ),
                      SizedBox(height: 15),
                      Row(
                        mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
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
                      SizedBox(height: 15),
                      Row(
                        mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
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
                      // SizedBox(height: 20),
                      // Divider(
                      //   color: primaryFaint(context),
                      // ),
                      SizedBox(height: 25),
                      ContainerWidget(
                        isAllTime: false,
                        isTotalRevenue: true,
                        number: 'N25',
                        title: 'Total Revenue',
                      ),
                      SizedBox(height: 15),
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
  }
}
