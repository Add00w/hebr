import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import './splash_page_cubit.dart';
import '../../generated/locale_keys.g.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

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
        systemOverlayStyle: SystemUiOverlayStyle.dark, // status bar brightness
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: MediaQuery.of(context).size.height * 0.5,
            child: const FlutterLogo(
              size: 50,
            ),
          ),
          Positioned(
            bottom: MediaQuery.of(context).size.height * 0.05,
            child: Text(
              LocaleKeys.share_your_ideas_with_world.tr(),
              style: const TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
