import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hebr/blocs/bottom_nav_cubit/bottom_nav_cubit.dart';
import 'package:hebr/ui/pages/home_page.dart';
import 'package:hebr/ui/pages/profile_page.dart';
import 'package:hebr/ui/pages/publish_page.dart';
import 'package:hebr/ui/pages/search_page.dart';
import 'package:hebr/ui/pages/search_result.dart';

class MainPage extends StatelessWidget {
  MainPage({Key? key}) : super(key: key);
  static const _pages = [
    HomePage(),
    SearchResult(),
    PublishPage(),
    SizedBox(),
    ProfilePage()
  ];
  String? _searchArticle;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BottomNavCubit(),
      child: BlocBuilder<BottomNavCubit, int>(
        builder: (context, currentIndex) {
          return Scaffold(
            body: _pages[currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              onTap: (index) async {
                if (index == 1 &&
                    (_searchArticle == null || _searchArticle!.isEmpty)) {
                  _searchArticle = await showSearch(
                      context: context, delegate: SearchPage());
                  context.read<BottomNavCubit>().changeBottomNavIndex(index);
                } else {
                  context.read<BottomNavCubit>().changeBottomNavIndex(index);
                }
              },
              currentIndex: currentIndex,
              type: BottomNavigationBarType.fixed,
              items: [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
                BottomNavigationBarItem(icon: Icon(Icons.search), label: ''),
                BottomNavigationBarItem(
                    icon: Icon(Icons.border_color_rounded), label: ''),
                BottomNavigationBarItem(
                    icon: Icon(Icons.bookmarks_outlined), label: ''),
                BottomNavigationBarItem(
                    icon: Icon(Icons.account_circle), label: ''),
              ],
            ),
          );
        },
      ),
    );
  }
}
