import 'package:flutter/material.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

import 'package:hebr/generated/codegen_loader.g.dart';
import 'hebr_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await EasyLocalization.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: await getTemporaryDirectory(),
  );
  runApp(
    EasyLocalization(
      child: HebrApp(),
      supportedLocales: [Locale('en'), Locale('ar')],
      fallbackLocale: Locale('en'),
      startLocale: Locale('en'),
      path: 'assets/translations',
      assetLoader: CodegenLoader(),
    ),
  );
}
