import 'package:evently/providers/home_provider.dart';
import 'package:evently/screens/add_event/add_event.dart';
import 'package:evently/screens/home/tabs/favorite_page.dart';
import 'package:evently/screens/home/tabs/home_page.dart';
import 'package:evently/screens/home/tabs/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  static const String routeName = 'home';

  Home({super.key});

  List<Widget> tabs = [HomePage(), FavoritePage(), ProfilePage()];

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeProvider(),
      builder: (context, child) {
        HomeProvider home = Provider.of<HomeProvider>(context);

        return Scaffold(
          backgroundColor: Theme.of(context).colorScheme.surface,
          body: tabs[home.selectedIndex],
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.of(context).pushNamed(AddEvent.routeName);
            },
            child: Icon(Icons.add),
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: home.selectedIndex,
            onTap: (index) {
              home.changeIndex(index);
            },
            items: [
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage('assets/images/home.png')),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage('assets/images/heart.png')),
                label: 'Favorite',
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage('assets/images/user.png')),
                label: 'Profile',
              ),
            ],
          ),
        );
      }
    );
  }
}
