import 'package:flutter/material.dart';
import 'package:stockallref/classes/shop.dart';
import 'package:stockallref/constants/functions.dart';
import 'package:stockallref/main.dart';
// import 'package:stockallref/supabase/auth_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ShopProvider with ChangeNotifier {
  // List<Shop> _shops = [];

  // List<Shop> get shops => _shops;

  // /// Create new shop
  // Future<void> addShop(Shop newShop) async {
  //   final response =
  //       await supabase
  //           .from('shops')
  //           .insert(newShop.toJson())
  //           .select()
  //           .single();

  //   final added = Shop.fromJson(response);
  //   _shops.add(added);
  //   notifyListeners();
  // }

  // /// Fetch all shops
  // Future<void> fetchShops() async {
  //   final data = await supabase.from('shops').select();
  //   _refShops =
  //       data
  //           .map<Shop>((json) => Shop.fromJson(json))
  //           .toList();
  //   notifyListeners();
  // }

  /// Update shop
  // Future<void> updateShop(
  //   int shopId,
  //   Map<String, dynamic> updates,
  // ) async {
  //   await supabase
  //       .from('shops')
  //       .update(updates)
  //       .eq('shop_id', shopId);
  //   await fetchShops();
  // }

  // /// Delete shop
  // Future<void> deleteShop(int shopId) async {
  //   await supabase
  //       .from('shops')
  //       .delete()
  //       .eq('shop_id', shopId);
  //   _refShops.removeWhere((shop) => shop.shopId == shopId);
  //   notifyListeners();
  // }

  final supabase = Supabase.instance.client;

  List<Shop> _refShops = [];

  List<Shop> get refShops => _refShops;

  Future<void> fetchReferreeShops(String refCode) async {
    final data = await supabase
        .from('shops')
        .select()
        .eq('ref_code', refCode);
    _refShops =
        data
            .map<Shop>((json) => Shop.fromJson(json))
            .toList();
    notifyListeners();
  }

  int currentFilter = 0;

  void filterAction(int number) {
    currentFilter = number;
    notifyListeners();
  }

  List<Shop> filterResult(BuildContext context) {
    switch (currentFilter) {
      case 0:
        return getReferreeShops(context);
      case 1:
        return getCurrentWeekRegisteredShops(context);
      case 2:
        return getUnVerifiedShops(context);
      case 3:
        return getCurrentWeekVerifiedShops(context);
      case 4:
        return getUnPaidShops(context);
      case 5:
        return getCurrentWeekPaidShops(context);
      default:
        return getReferreeShops(context);
    }
  }

  /// Get shop by ID
  Shop? getShopById(int id) {
    return _refShops.firstWhere((s) => s.shopId == id);
  }

  List<Shop> getReferreeShops(BuildContext context) {
    final userProider = returnUserProvider(context);
    return _refShops
        .where(
          (shop) =>
              shop.refCode != null &&
              shop.refCode ==
                  userProider.currentReferree!.refCode,
        )
        .toList();
  }

  List<Shop> getVerifiedShops(BuildContext context) {
    return getReferreeShops(
      context,
    ).where((shop) => shop.isVerified == true).toList();
  }

  List<Shop> getCurrentWeekRegisteredShops(
    BuildContext context,
  ) {
    final now = DateTime.now();
    final startOfWeek = now.subtract(
      Duration(days: now.weekday - 1),
    ); // Monday
    final endOfWeek = startOfWeek.add(
      Duration(days: 6),
    ); // Sunday

    return _refShops
        .where(
          (shop) =>
              shop.createdAt.isAfter(
                startOfWeek.subtract(
                  const Duration(seconds: 1),
                ),
              ) &&
              shop.createdAt.isBefore(
                endOfWeek.add(const Duration(days: 1)),
              ),
        )
        .toList();
  }

  List<Shop> getCurrentWeekVerifiedShops(
    BuildContext context,
  ) {
    final now = DateTime.now();

    // Start of the week: Monday at 00:00:00
    final startOfWeek = DateTime(
      now.year,
      now.month,
      now.day,
    ).subtract(Duration(days: now.weekday - 1));

    // End of the week: Sunday at 23:59:59.999
    final endOfWeek = startOfWeek.add(
      Duration(
        days: 6,
        hours: 23,
        minutes: 59,
        seconds: 59,
        milliseconds: 999,
      ),
    );

    return _refShops.where((shop) {
      final verifiedDate = shop.verifiedDate;
      return shop.isVerified &&
          verifiedDate != null &&
          verifiedDate.isAfter(
            startOfWeek.subtract(
              const Duration(seconds: 1),
            ),
          ) &&
          verifiedDate.isBefore(endOfWeek);
    }).toList();
  }

  List<Shop> getUnVerifiedShops(BuildContext context) {
    return getReferreeShops(
      context,
    ).where((shop) => shop.isVerified == false).toList();
  }

  List<Shop> getPaidShops(BuildContext context) {
    return getReferreeShops(context)
        .where(
          (shop) =>
              shop.isPaid == true &&
              shop.isVerified == true,
        )
        .toList();
  }

  List<Shop> getCurrentWeekPaidShops(BuildContext context) {
    return getCurrentWeekVerifiedShops(context)
        .where(
          (shop) =>
              shop.isPaid == true &&
              shop.isVerified == true,
        )
        .toList();
  }

  List<Shop> getUnPaidShops(BuildContext context) {
    return getReferreeShops(context)
        .where(
          (shop) =>
              shop.isPaid == false &&
              shop.isVerified == true,
        )
        .toList();
  }

  double getTotalRevenueMade(BuildContext context) {
    return getPaidShops(context).length * verifiedPayment;
  }

  double getTotalRevenueCurrentWeek(BuildContext context) {
    return getCurrentWeekPaidShops(context).length *
        verifiedPayment;
  }
}
