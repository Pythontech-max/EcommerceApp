import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:food_full_app/Dimentions.dart';
import 'package:food_full_app/auth/sign_up_page.dart';
import 'package:food_full_app/base/custom_loader.dart';
import 'package:food_full_app/colors.dart';
import 'package:food_full_app/routes/routes_helper.dart';
import 'package:food_full_app/widgets/Bigtext.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Controllers/auth_controller.dart';
import '../base/Show_custom_snackbar.dart';
import '../widgets/app_text_widget.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();

    void _login(AuthController authController) {
      String email = emailController.text.trim();
      String password = passwordController.text.trim();

      if (email.isEmpty) {
        ShowCustomSnackbar(" Please type your Email address", title: "Email");
      } else if (!GetUtils.isEmail(email)) {
        ShowCustomSnackbar(" Please type valid Email address ",
            title: "Non-Email");
      } else if (password.isEmpty) {
        ShowCustomSnackbar(" Please type your Password ", title: "Password");
      } else if (password.length < 6) {
        ShowCustomSnackbar(" Please type your Password more than 6 Characters ",
            title: "Non-Password");
      } else {
        authController.login(email, password).then((status) {
          if (status.isSuccess) {
            Get.toNamed(RouteHelper.getInitial());

          } else {
            ShowCustomSnackbar(status.message);
          }
        });
      }
    }

    return Scaffold(
      backgroundColor: Color(0xffEEEBDD),
      body: GetBuilder<AuthController>(
        builder: (authController) {
          return !authController.isLoading
              ? SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      SizedBox(
                        height: Dimentions.screenheight * 0.05,
                      ),
                      Container(
                        height: Dimentions.screenheight * 0.25,
                        child: Center(
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 80,
                            backgroundImage:
                                AssetImage("lib/assets/image/Logo1.png"),
                          ),
                        ),
                      ),
                      Container(
                        width: double.maxFinite,
                        margin: EdgeInsets.only(left: Dimentions.width20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Hello",
                                style: TextStyle(
                                    fontSize: Dimentions.fonts20 * 3.5,
                                    color: Appcolors.maincolor,
                                    fontWeight: FontWeight.bold)),
                            SizedBox(
                              height: Dimentions.height10 / 5,
                            ),
                            Text("Sign-In to your account ",
                                style: TextStyle(
                                    fontSize: Dimentions.fonts20,
                                    color: Colors.grey[500]))
                          ],
                        ),
                      ),
                      SizedBox(
                        height: Dimentions.height20,
                      ),
                      AppTextField(
                          hintText: "Email",
                          icon: Icons.email,
                          textController: emailController),
                      SizedBox(
                        height: Dimentions.height20,
                      ),
                      AppTextField(
                        hintText: "Password",
                        icon: Icons.password,
                        textController: passwordController,
                        isObscure: true,
                      ),
                      SizedBox(
                        height: Dimentions.height20,
                      ),
                      Row(
                        children: [
                          Expanded(child: Container()),
                          RichText(
                              text: TextSpan(
                            // Allows text to tap

                            text: "Sign into your account ",
                            style: TextStyle(
                                color: Colors.grey[500],
                                fontSize: Dimentions.fonts20),
                          )),
                          SizedBox(width: Dimentions.width10 * 2),
                        ],
                      ),
                      SizedBox(
                        height: Dimentions.height20,
                      ),

                      // Sign up Button
                      GestureDetector(
                        onTap: () {
                          _login(authController);
                        },
                        child: Container(
                          width: Dimentions.screenwidth / 2,
                          height: Dimentions.screenheight / 13,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(Dimentions.radius20),
                              color: Appcolors.maincolor),
                          child: Center(
                              child: Bigtext(
                            text: "Sign-In",
                            color: Colors.amber,
                            size: Dimentions.fonts26 * 1.2,
                          )),
                        ),
                      ),
                      SizedBox(
                        height: Dimentions.height20,
                      ),
                      //Tag line
                      RichText(
                          text: TextSpan(
                              // Allows text to tap

                              text: "Don\'t have an account ?",
                              style: TextStyle(
                                  color: Colors.grey[500],
                                  fontSize: Dimentions.fonts20),
                              children: [
                            TextSpan(
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () =>

                                      Get.to(()=> SignUpPage())
                                ,
                                text: " Create!",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Appcolors.maincolor,
                                    fontSize: Dimentions.fonts20))
                          ])),
                    ],
                  ),
                )
              : CustomLoader();
        },
      ),
    );
  }
}
