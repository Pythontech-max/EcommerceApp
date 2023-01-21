import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:food_full_app/Controllers/auth_controller.dart';
import 'package:food_full_app/Dimentions.dart';
import 'package:food_full_app/base/custom_loader.dart';
import 'package:food_full_app/colors.dart';
import 'package:food_full_app/models/signup_body.dart';
import 'package:food_full_app/routes/routes_helper.dart';
import 'package:food_full_app/widgets/Bigtext.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../base/Show_custom_snackbar.dart';
import '../widgets/app_text_widget.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var nameController = TextEditingController();
    var phoneController = TextEditingController();
    var signupimages = ["f.png", "t.png", "i.png", "g.png"];

    void _registration(AuthController authController ){

      var authController = Get.find<AuthController>();


      String name = nameController.text.trim();
      String phone = phoneController.text.trim();
      String email = emailController.text.trim();
      String password = passwordController.text.trim();

      if(name.isEmpty){

        ShowCustomSnackbar(" Please type your Name " ,title:  "Name");
      } else if (phone.isEmpty ){
        ShowCustomSnackbar(" Please type your Phone Number " ,title:  "Phone Number");
      }
      else if ( phone.length < 10 ){
        ShowCustomSnackbar(" Please type your Phone Number max 10 numbers " ,title:  "Phone Number-max10");}
      else if (email.isEmpty){
        ShowCustomSnackbar(" Please type your Email address" ,title:  "Email");
      }else if (!GetUtils.isEmail(email)){
        ShowCustomSnackbar(" Please type valid Email address " ,title:  "Non-Email");
      }else if (password.isEmpty){
        ShowCustomSnackbar(" Please type your Password " ,title:  "Password");
      }else if (password.length < 6){
        ShowCustomSnackbar(" Please type your Password more than 6 Characters " ,title:  "Non-Password");
      }else {

        ShowCustomSnackbar("All went well ",title: "Perfect" );


        SignUpBody signUpBody = SignUpBody( name: name,phone: phone,email: email , password: password, );

        authController.registration(signUpBody).then( (status){
          if(status.isSuccess){
            print("success registration");
            Get.offNamed(RouteHelper.getInitial());
          }
          else{
            ShowCustomSnackbar(status.message);
          }
        });



      }







    }
    return Scaffold(
      backgroundColor: Color(0xffEEEBDD),
      body: GetBuilder<AuthController>(builder: (_authcontroller){
       return !_authcontroller.isLoading?SingleChildScrollView(
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
                   backgroundImage: AssetImage("lib/assets/image/Logo1.png"),
                 ),
               ),
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
             AppTextField(
               hintText: "Phone",
               icon: Icons.phone,
               textController: phoneController,
             ),
             SizedBox(
               height: Dimentions.height20,
             ),
             AppTextField(
               hintText: "Name",
               icon: Icons.person,
               textController: nameController,
             ),
             SizedBox(
               height: Dimentions.height20 * 2 / 1.5,
             ),
             // Sign up Button
             GestureDetector(
               onTap: () {
                 _registration(_authcontroller);
               },
               child: Container(
                 width: Dimentions.screenwidth / 2,
                 height: Dimentions.screenheight / 13,
                 decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(Dimentions.radius20),
                     color: Appcolors.maincolor),
                 child: Center(
                     child: Bigtext(
                       text: "Sign-Up",
                       color: Colors.amber,
                       size: Dimentions.fonts26 * 1.2,
                     )),
               ),
             ),
             SizedBox(
               height: Dimentions.height20 / 2,
             ),
             //Tag line
             RichText(
                 text: TextSpan(
                   // Allows text to tap
                     recognizer: TapGestureRecognizer()
                       ..onTap = () => Get.back(),
                     text: "Have an account already ?",
                     style: TextStyle(
                         color: Colors.grey[500],
                         fontSize: Dimentions.fonts20)
                ,children: [TextSpan(text: " Click-here!" ,style: TextStyle(color: Colors.black),    recognizer: TapGestureRecognizer()
                   ..onTap = () => Get.back(), )] )),
             RichText(
                 text: TextSpan(
                     text: "Sign up using other methods",
                     style: TextStyle(
                         color: Colors.grey[500],
                         fontSize: Dimentions.fonts20 * .75))),
             Wrap(
               children: List.generate(
                   4,
                       (index) => Padding(
                     padding: EdgeInsets.all(8),
                     child: CircleAvatar(
                       backgroundColor: Colors.white,
                       radius: Dimentions.radius30 * .70,
                       backgroundImage: AssetImage(
                           "lib/assets/image/" + signupimages[index]),
                     ),
                   )),
             )
           ],
         ),
       ): const CustomLoader();



      },),
    );


  





  }
}
