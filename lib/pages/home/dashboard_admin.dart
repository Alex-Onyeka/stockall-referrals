import 'package:flutter/material.dart';
import 'package:stockallref/components/container_widget.dart';
import 'package:stockallref/constants/functions.dart';
import 'package:stockallref/main.dart';
import 'package:stockallref/theme/theme.dart';

class DashboardAdmin extends StatefulWidget {
  const DashboardAdmin({super.key});

  @override
  State<DashboardAdmin> createState() =>
      _DashboardAdminState();
}

class _DashboardAdminState extends State<DashboardAdmin> {
  Future<void> getUser() async {
    await returnUserProvider(
      context,
      listen: false,
    ).getCurrentReferree();
  }

  Future<void> getReferrees() async {
    await returnUserProvider(
      context,
      listen: false,
    ).fetchReferrees();
  }

  Future<void> fetchShops() async {
    await returnShopProvider(
      context,
      listen: false,
    ).fetchShops();
  }

  late Future<void> shopsFuture;

  @override
  void initState() {
    super.initState();
    if (returnUserProvider(context).currentReferree !=
            null &&
        returnShopProvider(context).shops.isEmpty) {
      shopsFuture = fetchShops();
      getReferrees();
      // fetchShops();
    }
  }

  Future<void> initFutures() async {
    await getUser();
    await fetchShops();
  }

  @override
  Widget build(BuildContext context) {
    if (returnShopProvider(context).shops.isEmpty) {
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
            return PageContent(action: initFutures());
          }
        },
      );
    } else {
      return PageContent(action: initFutures());
    }
  }
}

class PageContent extends StatelessWidget {
  final Future<void> action;
  const PageContent({super.key, required this.action});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () {
        return action;
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 5.0,
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
                  Container(
                    padding: EdgeInsets.all(25),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        5,
                      ),
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
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              style: TextStyle(
                                color: primary(context),
                                fontWeight: FontWeight.bold,
                              ),
                              'Referrees',
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        ContainerWidget(
                          isAllTime: true,
                          number: returnUserProvider(
                                context,
                                listen: true,
                              ).referrees.length
                              .toStringAsFixed(0),
                          title: 'Total Referrees',
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
                                number: returnUserProvider(
                                      context,
                                      listen: false,
                                    ).referrees
                                    .where(
                                      (ref) =>
                                          returnShopProvider(
                                                context,
                                                listen:
                                                    false,
                                              )
                                              .getCurrentWeekRegisteredShopsAdmin(
                                                context,
                                              )
                                              .where(
                                                (shop) =>
                                                    shop.refCode !=
                                                        null &&
                                                    shop.refCode ==
                                                        ref.refCode,
                                              )
                                              .toList()
                                              .isNotEmpty,
                                    )
                                    .toList()
                                    .length
                                    .toStringAsFixed(0),
                                title: 'Active Referrees',
                              ),
                            ),
                            Expanded(
                              child: ContainerWidget(
                                isAllTime: false,
                                number: returnUserProvider(
                                      context,
                                      listen: false,
                                    ).referrees
                                    .where(
                                      (ref) =>
                                          returnShopProvider(
                                                context,
                                                listen:
                                                    false,
                                              )
                                              .getCurrentWeekRegisteredShopsAdmin(
                                                context,
                                              )
                                              .where(
                                                (shop) =>
                                                    shop.refCode !=
                                                        null &&
                                                    shop.refCode ==
                                                        ref.refCode,
                                              )
                                              .toList()
                                              .isEmpty,
                                    )
                                    .toList()
                                    .length
                                    .toStringAsFixed(0),
                                title: 'Inactive Referrees',
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    padding: EdgeInsets.all(25),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        5,
                      ),
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
                          ).shops.length.toStringAsFixed(0),
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
                                number: returnShopProvider(
                                      context,
                                      listen: true,
                                    )
                                    .getVerifiedShopsAdmin(
                                      context,
                                    )
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
                                  ).getTotalRevenueMadeAdmin(
                                    context,
                                  ),
                                ),
                                title: 'Total Money Paid',
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    padding: EdgeInsets.all(25),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        5,
                      ),
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
                    child: Column(
                      children: [
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
                              .getCurrentWeekRegisteredShopsAdmin(
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
                                    .getUnVerifiedShopsAdmin(
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
                                    .getCurrentWeekVerifiedShopsAdmin(
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
                                number: returnShopProvider(
                                      context,
                                      listen: true,
                                    )
                                    .getUnPaidShopsAdmin(
                                      context,
                                    )
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
                                    .getCurrentWeekPaidShopsAdmin(
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
                            ).getTotalRevenueCurrentWeekAdmin(
                              context,
                            ),
                          ),
                          title: 'Total Revenue',
                        ),
                      ],
                    ),
                  ),
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
