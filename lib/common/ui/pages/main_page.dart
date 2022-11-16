import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../features/home/ui/pages/home_page.dart';
import '../../../features/library/ui/pages/saved_articles.dart';
import '../../../features/profile/ui/pages/profile_page.dart';
import '../../../features/publish/ui/pages/publish_page.dart';
import '../../../features/search/ui/pages/initial_search_page.dart';
import '../../bloc/bottom_nav_cubit.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);
  static const _pages = [
    HomePage(),
    InitialSearchPage(),
    PublishPage(),
    SavedArticlesPage(),
    ProfilePage()
  ];
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BottomNavCubit(),
      child: BlocBuilder<BottomNavCubit, int>(
        builder: (context, currentIndex) {
          return Scaffold(
            body: _pages[currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              onTap: context.read<BottomNavCubit>().changeBottomNavIndex,
              currentIndex: currentIndex,
              type: BottomNavigationBarType.fixed,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.search),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.border_color_rounded),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.bookmarks_outlined),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.account_circle),
                  label: '',
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
