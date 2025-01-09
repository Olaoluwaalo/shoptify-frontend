import 'package:e_commerce/common/custom_button.dart';
import 'package:e_commerce/common/custom_textfield.dart';
import 'package:e_commerce/common/generic_scaffold.dart';
import 'package:e_commerce/common/loader.dart';
import 'package:e_commerce/common/text_widget.dart';
import 'package:e_commerce/core/constants/colors.dart';
import 'package:e_commerce/core/constants/image_strings.dart';
import 'package:e_commerce/core/utils/validators.dart';
import 'package:e_commerce/features/authentication/controllers/sign_in_controller.dart';
import 'package:e_commerce/features/authentication/widgets/divider_row.dart';
import 'package:e_commerce/features/authentication/widgets/logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final loginFormKey = GlobalKey<FormState>();
    return Consumer<SignInController>(builder: (context, lg, child) {
      return Stack(
        children: [
          Form(
            key: loginFormKey,
            child: GenericScaffold(
              children: [
                SizedBox(
                  height: 100.h,
                ),
                logo(),
                SizedBox(
                  height: 45.h,
                ),
                boldText(text: "Sign in your account"),
                SizedBox(
                  height: 5.h,
                ),
                lightText(text: "Input your details", fontSize: 15.sp),
                SizedBox(
                  height: 30.h,
                ),
                CustomTextfield(
                  hintText: "Enter email address",
                  controller: lg.emailController,
                  validator: Validators.validateEmail,
                ),
                SizedBox(
                  height: 12.h,
                ),
                CustomTextfield(
                  hintText: "Enter password",
                  controller: lg.paaswordController,
                  validator: Validators.validatePassword,
                  suffixIcon: const Icon(
                    Icons.visibility,
                  ),
                ),
                SizedBox(
                  height: 50.h,
                ),
                CustomButton(
                  buttonText: lg.isLoading ? "Signing In..." : "Sign In",
                  onTap: lg.isLoading
                      ? null 
                      : () async {
                          if (loginFormKey.currentState!.validate()) {
                            await lg.login(context: context);
                                                      }
                             

                        },
                ),
                SizedBox(
                  height: 12.h,
                ),
                const DividerRow(),
                SizedBox(
                  height: 12.h,
                ),
                const GoogleOrFacebookAuthButton(
                  buttonText: "Sign in with Google",
                  image: EImages.googleLogo,
                ),
                SizedBox(
                  height: 12.h,
                ),
                const GoogleOrFacebookAuthButton(
                  buttonText: "Sign in with Facebook",
                  image: EImages.facebookLogo,
                ),
                SizedBox(
                  height: 12.h,
                ),
                _bottomRow(context),
              ],
            ),
          ),
          if (lg.isLoading) const OverLayLoader(),
        ],
      );
    });
  }
}

_bottomRow(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
      lightText(
        text: "Don't have an account?",
        fontSize: 14.sp,
      ),
      SizedBox(
        width: 10.w,
      ),
      GestureDetector(
        onTap: () {
          context.push("/signUpScreen");
        },
        child: boldText(
          text: "Sign Up",
          fontSize: 15.sp,
          color: EColors.primaryColor,
        ),
      )
    ],
  );
}
