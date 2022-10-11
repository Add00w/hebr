import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../features/home/ui/pages/home_page.dart';
import '../../../features/profile/ui/pages/profile_page.dart';
import '../../../features/publish/ui/pages/publish_page.dart';
import '../../../features/search/bloc/search_cubit.dart';
import '../../../features/search/ui/pages/search_page.dart';
import '../../../features/search/ui/pages/search_result.dart';
import '../../bloc/bottom_nav_cubit.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);
  static const _pages = [
    HomePage(),
    SearchResultPage(),
    PublishPage(),
    SizedBox(),
    ProfilePage()
  ];
  @override
  Widget build(BuildContext context) {
    String result =
        (BlocProvider.of<SearchCubit>(context).state as SearchResult).result;
    return BlocProvider(
      create: (context) => BottomNavCubit(),
      child: BlocBuilder<BottomNavCubit, int>(
        builder: (context, currentIndex) {
          return Scaffold(
            body: _pages[currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              onTap: (index) async {
                if (index == 1 && (result.isEmpty)) {
                  result = await showSearch(
                        context: context,
                        delegate: SearchPage(),
                      ) ??
                      '';
                  context.read<BottomNavCubit>().changeBottomNavIndex(index);
                  BlocProvider.of<SearchCubit>(context).selectedResult(result);
                } else {
                  context.read<BottomNavCubit>().changeBottomNavIndex(index);
                }
              },
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
