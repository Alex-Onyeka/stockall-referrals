import 'package:flutter/material.dart';
import 'package:stockallref/components/container_widget.dart';
import 'package:stockallref/constants/functions.dart';
import 'package:stockallref/main.dart';
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
    ).getCurrentReferree();
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
    if (returnUserProvider(context).currentReferree !=
            null &&
        returnShopProvider(context).refShops.isEmpty) {
      shopsFuture = fetchShops();
      // fetchShops();
    }
  }

  Future<void> initFutures() async {
    await getUser();
    await fetchShops();
  }

  @override
  Widget build(BuildContext context) {
    if (returnShopProvider(context).refShops.isEmpty) {
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
            return RefreshIndicator(
              onRefresh: () {
                return initFutures();
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15.0,
                ),
                child: ListView(
                  children: [
                    SizedBox(height: 15),
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
                                'All Time Record',
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          ContainerWidget(
                            isAllTime: true,
                            number: returnShopProvider(
                                  context,
                                  listen: true,
                                ).refShops.length
                                .toStringAsFixed(0),
                            title: 'Total Shops Registered',
                          ),
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment:
                                MainAxisAlignment
                                    .spaceBetween,
                            spacing: 15,
                            children: [
                              Expanded(
                                child: ContainerWidget(
                                  isAllTime: false,
                                  number:
                                      returnShopProvider(
                                            context,
                                            listen: true,
                                          )
                                          .getVerifiedShops(
                                            context,
                                          )
                                          .length
                                          .toStringAsFixed(
                                            0,
                                          ),
                                  title: 'Total Verified',
                                ),
                              ),
                              Expanded(
                                child: ContainerWidget(
                                  isAllTime: false,
                                  number: formatMoney(
                                    returnShopProvider(
                                      context,
                                      listen: true,
                                    ).getTotalRevenueMade(
                                      context,
                                    ),
                                  ),
                                  title: 'Total Revenue',
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 40),
                          Row(
                            children: [
                              Text(
                                style: TextStyle(
                                  color: primary(context),
                                  fontWeight:
                                      FontWeight.bold,
                                ),
                                'Current Week Record',
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          ContainerWidget(
                            isAllTime: false,
                            number: returnShopProvider(
                                  context,
                                  listen: true,
                                )
                                .getCurrentWeekRegisteredShops(
                                  context,
                                )
                                .length
                                .toStringAsFixed(0),
                            title: 'Total Registered',
                          ),
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment:
                                MainAxisAlignment
                                    .spaceBetween,
                            spacing: 15,
                            children: [
                              Expanded(
                                child: ContainerWidget(
                                  isAllTime: false,
                                  number: returnShopProvider(
                                        context,
                                        listen: true,
                                      )
                                      .getUnVerifiedShops(
                                        context,
                                      )
                                      .length
                                      .toStringAsFixed(0),
                                  title: 'Total Unverified',
                                ),
                              ),
                              Expanded(
                                child: ContainerWidget(
                                  isAllTime: false,
                                  number: returnShopProvider(
                                        context,
                                        listen: true,
                                      )
                                      .getCurrentWeekVerifiedShops(
                                        context,
                                      )
                                      .length
                                      .toStringAsFixed(0),
                                  title: 'Total Verified',
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment:
                                MainAxisAlignment
                                    .spaceBetween,
                            spacing: 15,
                            children: [
                              Expanded(
                                child: ContainerWidget(
                                  isAllTime: false,
                                  number:
                                      returnShopProvider(
                                            context,
                                            listen: true,
                                          )
                                          .getUnPaidShops(
                                            context,
                                          )
                                          .length
                                          .toStringAsFixed(
                                            0,
                                          ),
                                  title: 'Total Unpaid',
                                ),
                              ),
                              Expanded(
                                child: ContainerWidget(
                                  isAllTime: false,
                                  number: returnShopProvider(
                                        context,
                                        listen: true,
                                      )
                                      .getCurrentWeekPaidShops(
                                        context,
                                      )
                                      .length
                                      .toStringAsFixed(0),
                                  title: 'Total Paid',
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 25),
                          ContainerWidget(
                            isAllTime: false,
                            isTotalRevenue: true,
                            number: formatMoney(
                              returnShopProvider(
                                context,
                                listen: true,
                              ).getTotalRevenueCurrentWeek(
                                context,
                              ),
                            ),
                            title: 'Total Revenue',
                          ),
                          SizedBox(height: 20),
                          // MainButtonBlue(
                          //   text: 'Refresh',
                          //   action: () async {
                          //     await initFutures();
                          //     if (context.mounted) {
                          //       Navigator.pushReplacement(
                          //         context,
                          //         MaterialPageRoute(
                          //           builder: (context) {
                          //             return HomePage();
                          //           },
                          //         ),
                          //       );
                          //     }
                          //   },
                          // ),
                          // SizedBox(height: 30),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
        },
      );
    } else {
      return RefreshIndicator(
        onRefresh: () {
          return initFutures();
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15.0,
          ),
          child: ListView(
            children: [
              SizedBox(height: 15),
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
                          'All Time Record',
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    ContainerWidget(
                      isAllTime: true,
                      number: returnShopProvider(
                        context,
                        listen: true,
                      ).refShops.length.toStringAsFixed(0),
                      title: 'Total Shops Registered',
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                      spacing: 15,
                      children: [
                        Expanded(
                          child: ContainerWidget(
                            isAllTime: false,
                            number: returnShopProvider(
                                  context,
                                  listen: true,
                                )
                                .getVerifiedShops(context)
                                .length
                                .toStringAsFixed(0),
                            title: 'Total Verified',
                          ),
                        ),
                        Expanded(
                          child: ContainerWidget(
                            isAllTime: false,
                            number: formatMoney(
                              returnShopProvider(
                                context,
                                listen: true,
                              ).getTotalRevenueMade(
                                context,
                              ),
                            ),
                            title: 'Total Revenue',
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 40),
                    Row(
                      children: [
                        Text(
                          style: TextStyle(
                            color: primary(context),
                            fontWeight: FontWeight.bold,
                          ),
                          'Current Week Record',
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    ContainerWidget(
                      isAllTime: false,
                      number: returnShopProvider(
                            context,
                            listen: true,
                          )
                          .getCurrentWeekRegisteredShops(
                            context,
                          )
                          .length
                          .toStringAsFixed(0),
                      title: 'Total Registered',
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                      spacing: 15,
                      children: [
                        Expanded(
                          child: ContainerWidget(
                            isAllTime: false,
                            number: returnShopProvider(
                                  context,
                                  listen: true,
                                )
                                .getUnVerifiedShops(context)
                                .length
                                .toStringAsFixed(0),
                            title: 'Total Unverified',
                          ),
                        ),
                        Expanded(
                          child: ContainerWidget(
                            isAllTime: false,
                            number: returnShopProvider(
                                  context,
                                  listen: true,
                                )
                                .getCurrentWeekVerifiedShops(
                                  context,
                                )
                                .length
                                .toStringAsFixed(0),
                            title: 'Total Verified',
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                      spacing: 15,
                      children: [
                        Expanded(
                          child: ContainerWidget(
                            isAllTime: false,
                            number: returnShopProvider(
                                  context,
                                  listen: true,
                                )
                                .getUnPaidShops(context)
                                .length
                                .toStringAsFixed(0),
                            title: 'Total Unpaid',
                          ),
                        ),
                        Expanded(
                          child: ContainerWidget(
                            isAllTime: false,
                            number: returnShopProvider(
                                  context,
                                  listen: true,
                                )
                                .getCurrentWeekPaidShops(
                                  context,
                                )
                                .length
                                .toStringAsFixed(0),
                            title: 'Total Paid',
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 25),
                    ContainerWidget(
                      isAllTime: false,
                      isTotalRevenue: true,
                      number: formatMoney(
                        returnShopProvider(
                          context,
                          listen: true,
                        ).getTotalRevenueCurrentWeek(
                          context,
                        ),
                      ),
                      title: 'Total Revenue',
                    ),
                    // SizedBox(height: 20),
                    // MainButtonBlue(
                    //   text: 'Refresh',
                    //   action: () async {
                    //     await initFutures();
                    //     if (context.mounted) {
                    //       Navigator.pushReplacement(
                    //         context,
                    //         MaterialPageRoute(
                    //           builder: (context) {
                    //             return HomePage();
                    //           },
                    //         ),
                    //       );
                    //     }
                    //   },
                    // ),
                    SizedBox(height: 30),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }
  }
}
