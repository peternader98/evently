import 'package:easy_localization/easy_localization.dart';
import 'package:evently/providers/home_page_provider.dart';
import 'package:evently/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeProvider theme = Provider.of<ThemeProvider>(context);

    return ChangeNotifierProvider(
      create: (context) => HomePageProvider(),
      builder: (context, child) {
        HomePageProvider homePage = Provider.of<HomePageProvider>(context);

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
                Text(
                  'Peter Nader',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
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
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              spacing: 24,
              children: [
                SizedBox(
                  height: 40,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => GestureDetector(
                      onTap: () {
                        homePage.changeIndex(index);
                      },
                      child: Chip(
                        label: Text(homePage.categories[index]),
                        labelStyle: homePage.selectedIndex == index
                            ? GoogleFonts.poppins(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFFFFFFFF),
                              )
                            : Theme.of(context).textTheme.bodyMedium,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        backgroundColor: homePage.selectedIndex == index
                            ? Theme.of(context).colorScheme.primary
                            : Theme.of(context).colorScheme.onPrimary,
                      ),
                    ),
                    separatorBuilder: (context, index) => SizedBox(width: 8),
                    itemCount: homePage.categories.length,
                  ),
                ),
                ListView.separated(
                  itemBuilder: (context, index) {
                    return Container(
                      width: double.infinity,
                      height: 193,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),

                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => SizedBox(height: 16,),
                  itemCount: 5,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
