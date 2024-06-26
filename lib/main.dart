import 'package:ecorporativo/src/features/authentication/presenter/pages/contract_acceptance_page.dart';
import 'package:ecorporativo/src/features/authentication/presenter/pages/contract_successs_page.dart';
import 'package:ecorporativo/src/features/authentication/presenter/pages/contract_popup_terms_page.dart';
import 'package:ecorporativo/src/features/authentication/presenter/pages/signin_page.dart';
import 'package:ecorporativo/src/features/authentication/presenter/pages/splash_page.dart';
import 'package:ecorporativo/src/features/home/presenter/pages/home_page.dart';
import 'package:ecorporativo/src/features/support_summary/presenter/pages/support_summary_page.dart';
import 'package:ecorporativo/src/shared/config/navigation.dart';
import 'package:flutter/material.dart';

import 'src/features/home/presenter/pages/history_invoices_page.dart';
import 'src/shared/config/dependencies.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // await dotenv.load(fileName: ".env");
  registerDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-corporativo',
      debugShowCheckedModeBanner: false,
      navigatorKey: NavigationCustom.navigatorKey,
      theme: ThemeData(
          colorScheme: const ColorScheme(
            brightness: Brightness.light,
            background: Color(0xfff8f8f8),
            onBackground: Color(0xfff8f8f8),
            primary: Color(0xff122B42),
            onPrimary: Color(0xff122B42),
            secondary: Color(0xffffD05C),
            onSecondary: Color(0xffffD05C),
            error: Colors.red,
            onError: Colors.red,
            surface: Color(0xfff8f8f8),
            onSurface: Color(0xfff8f8f8),
            onPrimaryContainer: Color(0xff10375C),
          ),
          fontFamily: "NotoSans"),
      routes: {
        "/signin": (context) => const SigninPage(),
        "/splashpage": (context) => const SplashPage(),
        "/contract_acceptance": (context) => const ContractAcceptancePage(),
        "/contract_acceptance/read": (context) =>
            const ContractPopupTermsPage(),
        "/contract_acceptance/success": (context) =>
            const ContractSuccessPage(),
        "/home": (context) => const HomePage(),
        "/invoices-choose-date": (context) => const HistoryInvoicesPage(),
      },
      home: const SplashPage(),
    );
  }
}
