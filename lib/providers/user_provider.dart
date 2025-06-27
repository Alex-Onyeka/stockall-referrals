import 'package:flutter/material.dart';
import 'package:stockallref/classes/referrees.dart';
import 'package:stockallref/supabase/auth_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class UserProvider with ChangeNotifier {
  final supabase = Supabase.instance.client;

  List<Referree> _referree = [];

  List<Referree> get referree => _referree;

  /// Create new referree
  Future<void> addReferree(Referree newReferree) async {
    final response =
        await supabase
            .from('referrees')
            .insert(newReferree.toJson())
            .select()
            .single();

    final added = Referree.fromJson(response);
    _referree.add(added);
    notifyListeners();
  }

  /// Fetch all referree
  Future<void> fetchReferree() async {
    final data = await supabase.from('referrees').select();
    _referree =
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
    await fetchReferree();
  }

  /// Delete referree
  Future<void> deleteReferree(String id) async {
    await supabase.from('referrees').delete().eq('id', id);
    _referree.removeWhere((ref) => ref.id == id);
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
