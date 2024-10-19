import 'package:flatten/controllers/auth/login_controller.dart';
import 'package:flatten/helpers/extensions/string.dart';
import 'package:flatten/helpers/theme/app_style.dart';
import 'package:flatten/helpers/utils/mixins/ui_mixin.dart';
import 'package:flatten/helpers/widgets/my_button.dart';
import 'package:flatten/helpers/widgets/my_spacing.dart';
import 'package:flatten/helpers/widgets/my_text.dart';
import 'package:flatten/helpers/widgets/my_text_style.dart';
import 'package:flatten/views/layouts/auth_layout.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:get/state_manager.dart';
import 'package:lucide_icons/lucide_icons.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> with UIMixin {
  late LoginController controller;

  @override
  void initState() {
    super.initState();
    controller = Get.put(LoginController());
  }

  @override
  Widget build(BuildContext context) {
    return AuthLayout(
        child: GetBuilder<LoginController>(
            init: controller,
            builder: (controller) {
              return Padding(
                padding: MySpacing.all(flexSpacing),
                child: Form(
                  key: controller.basicValidator.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                          child: MyText.titleLarge(
                        "login".tr(),
                        fontWeight: 700,
                      )),
                      MySpacing.height(4),
                      Center(
                          child: MyText.bodySmall(
                        "provide_email_and_password_to_access_admin_panel".tr(),
                        muted: true,
                      )),
                      MySpacing.height(64),
                      MyText.labelMedium(
                        "email_address".tr().capitalizeWords,
                      ),
                      MySpacing.height(8),
                      TextFormField(
                        validator:
                            controller.basicValidator.getValidation('email'),
                        controller:
                            controller.basicValidator.getController('email'),
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            labelText: "Email Address",
                            labelStyle: MyTextStyle.bodySmall(xMuted: true),
                            border: outlineInputBorder,
                            prefixIcon: Icon(
                              LucideIcons.mail,
                              size: 20,
                            ),
                            contentPadding: MySpacing.all(16),
                            isCollapsed: true,
                            floatingLabelBehavior: FloatingLabelBehavior.never),
                      ),
                      MySpacing.height(16),
                      MyText.labelMedium(
                        "password".tr(),
                      ),
                      MySpacing.height(8),
                      TextFormField(
                        validator:
                            controller.basicValidator.getValidation('password'),
                        controller:
                            controller.basicValidator.getController('password'),
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: !controller.showPassword,
                        decoration: InputDecoration(
                            labelText: "Password",
                            labelStyle: MyTextStyle.bodySmall(xMuted: true),
                            border: outlineInputBorder,
                            prefixIcon: Icon(
                              LucideIcons.lock,
                              size: 20,
                            ),
                            suffixIcon: InkWell(
                              onTap: controller.onChangeShowPassword,
                              child: Icon(
                                controller.showPassword
                                    ? LucideIcons.eye
                                    : LucideIcons.eyeOff,
                                size: 20,
                              ),
                            ),
                            contentPadding: MySpacing.all(16),
                            isCollapsed: true,
                            floatingLabelBehavior: FloatingLabelBehavior.never),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: MyButton.text(
                          onPressed: controller.goToForgotPassword,
                          elevation: 0,
                          padding: MySpacing.xy(8, 0),
                          splashColor: contentTheme.secondary.withOpacity(0.1),
                          child: MyText.labelSmall(
                            'forgot_password?'.tr().capitalizeWords,
                            color: contentTheme.secondary,
                          ),
                        ),
                      ),
                      MySpacing.height(28),
                      Center(
                        child: MyButton.rounded(
                          onPressed: controller.onLogin,
                          elevation: 0,
                          padding: MySpacing.xy(20, 16),
                          backgroundColor: contentTheme.primary,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              controller.loading
                                  ? SizedBox(
                                      height: 14,
                                      width: 14,
                                      child: CircularProgressIndicator(
                                        color: colorScheme.onPrimary,
                                        strokeWidth: 1.2,
                                      ),
                                    )
                                  : Container(),
                              if (controller.loading) MySpacing.width(16),
                              MyText.bodySmall(
                                'login'.tr(),
                                color: contentTheme.onPrimary,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Center(
                        child: MyButton.text(
                          onPressed: controller.gotoRegister,
                          elevation: 0,
                          padding: MySpacing.x(16),
                          splashColor: contentTheme.secondary.withOpacity(0.1),
                          child: MyText.labelMedium(
                            'i_haven_t_account'.tr(),
                            color: contentTheme.secondary,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }));
  }
}
