import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:managerapp/pages/splash/splash_controller.dart';
import 'package:managerapp/theme/app_theme.dart';
import 'package:managerapp/util/constant.dart';
import 'package:managerapp/util/resources.dart';
import 'package:managerapp/util/strings.dart';
import 'package:managerapp/widgets/coustom_text.dart';
import 'package:managerapp/widgets/no_appbar.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final splshController = Get.put(SplashController());
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1), () {
      splshController.getUserData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(builder: (controller) {
      return Scaffold(
        backgroundColor: AppTheme.colorWhite,
        appBar: NoAppBar(),
        extendBodyBehindAppBar: true,
        body: _body(),
      );
    });
  }

  _body() {
    return Stack(
      children: [
        Container(
          alignment: Alignment.bottomCenter,
          height: double.infinity,
          width: double.maxFinite,
          decoration: BoxDecoration(
              gradient: RadialGradient(colors: [
            AppTheme.bgGradiontend,
            AppTheme.bgGradiontStart,
          ], radius: .8)),
          child: Padding(
            padding: const EdgeInsets.all(Constant.MEDIUM_PADDING),
            child: CustomText(
                title: '${Strings.appVersion}: ${splshController.appversion}'),
          ),
        ),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: Constant.SCREEN_PADDING * 5,
                ),
                child: Image.asset(
                  logoIcon,
                  fit: BoxFit.contain,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
