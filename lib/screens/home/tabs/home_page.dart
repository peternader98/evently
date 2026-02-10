import 'package:easy_localization/easy_localization.dart';
import 'package:evently/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeProvider theme = Provider.of<ThemeProvider>(context);

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        centerTitle: false,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'welcomeBack'.tr(),
              style: Theme.of(context).textTheme.displaySmall,
            ),
            Text('Peter Nader', style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
        actions: [
          IconButton(
            splashRadius: 24,
            onPressed: () {
              if (theme.themeMode == ThemeMode.light) {
                theme.changeTheme(ThemeMode.dark);
              } else {
                theme.changeTheme(ThemeMode.light);
              }
            },
            icon: ImageIcon(
              AssetImage(
                'assets/images/${theme.themeMode == ThemeMode.light ? 'sun.png' : 'moon.png'}',
              ),
            ),
          ),
          const SizedBox(width: 4),
          ElevatedButton(
            onPressed: () {
              if (context.locale == const Locale('ar', 'EG')) {
                context.setLocale(const Locale('en', 'US'));
              } else {
                context.setLocale(const Locale('ar', 'EG'));
              }
            },
            child: context.locale == const Locale('ar', 'EG')
                ? Text('ar'.tr())
                : Text('en'.tr()),
          ),
          const SizedBox(width: 16),
        ],
      ),
    );
  }
}
