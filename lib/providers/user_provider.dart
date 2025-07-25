import 'package:flutter/material.dart';
import 'package:stockallref/classes/referrees.dart';
import 'package:stockallref/main.dart';
import 'package:stockallref/supabase/auth_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class UserProvider with ChangeNotifier {
  final supabase = Supabase.instance.client;

  int currentIndex = 0;

  void navigate(int index) {
    currentIndex = index;
    notifyListeners();
  }

  List<Referree> _referrees = [];

  List<Referree> get referrees => _referrees;

  /// Create new referree
  Future<void> addReferree(Referree newReferree) async {
    final response =
        await supabase
            .from('referrees')
            .insert(newReferree.toJson())
            .select()
            .single();

    final added = Referree.fromJson(response);
    _referrees.add(added);
    notifyListeners();
  }

  /// Fetch all referree
  Future<void> fetchReferrees() async {
    final data = await supabase.from('referrees').select();
    _referrees =
        data
            .map<Referree>(
              (json) => Referree.fromJson(json),
            )
            .toList();
    notifyListeners();
  }

  /// Update referree
  Future<void> updateReferree(Referree update) async {
    await supabase
        .from('referrees')
        .update(update.toJson())
        .eq('id', update.id);
    await fetchReferrees();
  }

  /// Delete referree
  Future<void> deleteReferree(String id) async {
    await supabase.from('referrees').delete().eq('id', id);
    _referrees.removeWhere((ref) => ref.id == id);
    notifyListeners();
  }

  /// Optional: Get referree by ID
  Referree? currentReferree;
  Future<void> getCurrentReferree() async {
    try {
      final res =
          await supabase
              .from('referrees')
              .select()
              .eq('id', AuthService().currentUser!.id)
              .single();

      currentReferree = Referree.fromJson(res);
      notifyListeners();
    } catch (e) {
      print('Error getting referree: $e');
      currentReferree = null;
    }
  }

  void clearCache(BuildContext context) {
    currentReferree = null;
    returnShopProvider(context, listen: false).clearShops();
    notifyListeners();
  }

  // Future<void> getReferreeById(String id) async {
  //   try {
  //     final res =
  //         await supabase
  //             .from('referrees')
  //             .select()
  //             .eq('id', id)
  //             .single();

  //     currentReferree = Referree.fromJson(res);
  //     notifyListeners();
  //   } catch (e) {
  //     print('Error getting referree: $e');
  //     currentReferree = null;
  //   }
  // }
}
