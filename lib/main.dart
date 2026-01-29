import 'package:easy_localization/easy_localization.dart';
import 'package:evently/core/app_theme.dart';
import 'package:evently/providers/theme_provider.dart';
import 'package:evently/screens/authentication/forget_password.dart';
import 'package:evently/screens/authentication/login.dart';
import 'package:evently/screens/authentication/register.dart';
import 'package:evently/screens/onboarding/onboarding.dart';
import 'package:evently/screens/onboarding/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: WidgetsBinding.instance);
  await EasyLocalization.ensureInitialized();
  FlutterNativeSplash.remove();
  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en', 'US'), Locale('ar', 'EG')],
      path: 'assets/translations',
      fallbackLocale: const Locale('en', 'US'),
      child: ChangeNotifierProvider(
        create: (context) => ThemeProvider(),
        child: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeProvider.themeMode,
      initialRoute: Onboarding.routeName,
      routes: {
        Onboarding.routeName: (context) => const Onboarding(),
        OnboardingScreen.routeName: (context) => const OnboardingScreen(),
        Login.routeName: (context) => const Login(),
        Register.routeName: (context) => const Register(),
        ForgetPassword.routeName: (context) => const ForgetPassword(),
      },
    );
  }
}
