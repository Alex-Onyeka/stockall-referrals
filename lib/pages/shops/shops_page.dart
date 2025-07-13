import 'package:flutter/material.dart';
import 'package:stockallref/main.dart';
import 'package:stockallref/pages/shops/shops_admin.dart';
import 'package:stockallref/pages/shops/shops_ref.dart';

class ShopsPage extends StatefulWidget {
  const ShopsPage({super.key});

  @override
  State<ShopsPage> createState() => _ShopsPageState();
}

class _ShopsPageState extends State<ShopsPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      returnShopProvider(
        context,
        listen: false,
      ).filterAction(0);
    });
  }

  @override
  Widget build(BuildContext context) {
    if (returnUserProvider(
      context,
      listen: false,
    ).currentReferree!.isAdmin) {
      return ShopsAdmin();
    } else {
      return ShopsRef();
    }
  }
}
