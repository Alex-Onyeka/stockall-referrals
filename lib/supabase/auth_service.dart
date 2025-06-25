// import 'package:stockallref/classes/referrees.dart';
// import 'package:stockallref/providers/user_provider.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';

// class AuthService {
//   final supabase = Supabase.instance.client;

//   Future<AuthResponse> login(
//     String email,
//     String password,
//   ) async {
//     try {
//       final authResponse = await supabase.auth
//           .signInWithPassword(
//             password: password,
//             email: email,
//           );
//       print('Success Singed in');
//       return authResponse;
//     } catch (e) {
//       print('Failed: $e');
//       rethrow;
//     }
//   }

//   Future<AuthResponse> createAccount({
//     required String email,
//     required String password,
//     required String name,
//     required String phone,
//     required String state,
//   }) async {
//     try {
//       final res = await supabase.auth.signUp(
//         password: password,
//         email: email,
//       );
//       print('Account Created');
//       final user = res.user;
//       await UserProvider().addReferree(
//         Referree(
//           id: user!.id,
//           createdDate: DateTime.now(),
//           name: name,
//           email: email,
//           phone: phone,
//           state: state,
//           refCode:
//               '${name.substring(0, 3).toUpperCase()}-${user.id.substring(0, 4).toUpperCase()}-${user.id.substring(user.id.length - 4, user.id.length).toUpperCase()}',
//         ),
//       );
//       return res;
//     } catch (e) {
//       print('Failed: $e');
//       rethrow;
//     }
//   }

//   Future<void> logOut() async {
//     await supabase.auth.signOut();
//   }

//   Stream<AuthState> authState() {
//     return supabase.auth.onAuthStateChange;
//   }

//   User? get currentUser => supabase.auth.currentUser;
// }
