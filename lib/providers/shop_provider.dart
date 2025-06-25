import 'package:flutter/material.dart';
import 'package:stockallref/classes/shop.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ShopProvider with ChangeNotifier {
  final supabase = Supabase.instance.client;

  List<Shop> _shops = [];

  List<Shop> get shops => _shops;

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
