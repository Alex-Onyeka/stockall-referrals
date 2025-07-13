import 'package:flutter/material.dart';
import 'package:stockallref/classes/shop.dart';
import 'package:stockallref/constants/functions.dart';
import 'package:stockallref/main.dart';
import 'package:stockallref/theme/theme.dart';

class ShopsAdmin extends StatefulWidget {
  const ShopsAdmin({super.key});

  @override
  State<ShopsAdmin> createState() => _ShopsAdminState();
}

class _ShopsAdminState extends State<ShopsAdmin> {
  int currentSort = 0;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        returnUserProvider(
          context,
          listen: false,
        ).navigate(0);
      },
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15.0,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    returnShopProvider(
                              context,
                              listen: true,
                            ).currentFilter ==
                            0
                        ? 'All Shops'
                        : returnShopProvider(
                              context,
                              listen: true,
                            ).currentFilter ==
                            1
                        ? 'Weeks Registered Shops'
                        : returnShopProvider(
                              context,
                              listen: true,
                            ).currentFilter ==
                            2
                        ? 'All Unverified Shops'
                        : returnShopProvider(
                              context,
                              listen: true,
                            ).currentFilter ==
                            3
                        ? 'Weeks Verified Shops'
                        : returnShopProvider(
                              context,
                              listen: true,
                            ).currentFilter ==
                            4
                        ? 'Weeks Unpaid Shops'
                        : 'Week Paid Shops',
                  ),
                  PopupMenuButton(
                    offset: Offset(-20, 30),
                    color: Colors.white,
                    itemBuilder: (context) {
                      return [
                        PopupMenuItem(
                          onTap: () {
                            setState(() {
                              currentSort = 0;
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 10.0,
                              right: 15,
                            ),
                            child: Text(
                              style: TextStyle(
                                fontWeight:
                                    currentSort == 0
                                        ? FontWeight.bold
                                        : FontWeight.normal,
                                color:
                                    currentSort == 0
                                        ? primary(context)
                                        : Colors
                                            .grey
                                            .shade500,
                              ),
                              'Name',
                            ),
                          ),
                        ),
                        PopupMenuItem(
                          onTap: () {
                            setState(() {
                              currentSort = 1;
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 10.0,
                              right: 15,
                            ),
                            child: Text(
                              style: TextStyle(
                                fontWeight:
                                    currentSort == 1
                                        ? FontWeight.bold
                                        : FontWeight.normal,
                                color:
                                    currentSort == 1
                                        ? primary(context)
                                        : Colors
                                            .grey
                                            .shade500,
                              ),
                              'Created Date',
                            ),
                          ),
                        ),
                        PopupMenuItem(
                          onTap: () {
                            setState(() {
                              currentSort = 2;
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 10.0,
                              right: 15,
                            ),
                            child: Text(
                              style: TextStyle(
                                fontWeight:
                                    currentSort == 2
                                        ? FontWeight.bold
                                        : FontWeight.normal,
                                color:
                                    currentSort == 2
                                        ? primary(context)
                                        : Colors
                                            .grey
                                            .shade500,
                              ),
                              'Verified Date',
                            ),
                          ),
                        ),
                        // PopupMenuItem(
                        //   onTap: () {
                        //     setState(() {
                        //       currentSort = 2;
                        //     });
                        //   },
                        //   child: Padding(
                        //     padding: const EdgeInsets.only(
                        //       left: 10.0,
                        //       right: 15,
                        //     ),
                        //     child: Text(
                        //       style: TextStyle(
                        //         fontWeight:
                        //             currentSort == 3
                        //                 ? FontWeight.bold
                        //                 : FontWeight.normal,
                        //         color:
                        //             currentSort == 3
                        //                 ? primary(context)
                        //                 : Colors
                        //                     .grey
                        //                     .shade500,
                        //       ),
                        //       'Referree',
                        //     ),
                        //   ),
                        // ),
                      ];
                    },
                    child: Row(
                      mainAxisAlignment:
                          MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding:
                              const EdgeInsets.symmetric(
                                horizontal: 10.0,
                                vertical: 5,
                              ),
                          child: Column(
                            children: [
                              Text(
                                style: TextStyle(
                                  fontSize: 14,
                                  // fontWeight: FontWeight.bold,
                                ),
                                'Sort:',
                              ),
                            ],
                          ),
                        ),
                        Icon(Icons.sort),
                      ],
                    ),
                  ),
                ],
              ),
              Divider(color: Colors.grey.shade300),
              Builder(
                builder: (context) {
                  if (returnShopProvider(
                    context,
                    listen: true,
                  ).filterResultAdmin(context).isEmpty) {
                    return Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey.shade300,
                          ),
                        ),
                        child: Center(
                          child: Column(
                            spacing: 10,
                            mainAxisAlignment:
                                MainAxisAlignment.center,
                            children: [
                              Container(
                                padding: EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color:
                                        Colors
                                            .grey
                                            .shade200,
                                  ),
                                  color:
                                      Colors.grey.shade100,
                                ),
                                child: Icon(
                                  color:
                                      const Color.fromARGB(
                                        255,
                                        219,
                                        139,
                                        133,
                                      ),
                                  Icons.clear,
                                ),
                              ),
                              Text(
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight:
                                      FontWeight.normal,
                                ),
                                'Empty List',
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  } else {
                    return Expanded(
                      child: RefreshIndicator(
                        onRefresh: () async {
                          return await returnShopProvider(
                            context,
                            listen: false,
                          ).fetchShops();
                        },
                        child: ListView.builder(
                          itemCount:
                              returnShopProvider(
                                    context,
                                    listen: true,
                                  )
                                  .filterResultAdmin(
                                    context,
                                  )
                                  .length,
                          itemBuilder: (context, index) {
                            List<Shop> shops =
                                returnShopProvider(
                                  context,
                                  listen: true,
                                ).filterResultAdmin(
                                  context,
                                );
                            shops.sort((a, b) {
                              switch (currentSort) {
                                case 0:
                                  return a.name.compareTo(
                                    b.name,
                                  );
                                case 1:
                                  return b.createdAt
                                      .compareTo(
                                        a.createdAt,
                                      );
                                case 2:
                                  return (a.verifiedDate ??
                                          DateTime.now())
                                      .compareTo(
                                        b.verifiedDate ??
                                            DateTime.now(),
                                      );
                                default:
                                  return (a.name).compareTo(
                                    b.name,
                                  );
                              }
                            });
                            Shop shop = shops[index];

                            return Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: 5,
                              ),
                              child: Material(
                                color: Colors.transparent,
                                child: Ink(
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.circular(
                                          5,
                                        ),
                                    color:
                                        const Color.fromARGB(
                                          255,
                                          249,
                                          249,
                                          249,
                                        ),
                                  ),
                                  child: InkWell(
                                    borderRadius:
                                        BorderRadius.circular(
                                          5,
                                        ),
                                    onTap: () {},
                                    child: Container(
                                      padding:
                                          EdgeInsets.symmetric(
                                            vertical: 30,
                                            horizontal: 15,
                                          ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment
                                                .spaceBetween,
                                        children: [
                                          Text(
                                            style:
                                                TextStyle(
                                                  fontSize:
                                                      15,
                                                ),
                                            cutLongText(
                                              shop.name,
                                              25,
                                            ),
                                          ),
                                          Icon(
                                            color:
                                                shop.isVerified &&
                                                        shop.isPaid
                                                    ? secondary(
                                                      context,
                                                    )
                                                    : shop.isVerified &&
                                                        !shop.isPaid
                                                    ? primary(
                                                      context,
                                                    )
                                                    : Colors
                                                        .grey,
                                            shop.isVerified &&
                                                    shop.isPaid
                                                ? Icons
                                                    .check_box
                                                : shop.isVerified &&
                                                    !shop
                                                        .isPaid
                                                ? Icons
                                                    .check_box_outlined
                                                : !shop.isVerified &&
                                                    !shop
                                                        .isPaid
                                                ? Icons
                                                    .check_box_outline_blank
                                                : Icons
                                                    .check_box_outlined,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
