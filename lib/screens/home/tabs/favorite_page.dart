import 'package:easy_localization/easy_localization.dart';
import 'package:evently/core/firebase_functions.dart';
import 'package:evently/providers/favorite_provider.dart';
import 'package:evently/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoritePage extends StatelessWidget {
  FavoritePage({super.key});

  DateFormat formatter = DateFormat('dd MMM');

  @override
  Widget build(BuildContext context) {
    ThemeProvider theme = Provider.of<ThemeProvider>(context);

    return ChangeNotifierProvider(
      create: (context) => FavoriteProvider()..getFavoriteTasks(),
      builder: (context, child) {
        FavoriteProvider favorite = Provider.of<FavoriteProvider>(context);
        FavoriteProvider favoriteWatch = context.watch<FavoriteProvider>();
        return Column(
          children: [
            Expanded(
              child: favorite.isLoading
                  ? Center(child: CircularProgressIndicator())
                  : favorite.errorMassage.isNotEmpty
                  ? Center(child: Text(favorite.errorMassage))
                  : favoriteWatch.tasks.isEmpty
                  ? Center(child: Text('noEvents'.tr()))
                  : ListView.separated(
                itemBuilder: (context, index) {
                  return Container(
                    width: double.infinity,
                    height: 193,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.asset(
                            'assets/images/${theme.themeMode == ThemeMode.light ? 'light_' : 'dark_'}${favoriteWatch.tasks[index].category.toLowerCase().replaceAll(' ', '_')}.png',
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                    8,
                                  ),
                                  color: Theme.of(
                                    context,
                                  ).colorScheme.surface,
                                ),
                                child: Text(
                                  formatter.format(
                                    DateTime.fromMillisecondsSinceEpoch(
                                      favoriteWatch.tasks[index].date,
                                    ),
                                  ),
                                  style: Theme.of(
                                    context,
                                  ).textTheme.headlineMedium,
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                    8,
                                  ),
                                  color: Theme.of(
                                    context,
                                  ).colorScheme.surface,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      favoriteWatch.tasks[index].title,
                                      style: Theme.of(
                                        context,
                                      ).textTheme.headlineSmall,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        var task = favoriteWatch.tasks[index];
                                        task.isFavorite = !task.isFavorite;
                                        FirebaseFunctions.updateTask(task);
                                      },
                                      child: Icon(favoriteWatch.tasks[index].isFavorite ? Icons.favorite : Icons.favorite_border),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) =>
                    SizedBox(height: 16),
                itemCount: favoriteWatch.tasks.length,
              ),
            ),
          ],
        );
      },
    );
  }
}
