import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hebr/blocs/splash_page_cubit/splash_page_cubit.dart';

import 'package:hebr/generated/locale_keys.g.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<SplashPageCubit>(context).updateState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      appBar: AppBar(
        backgroundColor: Colors.transparent, // status bar color
        brightness: Brightness.dark, // status bar brightness
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: MediaQuery.of(context).size.height * 0.5,
            child: FlutterLogo(
              size: 50,
            ),
          ),
          Positioned(
            bottom: MediaQuery.of(context).size.height * 0.05,
            child: Text(
              LocaleKeys.share_your_ideas_with_world.tr(),
              style: TextStyle(fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}
