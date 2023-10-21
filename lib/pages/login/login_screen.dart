import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:managerapp/pages/login/login_controller.dart';
import 'package:managerapp/theme/app_theme.dart';
import 'package:managerapp/util/constant.dart';
import 'package:managerapp/util/resources.dart';
import 'package:managerapp/util/strings.dart';
import 'package:managerapp/widgets/coustom_text.dart';
import 'package:managerapp/widgets/gradient_button.dart';
import 'package:managerapp/widgets/input_textfield.dart';
import 'package:managerapp/widgets/no_appbar.dart';
import 'package:managerapp/widgets/progress_bar.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: GetBuilder<LoginController>(builder: ((controller) {
        return Stack(
          children: [
            Container(
              alignment: Alignment.bottomCenter,
              height: double.infinity,
              width: double.maxFinite,
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                AppTheme.bgGradiontStart,
                AppTheme.bgGradiontend
              ], stops: const [
                .1,
                .3
              ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
            ),
            Scaffold(
              backgroundColor: AppTheme.colorTransparent,
              appBar: NoAppBar(
                colors: AppTheme.colorTransparent,
              ),
              extendBodyBehindAppBar: true,
              body: Stack(children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          top: Constant.LARGETS_TOP_MARGIN,
                          bottom: Constant.MEDIUM_PADDING),
                      child: CustomText(
                        title: Strings.welcomeBack,
                        fontWeight: FontWeight.w500,
                        fontSize: AppTheme.largeTitleSize,
                      ),
                    ),
                    CustomText(
                      title: Strings.appName.toUpperCase(),
                      fontSize: AppTheme.medium_1,
                      fontWeight: FontWeight.w400,
                    ),
                    const SizedBox(
                      height: Constant.EXTRA_LARGE_PADDING,
                    ),
                    Expanded(
                      child: Form(
                        key: loginController.loginFormKey,
                        autovalidateMode: loginController.autoValidateMode,
                        child: Container(
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(
                                    Constant.MAIN_CARD_ROUNDED_CORNER),
                                topRight: Radius.circular(
                                    Constant.MAIN_CARD_ROUNDED_CORNER)),
                            color: AppTheme.colorWhite,
                          ),
                          padding: const EdgeInsets.symmetric(
                              vertical: Constant.LARGE_PADDING,
                              horizontal: Constant.VERY_EXTRA_LARGE_PADDING),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                const SizedBox(
                                  height: Constant.LARGE_PADDING,
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: RichText(
                                    text: TextSpan(
                                      style: TextStyle(
                                          color: AppTheme.colorPrimary,
                                          fontFamily: AppTheme.appFontName,
                                          fontWeight: FontWeight.w400,
                                          fontSize: AppTheme.mediumTitleSize),
                                      children: <TextSpan>[
                                        TextSpan(
                                          text: Strings.login,
                                          style: TextStyle(
                                              color: AppTheme.colorPrimary,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        TextSpan(
                                          text: Strings.toContinue,
                                          style: TextStyle(
                                              color: AppTheme.titleDark,
                                              fontSize: AppTheme.small),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: Constant
                                          .VERY_VERY_EXTRA_LARGE_PADDING),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: CustomText(
                                      textAlign: TextAlign.start,
                                      title: Strings.username,
                                      colors: AppTheme.titleDark,
                                      fontSize: AppTheme.small,
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(
                                      top: Constant.TEXT_FIELD_TOP_MARGIN,
                                      bottom:
                                          Constant.TEXT_FIELD_BOTTOM_MARGIN),
                                  child: CoustomTextField(
                                      prefixIcon: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: Constant
                                                  .TEXT_FIELD_ICON_PADDING_V,
                                              horizontal: Constant
                                                  .TEXT_FIELD_ICON_PADDING_H),
                                          child: SvgPicture.asset(
                                            userSvg,
                                            height:
                                                Constant.TEXT_FIELD_ICON_SIZE,
                                            width:
                                                Constant.TEXT_FIELD_ICON_SIZE,
                                            color: AppTheme.colorGray,
                                          )),
                                      labelText: Strings.username,
                                      hintColor: AppTheme.colorGray,
                                      onTextFiledOnTap: () {},
                                      keyboardType: TextInputType.text,
                                      borderEnableColors:
                                          AppTheme.loginInputBorderColor,
                                      textEditingController:
                                          loginController.usernameCtrl,
                                      fontSize: AppTheme.small,
                                      errorFontSize: AppTheme.small,
                                      borderFocusColors:
                                          AppTheme.loginInputBorderColor,
                                      textInputAction: TextInputAction.next,
                                      cursorColor: AppTheme.colorPrimary,
                                      onChanged: (String? value) {},
                                      onTextValidator: (String? value) {
                                        if (value!.isEmpty) {
                                          return Strings.pleaseEnterUsername;
                                        } else {
                                          return null;
                                        }
                                      },
                                      borderCorner:
                                          Constant.TEXT_FIELD_ROUNDED_CORNER,
                                      readOnly: false),
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: CustomText(
                                    textAlign: TextAlign.start,
                                    title: Strings.password,
                                    colors: AppTheme.titleDark,
                                    fontSize: AppTheme.small,
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(
                                      top: Constant.TEXT_FIELD_TOP_MARGIN,
                                      bottom:
                                          Constant.TEXT_FIELD_BOTTOM_MARGIN),
                                  child: CoustomTextField(
                                      onTextFiledOnTap: () {},
                                      textEditingController:
                                          loginController.passwordCtrl,
                                      prefixIcon: Padding(
                                          padding: const EdgeInsets.symmetric(
                                            vertical: Constant
                                                .TEXT_FIELD_ICON_PADDING_V,
                                          ),
                                          child: SvgPicture.asset(
                                            passwordSvg,
                                            height:
                                                Constant.TEXT_FIELD_ICON_SIZE,
                                            width:
                                                Constant.TEXT_FIELD_ICON_SIZE,
                                            color: AppTheme.colorGray,
                                          )),
                                      labelText: Strings.password,
                                      obscureText: Constant.isTrue,
                                      hintColor: AppTheme.colorGray,
                                      cursorColor: AppTheme.colorPrimary,
                                      keyboardType: TextInputType.text,
                                      borderEnableColors:
                                          AppTheme.loginInputBorderColor,
                                      fontSize: AppTheme.small,
                                      errorFontSize: AppTheme.small,
                                      borderFocusColors:
                                          AppTheme.loginInputBorderColor,
                                      textInputAction: TextInputAction.done,
                                      onChanged: (String? value) {},
                                      onTextValidator: (String? value) {
                                        if (value!.isEmpty) {
                                          return Strings.pleaseEnterPassword;
                                        } else {
                                          return null;
                                        }
                                      },
                                      borderCorner:
                                          Constant.TEXT_FIELD_ROUNDED_CORNER,
                                      readOnly: Constant.isFalse),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    loginController.remeberMe =
                                        !loginController.remeberMe;
                                    loginController.update();
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      checkBoxView(loginController.remeberMe),
                                      const SizedBox(
                                        width: Constant.VERY_SMALL_PADDING + 2,
                                      ),
                                      CustomText(
                                        textAlign: TextAlign.start,
                                        title: Strings.remeberMe,
                                        colors: AppTheme.titleDark,
                                        fontSize: AppTheme.small,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: double.infinity,
                                  padding: const EdgeInsets.only(
                                    top: Constant.VERY_EXTRA_LARGE_PADDING,
                                  ),
                                  child: GradientButton(
                                      endColor: AppTheme.bgGradiontStart,
                                      startColor: AppTheme.bgGradiontend,
                                      height: Constant.BTN_HEIGHT,
                                      onTap: () {
                                        validateForm();
                                      },
                                      child: CustomText(
                                        textAlign: TextAlign.start,
                                        title: Strings.login,
                                        fontSize: AppTheme.medium,
                                        colors: AppTheme.colorWhite,
                                        fontWeight: FontWeight.w600,
                                      )),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: Constant.TOO_LARGE_PADDING,
                                      bottom: Constant.VERY_SMALL_PADDING),
                                  child: Image.asset(
                                    logoIcon2,
                                    height: Constant.BIG_ICON_SIZE,
                                  ),
                                ),
                                CustomText(
                                  title: Strings.tagline,
                                  colors: AppTheme.titleNormal,
                                  fontSize: AppTheme.verySmall,
                                  fontWeight: FontWeight.w300,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        color: AppTheme.colorWhite,
                        width: double.infinity,
                        child: Padding(
                          padding:
                              const EdgeInsets.all(Constant.SCREEN_PADDING),
                          child: CustomText(
                            title:
                                '${Strings.appVersion}: ${loginController.appVersion}',
                            colors: AppTheme.titleDark,
                            fontSize: AppTheme.verySmall,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                ProgressBar(isLoader: loginController.isLoading)
              ]),
            ),
          ],
        );
      })),
    );
  }

  validateForm() {
    FocusScope.of(context).requestFocus(FocusNode());
    if (loginController.loginFormKey.currentState!.validate()) {
      loginController.loginRequestApi();
    } else {
      loginController.autoValidateMode = AutovalidateMode.onUserInteraction;
      loginController.update();
    }
  }

  checkBoxView(bool selected) {
    return Container(
      height: Constant.rememberMecheckBoxHighet,
      width: Constant.rememberMecheckBoxWidth,
      decoration: BoxDecoration(
        border: Border.all(color: AppTheme.loginCheckBox),
        borderRadius: BorderRadius.circular(Constant.rememberMeCheckeBoxRadius),
      ),
      child: selected
          ? Icon(
              Icons.done,
              color: AppTheme.loginCheckBox,
              size: Constant.rememberMeCheckedSize,
            )
          : null,
    );
  }
}
