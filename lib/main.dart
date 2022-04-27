import 'package:flutter/material.dart';

import 'core/init/theme/app_theme_light.dart';
import 'view/home/view/home_view.dart';

Future<void> main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "TDD",
      home: HomeView(),
      debugShowCheckedModeBanner: false,
      theme: AppThemeLight.instance.theme,
    );
  }
}
