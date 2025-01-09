import 'package:e_commerce/common/custom_button.dart';
import 'package:e_commerce/common/custom_textfield.dart';
import 'package:e_commerce/common/generic_scaffold.dart';
import 'package:e_commerce/common/loader.dart';
import 'package:e_commerce/common/text_widget.dart';
import 'package:e_commerce/core/constants/colors.dart';
import 'package:e_commerce/core/constants/image_strings.dart';
import 'package:e_commerce/core/utils/validators.dart';
import 'package:e_commerce/features/authentication/controllers/register_controller.dart';
import 'package:e_commerce/features/authentication/widgets/divider_row.dart';
import 'package:e_commerce/features/authentication/widgets/logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return Consumer<RegisterController>(
      builder: (context, value, child) {
        return Stack(
          children: [
            Form(
              key: formKey,
              child: GenericScaffold(
                children: [
                  SizedBox(
                    height: 80.h,
                  ),
                  logo(),
                  SizedBox(
                    height: 45.h,
                  ),
                  boldText(text: "Create your account"),
                  SizedBox(
                    height: 5.h,
                  ),
                  lightText(text: "Input your details", fontSize: 15.sp),
                  SizedBox(
                    height: 30.h,
                  ),
                  CustomTextfield(
                    hintText: "Enter your name",
                    controller: value.nameController,
                    validator: Validators.validateName,
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  CustomTextfield(
                    hintText: "Enter email address",
                    controller: value.emailController,
                    validator: Validators.validateEmail,
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  CustomTextfield(
                    hintText: "Create password",
                    controller: value.paaswordController,
                    validator: Validators.validatePassword,
                    suffixIcon: const Icon(
                      Icons.visibility,
                    ),
                  ),
                  SizedBox(
                    height: 50.h,
                  ),
                  CustomButton(
                    buttonText: "Create Account",
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        value.registerUser(context: context);
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
            if (value.isLoading) const OverLayLoader(),
          ],
        );
      },
    );
  }
}

_bottomRow(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      lightText(
        text: "Already have an account?",
        fontSize: 14.sp,
      ),
      SizedBox(
        width: 10.w,
      ),
      GestureDetector(
        onTap: () {
          context.push("/signIn");
        },
        child: boldText(
          text: "Sign In",
          fontSize: 15.sp,
          color: EColors.primaryColor,
        ),
      )
    ],
  );
}
