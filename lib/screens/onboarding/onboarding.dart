import 'package:flutter/material.dart';

class Onboarding extends StatelessWidget {
  static const String routeName = 'onboarding';

  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    bool isEnglish = true;
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
                      'Personalize Your Experience',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(
                      'Choose your preferred theme and language to get started with a comfortable, tailored experience that suits your style.',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'Language',
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                    const Spacer(),
                    ElevatedButton(
                      style: isEnglish
                          ? Theme.of(context).elevatedButtonTheme.style
                          : Theme.of(context).textButtonTheme.style,
                      onPressed: () {},
                      child: Text('English'),
                    ),
                    const SizedBox(width: 8),
                    ElevatedButton(
                      style: isEnglish
                          ? Theme.of(context).textButtonTheme.style
                          : Theme.of(context).elevatedButtonTheme.style,
                      onPressed: () {},
                      child: Text('Arabic'),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'Theme',
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                    const Spacer(),
                    ElevatedButton(
                      style: Theme.of(context).textButtonTheme.style,
                      onPressed: () {},
                      child: ImageIcon(
                        AssetImage('assets/images/sun.png'),
                        size: 24.0,
                      ),
                    ),
                    const SizedBox(width: 8),
                    ElevatedButton(
                      // style: Theme.of(context).textButtonTheme.style,
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
                'Let\'s start',
                style: Theme.of(context).textTheme.displayMedium,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
