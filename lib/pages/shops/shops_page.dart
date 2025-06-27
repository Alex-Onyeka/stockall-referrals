import 'package:flutter/material.dart';
import 'package:stockallref/classes/shop.dart';
import 'package:stockallref/constants/functions.dart';
import 'package:stockallref/main.dart';
import 'package:stockallref/theme/theme.dart';

class ShopsPage extends StatelessWidget {
  const ShopsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15.0,
          ),
          child: Column(
            children: [
              Row(
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
                ],
              ),
              Divider(color: Colors.grey.shade300),
              Builder(
                builder: (context) {
                  if (returnShopProvider(
                    context,
                    listen: true,
                  ).filterResult(context).isEmpty) {
                    return Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.amber,
                          ),
                        ),
                        child: Center(
                          child: Column(
                            mainAxisAlignment:
                                MainAxisAlignment.center,
                            children: [Text('Empty List')],
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
                          ).fetchReferreeShops(
                            returnUserProvider(
                              context,
                            ).currentReferree!.refCode,
                          );
                        },
                        child: ListView.builder(
                          itemCount:
                              returnShopProvider(
                                    context,
                                    listen: true,
                                  )
                                  .filterResult(context)
                                  .length,
                          itemBuilder: (context, index) {
                            Shop shop =
                                returnShopProvider(
                                  context,
                                  listen: true,
                                ).filterResult(
                                  context,
                                )[index];

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
                                      // decoration: BoxDecoration(
                                      //   borderRadius:
                                      //       BorderRadius.circular(
                                      //         5,
                                      //       ),
                                      //   color:
                                      //       const Color.fromARGB(
                                      //         255,
                                      //         249,
                                      //         249,
                                      //         249,
                                      //       ),
                                      // ),
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
