import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class Onboarding extends StatelessWidget {
  static const String routeName = 'onboarding';

  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    bool isLight = true;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: Image.asset(
          'assets/images/light_logo.png',
          width: 142,
          height: 27,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          spacing: 24,
          children: [
            Image.asset(
              'assets/images/light_being_creative.png',
              width: 343,
              height: 343,
            ),
            Column(
              spacing: 16,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 8,
                  children: [
                    Text(
                      'onboardingTitle'.tr(),
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(
                      'onboardingSubtitle'.tr(),
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'language'.tr(),
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                    const Spacer(),
                    ElevatedButton(
                      style: context.locale == const Locale('ar', 'EG')
                          ? Theme.of(context).textButtonTheme.style
                          : Theme.of(context).elevatedButtonTheme.style,
                      onPressed: () {
                        context.setLocale(const Locale('en', 'US'));
                      },
                      child: Text('english'.tr()),
                    ),
                    const SizedBox(width: 8),
                    ElevatedButton(
                      style: context.locale == const Locale('en', 'US')
                          ? Theme.of(context).textButtonTheme.style
                          : Theme.of(context).elevatedButtonTheme.style,
                      onPressed: () {
                        context.setLocale(const Locale('ar', 'EG'));
                      },
                      child: Text('arabic'.tr()),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'theme'.tr(),
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                    const Spacer(),
                    ElevatedButton(
                      // style: Theme.of(context).textButtonTheme.style,
                      onPressed: () {},
                      child: ImageIcon(
                        AssetImage('assets/images/sun.png'),
                        size: 24.0,
                      ),
                    ),
                    const SizedBox(width: 8),
                    ElevatedButton(
                      style: Theme.of(context).textButtonTheme.style,
                      onPressed: () {},
                      child: ImageIcon(
                        AssetImage('assets/images/moon.png'),
                        size: 24.0,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              onPressed: () {},
              child: Text(
                'startText'.tr(),
                style: Theme.of(context).textTheme.displayMedium,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
