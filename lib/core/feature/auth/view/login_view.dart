import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:softnet_school_portal/core/routes/routes_name.dart';
import 'package:softnet_school_portal/core/theme/app_colors.dart';
import 'package:softnet_school_portal/core/utils/app_string.dart';
import 'package:softnet_school_portal/core/utils/constants.dart';
import 'package:softnet_school_portal/core/utils/email_validation.dart';
import 'package:softnet_school_portal/core/utils/image_icon_name.dart';
import 'package:softnet_school_portal/core/widget/custom_form_text_field.dart';
import 'package:softnet_school_portal/core/widget/custome_rounded_button.dart';
import 'package:softnet_school_portal/core/widget/logo_card.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  final _adminLoginFormKey = GlobalKey<FormState>();
  bool _isPasswordVisible = false;

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: EdgeInsets.only(
                left: defaultPadding * 2, right: defaultPadding * 3),
            child: SizedBox(
              width: size.width * 0.8,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const LogoCard(),
                  SizedBox(width: defaultPadding * 3),
                  Expanded(
                    child: Container(
                      height: size.height * 0.9,
                      width: size.width * 0.3,
                      padding: EdgeInsets.all(defaultPadding * 4),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Theme.of(context).canvasColor,
                      ),
                      child: Form(
                        key: _adminLoginFormKey,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              AppString.adminPortal,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.copyWith(
                                      fontWeight: FontWeight.w100,
                                      letterSpacing: 3),
                            ),
                            SizedBox(height: defaultPadding),
                            Text(
                              AppString.loginToYourAccount,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                      fontSize: 14, color: AppColors.greyColor),
                            ),
                            SizedBox(height: defaultPadding * 1.2),
                            const Text(
                              AppString.email,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: defaultPadding),
                            CustomTextField(
                                controller: _emailController,
                                keyboardType: TextInputType.emailAddress,
                                obscureText: false,
                                suffix: null,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return AppString.required;
                                  } else if (!EmailValidation.isValidEmail(
                                      value)) {
                                    return AppString.provideValidEmail;
                                  }
                                  return null;
                                }),
                            SizedBox(height: defaultPadding),
                            const Text(
                              AppString.password,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: defaultPadding),
                            CustomTextField(
                                controller: _passwordController,
                                keyboardType: TextInputType.visiblePassword,
                                obscureText: !_isPasswordVisible,
                                suffix: IconButton(
                                  icon: Icon(
                                    _isPasswordVisible
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: AppColors.greyColor,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _isPasswordVisible = !_isPasswordVisible;
                                    });
                                  },
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return AppString.required;
                                  } else if (value.length < 8) {
                                    return AppString.passwordLength;
                                  }
                                  return null;
                                }),
                            SizedBox(height: defaultPadding * 2),
                            CustomRoundedButton(
                              color: AppColors.primaryColorDark,
                              name: AppString.loginButton,
                              onTap: () {
                                context.pushNamed(RouteName.main);
                                // if (_adminLoginFormKey.currentState!
                                //     .validate()) {
                                // }
                              },
                            ),
                            SizedBox(height: defaultPadding),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Sign up with',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                          fontSize: 14,
                                          color: AppColors.greyColor),
                                ),
                                SizedBox(width: defaultPadding),
                                CircleAvatar(
                                  backgroundColor: AppColors.lightGrey,
                                  child: SvgPicture.asset(
                                    googleIcon,
                                    height: 20,
                                    width: 20,
                                  ),
                                ),
                                SizedBox(width: defaultPadding),
                                CircleAvatar(
                                  backgroundColor: AppColors.lightGrey,
                                  child: SvgPicture.asset(
                                    facebookIcon,
                                    height: 20,
                                    width: 20,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
