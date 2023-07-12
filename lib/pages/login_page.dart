import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:winwin/data/models/user_model.dart";
import "package:winwin/pages/constant.dart";
import "package:winwin/pages/widgets/loading_button.dart";
import "package:winwin/pages/widgets/snackbar.dart";

import "../bloc/user_bloc.dart";

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController(text: '');
  TextEditingController usernameController = TextEditingController(text: '');
  TextEditingController passwordController = TextEditingController(text: '');
  TextEditingController phoneNumberController = TextEditingController(text: '');

  String message = "null";
  @override
  Widget build(BuildContext context) {
    //handle
    handleLogin(String message){
       if (emailController.text == "" || //buat logic login
          passwordController.text == "" ) {
        ScaffoldMessenger.of(context).showSnackBar(CustomSnackbar(
          color: Colors.orangeAccent,
          icon: Icons.warning,
          message: "Please fill in all the necessary information!",
        ));
      
      } else if (message != "null" && message.isNotEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(CustomSnackbar(
          color: Colors.red,
          icon: Icons.warning,
          message: message,
        ));
      }

      BlocProvider.of<UserBloc>(context).add(UserPostLogin(
          emailController.text,
          //usernameController.text,
          //phoneNumberController.text,
          passwordController.text,));
    }
    Widget emailAddressInput() {
      return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 50,
              padding: const EdgeInsets.symmetric(horizontal: 14.0),
              decoration: BoxDecoration(
                  color: appBarColor,
                  borderRadius: BorderRadius.circular(10.0)),
              child: Center(
                child: Row(
                  children: [
                    Image.asset(
                      'assets/icon_email.png',
                      width: 26,
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Email",
                              style: textColor2TextStyle.copyWith(
                                fontSize: 8,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 2),
                            child: TextFormField(
                              //controller: ,
                              controller: emailController,
                              style: textButtonTextStyle.copyWith(
                                  fontSize: 11, fontWeight: FontWeight.w600),
                              decoration: InputDecoration.collapsed(
                                hintText: "example@gmail.com",
                                hintStyle: textButtonTextStyle.copyWith(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      );
    }

    Widget passwordInput() {
      return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 50,
              padding: const EdgeInsets.symmetric(horizontal: 9.0),
              decoration: BoxDecoration(
                  color: appBarColor,
                  borderRadius: BorderRadius.circular(10.0)),
              child: Center(
                child: Row(
                  children: [
                    Image.asset(
                      'assets/icon_password.png',
                      width: 35,
                    ),
                    const SizedBox(
                      width: 14,
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Password",
                              style: textColor2TextStyle.copyWith(
                                fontSize: 8,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 2),
                            child: TextFormField(
                              controller: passwordController,
                              style: textButtonTextStyle.copyWith(
                                  fontSize: 11, fontWeight: FontWeight.w600),
                              decoration: InputDecoration.collapsed(
                                hintText: "* * * * * * * *",
                                hintStyle: textButtonTextStyle.copyWith(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Image.asset(
                      'assets/icon_eye_close.png',
                      width: 26,
                      height: 23,
                    ),
                    const SizedBox(
                      width: 9,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      );
    }

    Widget buttonLogin(String message) {
            return Container(
              width: double.infinity,
              height: 55,
              margin: const EdgeInsets.symmetric(vertical: 14),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: buttonColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                onPressed: () {
                  handleLogin(message);
                },
                child: Text(
                  "Login",
                  style: textButtonTextStyle.copyWith(
                      fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ),
            );
          }

    return Scaffold(
      backgroundColor: backgroundColor,
      body: BlocConsumer<UserBloc, UserState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is UserPostError) {
            message = state.code;
          } else if (state is UserPostLoginSuccess) {
            UserModel user = state.user;
            // print("user login: ${user.name}");
            Future.delayed(Duration.zero, () {
              Navigator.pushNamed(context, '/home', arguments: user);
            });
          }

          return Container(
            margin: EdgeInsets.only(top: 25),
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 13),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/icon_row_left.png',
                        width: 24,
                        height: 24,
                      ),
                      Padding(
                          padding:
                              const EdgeInsets.symmetric(horizontal: 5.0)),
                      Text(
                        "Login",
                        style: textColor1TextStyle.copyWith(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Welcome back!",
                    style: textColor1TextStyle.copyWith(
                        fontSize: 13, fontWeight: FontWeight.w600),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Please login to continue!",
                    style: textColor1TextStyle.copyWith(
                        fontSize: 13, fontWeight: FontWeight.w600),
                  ),
                ),
                const SizedBox(height: 30),
                Column(
                  children: [
                    emailAddressInput(),
                    passwordInput(),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                       onTap: () => Navigator.pushNamed(
                                  context, '/forgot-password'),
                              child: Text(
                                " Forgot Password?",
                                style: textSecondaryTextStyle.copyWith(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 14),
                  child: state is UserPostLoading
                    ? LoadingButton()
                    : buttonLogin(message),
                   
                ),
                Row(
                  children: [
                    const SizedBox(height: 10),
                    Expanded(
                      child: Align(
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Don't have an account?",
                              style: textColor1TextStyle.copyWith(
                                fontSize: 10,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            GestureDetector(
                              onTap: () => Navigator.pushNamed(
                                  context, '/register'),
                              child: Text(
                                " Register Now",
                                style: textColor3TextStyle.copyWith(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}