import 'package:flutter/material.dart';
import 'package:stockallref/classes/shop.dart';
import 'package:stockallref/constants/functions.dart';
import 'package:stockallref/main.dart';
// import 'package:stockallref/supabase/auth_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ShopProvider with ChangeNotifier {
  final supabase = Supabase.instance.client;

  List<Shop> _shops = [];

  List<Shop> get shops => _shops;

  List<Shop> getReferreeShops(BuildContext context) {
    final userProider = returnUserProvider(context);
    return shops
        .where(
          (shop) =>
              shop.refCode != null &&
              shop.refCode ==
                  userProider.currentReferree?.refCode,
        )
        .toList();
  }

  List<Shop> getVerifiedShops(BuildContext context) {
    return getReferreeShops(
      context,
    ).where((shop) => shop.isVerified == true).toList();
  }

  List<Shop> getCurrentWeekVerifiedShops(
    BuildContext context,
  ) {
    final now = DateTime.now();
    final startOfWeek = now.subtract(
      Duration(days: now.weekday - 1),
    ); // Monday
    final endOfWeek = startOfWeek.add(
      Duration(days: 6),
    ); // Sunday

    return getReferreeShops(context)
        .where(
          (shop) =>
              shop.isVerified &&
              shop.verifiedDate != null &&
              shop.verifiedDate!.isAfter(
                startOfWeek.subtract(
                  const Duration(seconds: 1),
                ),
              ) &&
              shop.verifiedDate!.isBefore(
                endOfWeek.add(const Duration(days: 1)),
              ),
        )
        .toList();
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

  /// Create new shop
  Future<void> addShop(Shop newShop) async {
    final response =
        await supabase
            .from('shops')
            .insert(newShop.toJson())
            .select()
            .single();

    final added = Shop.fromJson(response);
    _shops.add(added);
    notifyListeners();
  }

  /// Fetch all shops
  Future<void> fetchShops() async {
    final data = await supabase.from('shops').select();
    _shops =
        data
            .map<Shop>((json) => Shop.fromJson(json))
            .toList();
    notifyListeners();
  }

  /// Update shop
  Future<void> updateShop(
    int shopId,
    Map<String, dynamic> updates,
  ) async {
    await supabase
        .from('shops')
        .update(updates)
        .eq('shop_id', shopId);
    await fetchShops();
  }

  /// Delete shop
  Future<void> deleteShop(int shopId) async {
    await supabase
        .from('shops')
        .delete()
        .eq('shop_id', shopId);
    _shops.removeWhere((shop) => shop.shopId == shopId);
    notifyListeners();
  }

  /// Get shop by ID
  Shop? getShopById(int id) {
    return _shops.firstWhere((s) => s.shopId == id);
  }
}
