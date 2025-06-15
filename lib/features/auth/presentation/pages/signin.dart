import 'package:ekub_application/config/theme/app_color_pallet.dart';
import 'package:ekub_application/core/utils/common_snackbar.dart';
import 'package:ekub_application/core/utils/common_widget.dart';
import 'package:ekub_application/core/utils/toast_info.dart';
import 'package:ekub_application/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:ekub_application/features/auth/presentation/pages/signup.dart';
import 'package:ekub_application/features/home_page/presentation/page/index_page.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({super.key});

  @override
  State<SigninPage> createState() => _SigninPageState();
}

String username = '';
String password = '';

class _SigninPageState extends State<SigninPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthFailure) {
            commonSnackBar(
                context,
                "Error: please check your internet connection.",
                ColorCollections.DeepGreyColor);
          } else if (state is AuthSuccess) {
            commonSnackBar(context, "User Signup successfully!",
                ColorCollections.DeepGreyColor);
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => IndexPage()));
          }
        },
        builder: (context, state) {
          return Stack(
            children: [
              Container(
                margin: const EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: ReusableText(
                        TextString: "Welcome To EQUB",
                        FontSize: 30,
                        TextColor: Theme.of(context).colorScheme.primary,
                        TextFontWeight: FontWeight.w900,
                      ),
                    ),
                    Center(
                      child: ReusableText(
                        FromLeft: 50,
                        FromRight: 50,
                        FromTop: 20,
                        TextString: "LOGIN",
                        FontSize: 30,
                        TextColor: Theme.of(context).colorScheme.onTertiary,
                        TextFontWeight: FontWeight.w900,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 25,
                        ),
                        ReusableText(
                          FromTop: 20,
                          TextString: "Username",
                          FontSize: 18,
                          TextColor: Theme.of(context).colorScheme.primary,
                          TextFontWeight: FontWeight.bold,
                        ),
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 30, right: 30),
                      child: reusableTextField(
                        context: context,
                        hintText: "enter your username",
                        textType: "username",
                        onChanged: (onChange) {
                          setState(() {
                            username = onChange;
                          });
                        },
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 25,
                        ),
                        ReusableText(
                          FromTop: 20,
                          TextString: "Password",
                          FontSize: 18,
                          TextColor: Theme.of(context).colorScheme.primary,
                          TextFontWeight: FontWeight.bold,
                        ),
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 30, right: 30),
                      child: reusableTextField(
                        context: context,
                        hintText: "enter your password",
                        textType: "password",
                        onChanged: (onChange) {
                          setState(() {
                            password = onChange;
                          });
                        },
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    InkWell(
                      onTap: () {
                        if(username.isEmpty || username.length<3){
                          toastInfo(toastInfo: "Username is empty or wrong username.");
                        }else if(password.isEmpty||password.length<5){
                          toastInfo(toastInfo: "password is empty or wrong password.");
                        }
                        else{
                          context.read<AuthBloc>().add(
                            AuthSignin(
                              username: username,
                              password: password,
                            ),
                          );
                        }
                      },
                      child: Container(
                        margin: const EdgeInsets.only(left: 30, right: 30),
                        height: 50,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.green,
                        ),
                        child: Center(
                          child: ReusableText(
                            TextString: "Log In",
                            FontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    RichText(
                      text: TextSpan(children: [
                        TextSpan(
                          text: "Don't have an account? ",
                          style: TextStyle(
                            fontSize: 16,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                        TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => SignupPage()));
                            },
                          text: "Signup",
                          style: TextStyle(
                            fontSize: 16,
                            color: Theme.of(context).colorScheme.onTertiary,
                          ),
                        ),
                      ]),
                    ),
                  ],
                ),
              ),
              state is AuthLoading
                  ? Center(
                      child: Container(
                        height: 60,
                        width: 60,
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Theme.of(context).colorScheme.onTertiary,
                        ),
                        child: CircularProgressIndicator(),
                      ),
                    )
                  : const SizedBox(),
            ],
          );
        },
      ),
    );
  }
}
