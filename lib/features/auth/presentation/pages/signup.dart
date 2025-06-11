import 'package:ekub_application/config/theme/app_color_pallet.dart';
import 'package:ekub_application/core/utils/common_snackbar.dart';
import 'package:ekub_application/core/utils/common_widget.dart';
import 'package:ekub_application/features/auth/presentation/pages/signin.dart';
import 'package:ekub_application/features/home_page/presentation/page/index_page.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../bloc/auth_bloc.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  String username = '';
  String email = '';
  String phone = '';
  String password = '';
  String confirmPassword = '';
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
                        TextString: "SIGNUP",
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
                          FromTop: 10,
                          TextString: "Email",
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
                        hintText: "enter your email",
                        textType: "email",
                        onChanged: (onChange) {
                          setState(() {
                            email = onChange;
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
                          FromTop: 10,
                          TextString: "Phone",
                          FontSize: 18,
                          TextColor: Theme.of(context).colorScheme.primary,
                          TextFontWeight: FontWeight.bold,
                        ),
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 30, right: 30),
                      child: IntlPhoneField(
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onPrimary,
                          fontSize: 16,
                        ),
                        decoration: InputDecoration(
                          labelText: 'Phone Number',
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Theme.of(context).colorScheme.onPrimary,
                                width: 2),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        initialCountryCode: 'ET',
                        onChanged: (newphone) {
                          print(newphone.completeNumber);
                          setState(() {
                            phone = newphone.completeNumber;
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
                          FromTop: 10,
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 25,
                        ),
                        ReusableText(
                          FromTop: 10,
                          TextString: "Confirm Password",
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
                        hintText: "enter your password again",
                        textType: "confirm_password",
                        onChanged: (onChange) {
                          setState(() {
                            confirmPassword = onChange;
                          });
                        },
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    InkWell(
                      onTap: () {
                        print("clicked");
                        context.read<AuthBloc>().add(
                              AuthSignup(
                                username: username,
                                email: email,
                                phone: phone,
                                password: password,
                                confirmPassword: confirmPassword,
                              ),
                            );
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
                            TextString: "Register",
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
                          text: " have an account? ",
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
                                      builder: (_) => SigninPage()));
                            },
                          text: "Signin",
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
