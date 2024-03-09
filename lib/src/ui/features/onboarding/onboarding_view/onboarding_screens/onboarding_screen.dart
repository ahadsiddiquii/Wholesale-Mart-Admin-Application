// ignore_for_file: unused_element

import 'dart:convert';

import 'package:flutter/material.dart';

import '../../../../configs/local_storage_sqflite/local_storage_sqflite.dart';
import '../../../../configs/local_storage_sqflite/sqflite_model.dart';
import '../../../../configs/screen_config.dart';
import '../../../../generic/assets/image_assets.dart';
import '../../../../generic/context/app_context.dart';
import '../../../../generic/exports/constants_exports.dart';
import '../../../../generic/exports/helper_functions_exports.dart';
import '../../../../generic/exports/widget_exports.dart';
import '../../onboarding_view_model/onboarding_service.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final GlobalKey<FormState> signInFormKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool rememberMe = false;
  @override
  void initState() {
    super.initState();
    fetchRememberedMeData();
  }

  void updateRememberMe(
    bool value,
  ) {
    setState(() {
      rememberMe = value;
    });
  }

  Future<void> fetchRememberedMeData() async {
    final Map<String, dynamic>? rememberedData =
        await _RememberMeService.getRememberMeData();
    if (rememberedData != null) {
      updateRememberMe(
        true,
      );

      emailController.text = rememberedData[_RememberMeService.userNameKey];
      passwordController.text = rememberedData[_RememberMeService.passwordKey];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: appContext.scaffoldKey,
      backgroundColor: ThemeColors.kThemeColor,
      body: Form(
        key: signInFormKey,
        child: SingleChildScrollView(
          child: MainBorder(
            children: [
              HeightSpacer(
                space: Spaces.defaultSpacingVertical * 4.5,
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: ScreenConfig.screenSizeWidth * 0.2,
                  ),
                  child: Image.asset(
                    ImageAssets.DHA_MART_LOGO,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              HeightSpacer(
                space: Spaces.defaultSpacingVertical * 3,
              ),
              CustomText(
                "We're highly delighted to collaborate you with DHA Mart",
                style: FontSizes.size18Medium(
                  color: Colors.white,
                ),
                textAlign: TextAlign.start,
              ),
              HeightSpacer(
                space: Spaces.fieldSpacingVertical,
              ),
              CustomText(
                'For the process kindly add your details below',
                style: FontSizes.size16Medium(
                  color: Colors.white,
                ),
                textAlign: TextAlign.start,
              ),
              HeightSpacer(
                space: Spaces.defaultSpacingVertical * 2,
              ),
              CustomText(
                'Login to your account',
                style: FontSizes.size20Medium(
                  color: Colors.white,
                ),
                textAlign: TextAlign.start,
              ),
              const HeightSpacer(),
              EliteWholesalePrimaryTextField(
                hintText: 'Email or Phone',
                prefixIcon: Icons.email_outlined,
                controller: emailController,
                keyboadType: TextInputType.text,
                validator: (val) => FieldValidator.genericTextValidator(
                    val!, 'Please enter your email or phone number'),
                onChanged: (val) {
                  signInFormKey.currentState!.validate();
                },
              ),
              const HeightSpacer(),
              EliteWholesalePrimaryTextField(
                hintText: 'Password',
                prefixIcon: Icons.password,
                controller: passwordController,
                isPasswordField: true,
                keyboadType: TextInputType.visiblePassword,
                validator: (val) =>
                    FieldValidator.passwordFieldSigninValidator(val!),
                onChanged: (val) {
                  signInFormKey.currentState!.validate();
                },
              ),
              HeightSpacer(
                space: Spaces.fieldSpacingVertical,
              ),
              const _RememberMeForgotPasswordDisplay(),
              HeightSpacer(
                space: Spaces.defaultSpacingVertical * 3,
              ),
              WideButton(
                borderAlreadyGiven: true,
                customColor: Colors.white,
                customFontColor: ThemeColors.kThemeColor,
                onPressed: () {
                  if (signInFormKey.currentState!.validate()) {
                    OnboardingService.loginUser(
                      context,
                      userName: emailController.text,
                      userPassword: passwordController.text,
                    );
                  }
                },
                buttonText: 'Login',
              ),
              HeightSpacer(
                space: Spaces.defaultSpacingVertical * 2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _RememberMeForgotPasswordDisplay extends StatelessWidget {
  const _RememberMeForgotPasswordDisplay({
    this.rememberMe,
    this.rememberMeFunction,
  });

  final bool? rememberMe;
  final void Function(bool)? rememberMeFunction;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        RememberMeCheckMarkDisplay(
          rememberMe: rememberMe,
          rememberMeFunction: rememberMeFunction,
        ),
        InkWell(
          onTap: () {
            // Navigator.pushNamed(
            //   context,
            //   CustomRouter.onboardingForgotPasswordScreenRouteName,
            // );
          },
          child: CustomText(
            'Forgot password',
            style: FontSizes.size14Regular(
              color: ThemeColors.kFontPrimaryGreyColor,
              letterSpacing: Decorations.letterSpacingForSmallSizes,
            ),
          ),
        )
      ],
    );
  }
}

class _RememberMeService {
  _RememberMeService._();

  static const String _rememberMeStorageKey = 'RememberedCredentials';
  static const String userNameKey = 'userName';
  static const String passwordKey = 'password';

  static Future<Map<String, dynamic>?> getRememberMeData() async {
    final Data? rememberMeData = await LocalStorageSqfLite.getDataByKey(
      _rememberMeStorageKey,
    );
    Map<String, dynamic>? data;
    if (rememberMeData != null) {
      data = jsonDecode(
        rememberMeData.value,
      );
    }
    return data;
  }

  static void saveRememberMeCredentials(
    String userName,
    String password,
  ) {
    LocalStorageSqfLite.insertData(
      Data(
        key: _rememberMeStorageKey,
        value: jsonEncode(
          {
            userNameKey: userName,
            passwordKey: password,
          },
        ),
      ),
    );
  }

  static void deleteRememberMeData() {
    LocalStorageSqfLite.deleteData(
      _rememberMeStorageKey,
    );
  }
}

class RememberMeCheckMarkDisplay extends StatefulWidget {
  const RememberMeCheckMarkDisplay({
    super.key,
    this.rememberMeFunction,
    this.rememberMe,
  });
  final bool? rememberMe;
  final void Function(bool)? rememberMeFunction;

  @override
  State<RememberMeCheckMarkDisplay> createState() =>
      _RememberMeCheckMarkDisplayState();
}

class _RememberMeCheckMarkDisplayState
    extends State<RememberMeCheckMarkDisplay> {
  bool checkBoxValue = false;

  Widget _checkMarkDisplay() {
    if (widget.rememberMe != null) {
      checkBoxValue = widget.rememberMe!;
    }
    return Container(
      width: Decorations.kOnboardingCheckIconDiameter,
      height: Decorations.kOnboardingCheckIconDiameter,
      decoration: BoxDecoration(
        color: checkBoxValue ? Colors.white : ThemeColors.kThemeColor,
        borderRadius: BorderRadius.circular(2),
        border: Border.all(
          width: Decorations.kOnboardingIconBorder,
          color: Colors.white,
        ),
      ),
      child: checkBoxValue
          ? const Icon(
              Icons.check,
              color: ThemeColors.kThemeColor,
              size: Decorations.kOnboardingCheckIconSize,
            )
          : null,
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          checkBoxValue = !checkBoxValue;
          if (!checkBoxValue) {
            _RememberMeService.deleteRememberMeData();
          }
          if (widget.rememberMeFunction != null) {
            widget.rememberMeFunction!(checkBoxValue);
          }
        });
      },
      child: Row(
        children: [
          _checkMarkDisplay(),
          const WidthSpacer(),
          CustomText(
            'Remember me',
            style: FontSizes.size14Regular(
              color: Colors.white,
              letterSpacing: Decorations.letterSpacingForSmallSizes,
            ),
          )
        ],
      ),
    );
  }
}
