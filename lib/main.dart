import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as se;
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:managerapp/routes/app_pages.dart';
import 'package:managerapp/routes/app_routes.dart';
import 'package:managerapp/theme/app_theme.dart';
import 'package:managerapp/util/strings.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        primaryColor: AppTheme.colorPrimaryTheme,
        fontFamily: AppTheme.appFontName,
        textTheme: AppTheme.textTheme,
        appBarTheme: const AppBarTheme(
          systemOverlayStyle:
              se.SystemUiOverlayStyle(statusBarBrightness: Brightness.light),
        ),
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: AppTheme.colorPrimaryTheme,
          selectionColor: AppTheme.colorPrimaryTheme,
          selectionHandleColor: AppTheme.colorPrimaryTheme,
        ),
      ),
      defaultTransition: Transition.rightToLeft,
      title: Strings.appName,
      initialRoute: AppRoutes.SPLASH,
      getPages: AppPages.list,
      debugShowCheckedModeBanner: false,
    );
  }
}
