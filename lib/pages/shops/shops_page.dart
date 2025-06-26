import 'package:flutter/material.dart';
import 'package:stockallref/main.dart';

class ShopsPage extends StatelessWidget {
  const ShopsPage({super.key});

  @override
  Widget build(BuildContext context) {
    var shopProvider = returnShopProvider(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 25.0,
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
                      ? 'Unverified Shops'
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
          ],
        ),
      ),
    );
  }
}
