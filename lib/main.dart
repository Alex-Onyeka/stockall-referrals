import 'package:flutter/material.dart';
import 'package:stockallref/constants/api.dart';
import 'package:stockallref/pages/auth/auth_landing.dart';
import 'package:stockallref/providers/shop_provider.dart';
import 'package:stockallref/providers/user_provider.dart';
import 'package:stockallref/theme/theme.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(url: url, anonKey: anon);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UserProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => ShopProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

UserProvider returnUserProvider(
  BuildContext context, {
  bool listen = false,
}) {
  return Provider.of<UserProvider>(context, listen: listen);
}

ShopProvider returnShopProvider(
  BuildContext context, {
  bool listen = false,
}) {
  return Provider.of<ShopProvider>(context, listen: listen);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightMode,
      home: const AuthLanding(),
      title: 'Stockall Referralls Portal',
    );
  }
}
