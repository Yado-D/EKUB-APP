//this is for the page that need the shaped container

import 'dart:ui';

import 'package:ekub_application/features/auth/presentation/pages/signin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../config/theme/app_color_pallet.dart';

//this is for reusable text

// ignore: must_be_immutable
class ReusableText extends StatelessWidget {
  String TextString;
  Color TextColor;
  double FontSize;
  FontWeight TextFontWeight;
  double FromTop;
  double FromLeft;
  double FromRight;
  double FromBottom;

  ReusableText({
    super.key,
    required this.TextString,
    this.TextColor = ColorCollections.PrimaryColor,
    required this.FontSize,
    this.TextFontWeight = FontWeight.w500,
    this.FromTop = 5,
    this.FromLeft = 5,
    this.FromRight = 5,
    this.FromBottom = 5,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: FromTop,
        left: FromLeft,
        right: FromRight,
        bottom: FromBottom,
      ),
      child: Text(
        TextString,
        overflow: TextOverflow.fade,
        style: GoogleFonts.lato(
          color: TextColor,
          fontSize: FontSize,
          fontWeight: TextFontWeight,
        ),
      ),
    );
  }
}

class ReusableTextWithLongText extends StatelessWidget {
  String TextString;
  Color TextColor;
  double FontSize;
  FontWeight TextFontWeight;
  double FromTop;
  double FromLeft;
  double FromRight;
  double FromBottom;

  ReusableTextWithLongText({
    super.key,
    required this.TextString,
    this.TextColor = ColorCollections.PrimaryColor,
    required this.FontSize,
    this.TextFontWeight = FontWeight.w500,
    this.FromTop = 5,
    this.FromLeft = 5,
    this.FromRight = 5,
    this.FromBottom = 5,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 300,
        margin: EdgeInsets.only(
          top: FromTop,
          left: FromLeft,
          right: FromRight,
          bottom: FromBottom,
        ),
        child: ShaderMask(
          shaderCallback: (Rect bounds) {
            return LinearGradient(
              colors: [Colors.black, Colors.transparent],
              stops: [0.8, 1.0],
              end: Alignment.centerRight,
            ).createShader(bounds);
          },
          blendMode: BlendMode.dstIn,
          child: Text(
            TextString,
            maxLines: 1,
            overflow: TextOverflow.clip,
            style: GoogleFonts.lato(
              color: TextColor,
              fontSize: FontSize,
              fontWeight: TextFontWeight,
            ),
          ),
        ));
  }
}

//this is for button that we use in the app

// ignore: must_be_immutable
class AppButton extends StatelessWidget {
  String ButtonText;
  double ButtonHeight;
  double ButtonWidth;
  FontWeight ButtonFontWeight;
  double FontSize;
  Color ButtonColor;
  Color ContainerColor;
  AppButton({
    super.key,
    required this.ContainerColor,
    required this.ButtonText,
    this.ButtonColor = ColorCollections.PrimaryColor,
    this.ButtonFontWeight = FontWeight.bold,
    this.ButtonHeight = 30,
    this.ButtonWidth = 70,
    this.FontSize = 20,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ButtonHeight,
      width: ButtonWidth,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: ContainerColor.withOpacity(1),
      ),
      child: Center(
        child: Text(
          ButtonText,
          style: TextStyle(
            fontWeight: ButtonFontWeight,
            fontSize: FontSize,
            color: ButtonColor,
          ),
        ),
      ),
    );
  }
}

//reusable text field

Widget reusableTextField({
  required BuildContext context,
  String? iconName, // Changed to camelCase
  String suffixIconName = '', // Changed to camelCase
  required String hintText,
  required String textType,
  required ValueChanged<String> onChanged, // Changed to non-nullable callback
  double widthOfContainer = 300,
  double widthOfTextField = 150,
  double fromTop = 0,
  double fromBottom = 0,
  double fromRight = 0,
  double fromLeft = 0,
  Color focusedBorderColor = Colors.grey,
  Color enabledBorderColor = Colors.grey,
  Color disabledBorderColor = Colors.grey,
}) {
  return Container(
    height: 45.h,
    margin: EdgeInsets.only(
      top: fromTop.w,
      bottom: fromBottom.w,
      left: fromLeft.w,
      right: fromRight.w,
    ),
    // padding: const EdgeInsets.only(left: 17),
    decoration: BoxDecoration(
      color: Theme.of(context).colorScheme.primaryContainer,
      borderRadius: BorderRadius.circular(10),
      // border: Border.all(color: Theme.of(context).colorScheme.onPrimary)
    ),
    child: Row(
      children: [
        if (iconName != null)
          Container(
            height: 16.w,
            width: 16.w,
            margin: const EdgeInsets.only(left: 17),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/icons/flat_icons/$iconName.png"),
              ),
            ),
          ),
        Expanded(
          child: TextField(
            style: TextStyle(color: Theme.of(context).colorScheme.primary),
            onChanged: onChanged,
            keyboardType: TextInputType.multiline,
            decoration: InputDecoration(
              isDense: true,
              hintText: hintText,
              hintStyle:
                  TextStyle(color: Theme.of(context).colorScheme.onPrimary),
              border: InputBorder.none,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 1.5,
                  color: enabledBorderColor,
                ),
              ),
              disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: disabledBorderColor,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 1.5,
                  color: focusedBorderColor,
                ),
              ),
            ),
            obscureText: textType == "password",
          ),
        ),
        if (suffixIconName.isNotEmpty)
          Container(
            height: 16.w,
            width: 16.w,
            margin: const EdgeInsets.only(left: 17),
            child: Image.asset("assets/icons/$suffixIconName.png"),
          ),
      ],
    ),
  );
}

Widget reusableTextFieldForCountryCode({
  String? icon_name,
  String suffix_icon_name = '',
  required String hintText,
  required String textType,
  required void Function(String values)? onchange,
  double WidthOfContainer = 300,
  double widthOfTextField = 150,
  double FromTop = 0,
  double FromBottom = 0,
  double FromRight = 0,
  double FromLeft = 0,
}) {
  return Container(
    height: 45.h,
    width: WidthOfContainer.w,
    margin: EdgeInsets.only(
      top: FromTop.w,
      bottom: FromBottom.w,
      left: FromLeft.w,
      right: FromRight.w,
    ),
    decoration: BoxDecoration(
      color: ColorCollections.PrimaryColor,
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(10),
        bottomRight: Radius.circular(10),
      ),
      border: Border.all(color: const Color.fromARGB(255, 192, 190, 190)),
    ),
    child: Row(
      children: [
        icon_name != null
            ? Container(
                height: 16.w,
                width: 16.w,
                margin: const EdgeInsets.only(left: 17),
                child: Image.asset("assets/icons/flat_icons/$icon_name.png"),
              )
            : SizedBox(),
        SizedBox(
          height: 45.h,
          width: widthOfTextField.h,
          child: TextField(
            onChanged: (value) => onchange!(value),
            keyboardType: TextInputType.multiline,
            decoration: InputDecoration(
              // suffixIcon: suffixIcon,
              hintText: hintText,
              hintStyle: TextStyle(color: Colors.grey.withOpacity(0.5)),
              border: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent,
                ),
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent,
                ),
              ),
              disabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent,
                ),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent,
                ),
              ),
            ),
            obscureText: textType == "password" ? true : false,
          ),
        ),
        if (!(suffix_icon_name == ''))
          Container(
            height: 16.w,
            width: 16.w,
            margin: const EdgeInsets.only(left: 17),
            child: Image.asset("assets/icons/$suffix_icon_name.png"),
          ),
      ],
    ),
  );
}

AppBar SimpleAppBars(BuildContext context, String title,
    {bool? isDescription = false}) {
  return AppBar(
    leading: Container(
      margin: EdgeInsets.only(left: 8, bottom: 15),
      child: IconButton(
        onPressed: () {
          if (Navigator.of(context).canPop()) {
            Navigator.of(context).pop();
          } else {
            Navigator.of(context).pushNamed('/home_page');
          }
        },
        icon: Icon(
          Icons.arrow_back_ios,
          size: 26,
          color: Color(0xFF003540),
        ),
      ),
    ),
    backgroundColor: ColorCollections.PrimaryColor,
    automaticallyImplyLeading: false,
    flexibleSpace: Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: const Color.fromARGB(255, 203, 203, 203),
            width: 1.0,
          ),
        ),
      ),
      height: 120,
      padding: EdgeInsets.only(top: 40, left: 10, right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: FittedBox(
              child: ReusableText(
                FromLeft: 40,
                TextString: title,
                FontSize: 26,
                TextColor: Color(0xFF003540),
                TextFontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    ),
    actions: [
      isDescription == true
          ? InkWell(
              onTap: () {
                // Navigator.of(context).pushAndRemoveUntil(
                //     MaterialPageRoute(
                //       builder: (context) => null,
                //     ),
                //     (predicate) => false);
              },
              child: Container(
                margin: EdgeInsets.only(right: 15, bottom: 10),
                child: Icon(
                  Icons.cancel,
                  size: 26,
                  color: ColorCollections.QuaterneryColor,
                ),
              ),
            )
          : SizedBox(),
    ],
  );
}

AppBar ReusableAppBar(VoidCallback ontap, BuildContext context) {
  return AppBar(
    flexibleSpace: Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: const Color.fromARGB(
                255, 203, 203, 203), // Change to your desired color
            width: 1.0, // Change to your desired width
          ),
        ),
      ),
    ),
    automaticallyImplyLeading: false,
    backgroundColor: ColorCollections.PrimaryColor,
    title: Container(
      margin: const EdgeInsets.only(left: 0, right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: ontap,
            child: Container(
              height: 35.h,
              width: 35.w,
              child: Image.asset(
                'assets/icons/flat_icons/menu-bar.png',
              ),
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              margin: const EdgeInsets.only(left: 80, right: 10),
              height: 120.h,
              width: 130.w,
              child: Image.asset(
                'assets/logos/tlefli_logo.png',
              ),
            ),
          ),
        ],
      ),
    ),
    actions: [
      InkWell(
        onTap: () {
          // Navigator.push(context,
          //     MaterialPageRoute(builder: (context) => NotificationPage()));
        },
        child: Stack(
          children: [
            Container(
                margin: const EdgeInsets.only(right: 10),
                child: Icon(
                  Icons.notifications_outlined,
                  color: Colors.red.shade600,
                  size: 30,
                )),
            Container(
              margin:
                  const EdgeInsets.only(top: 0, left: 16, right: 10, bottom: 0),
              height: 25,
              width: 25,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.red.shade900,
              ),
              child: Center(
                child: ReusableText(
                  FromTop: 0,
                  FromBottom: 0,
                  TextString: "${2}",
                  FontSize: 10,
                  TextColor: ColorCollections.PrimaryColor,
                  TextFontWeight: FontWeight.w900,
                ),
              ),
            )
            // BlocBuilder<NotificationCubit, NotificationState>(
            //   builder: (context, state) {
            //
            //     if(state is NotificationErrorState || state is NotificationLoadingState){
            //       return Container(
            //         margin: const EdgeInsets.only(top: 0,left: 16, right: 10,bottom: 0),
            //         height: 25,
            //         width: 25,
            //         decoration: BoxDecoration(
            //           shape: BoxShape.circle,
            //           color: Colors.red.shade900,
            //         ),
            //         child: Center(
            //           child: ReusableText(
            //             FromTop: 0,
            //             FromBottom: 0,
            //             TextString: "${0}",
            //             FontSize: 10,
            //             TextColor: ColorCollections.PrimaryColor,
            //             TextFontWeight: FontWeight.w900,
            //           ),
            //         ),
            //       );
            //     }
            //     final val = state as NotificationLoadedState;
            //     int count = 0;
            //     for(int i=0;i<val.notifications.length;i++){
            //       if(state.notifications[i].isSent!){
            //         count++;
            //       }
            //     }
            //
            //     return Container(
            //       margin: const EdgeInsets.only(top: 0,left: 16, right: 10,bottom: 0),
            //       height: 25,
            //       width: 25,
            //       decoration: BoxDecoration(
            //         shape: BoxShape.circle,
            //         color: Colors.red.shade900,
            //       ),
            //       child: Center(
            //         child: ReusableText(
            //           FromTop: 0,
            //           FromBottom: 0,
            //           TextString: "${count}",
            //           FontSize: 10,
            //           TextColor: ColorCollections.PrimaryColor,
            //           TextFontWeight: FontWeight.w900,
            //         ),
            //       ),
            //     );
            //   },
            // )
          ],
        ),
      ),
    ],
  );
}

Drawer CustomDrowerElement(
    VoidCallback ontap, BuildContext context, Animation<Offset> animation) {
  return Drawer(
    child: Container(
      color: ColorCollections.SecondaryColor,
      padding: EdgeInsets.only(top: 20, left: 20, right: 10, bottom: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(left: 20, bottom: 100),
            child: SlideTransition(
              position: animation,
              child: IconButton(
                onPressed: ontap,
                icon: Icon(
                  Icons.arrow_back_ios,
                ),
              ),
            ),
          ),
          Container(
            child: Column(
              children: [
                DrowerWidget(
                    Icons.settings, "AppLocalizations.of(context)!.settings",
                    () {
                  Navigator.of(context).pushNamed('/welcome_page');
                }),
                DrowerWidget(Icons.language_outlined,
                    "AppLocalizations.of(context)!.language", () {
                  Navigator.of(context).pushNamed('/language_page');
                }),
                DrowerWidget(
                    Icons.info, "AppLocalizations.of(context)!.aboutUs", () {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      '/about_us_page', (route) => false);
                }),
                DrowerWidget(Icons.logout_outlined,
                    "AppLocalizations.of(context)!.logOut", () {
                  // Global.storageServices.setDeviceOpenedFirst(
                  //     AppConstants.STORAGE_DEVICE_OPENED_FIRST, false);
                  // LogoutShowDialogue(context);
                }),
                Container(
                  margin: EdgeInsets.only(top: 180),
                  height: 1,
                  width: 230,
                  color: ColorCollections.TeritiaryColor,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ReusableText(
                      FromLeft: 25,
                      FromBottom: 0,
                      TextString: 'TEFLI company',
                      FontSize: 14,
                      TextColor: ColorCollections.TeritiaryColor,
                    ),
                    InkWell(
                      onTap: () {},
                      child: ReusableText(
                        FromTop: 5,
                        TextString: 'Privacy Policy',
                        FontSize: 14,
                        TextColor: const Color.fromARGB(255, 23, 120, 222),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

Widget DrowerWidget(IconData icons, String text, VoidCallback ontap) {
  return GestureDetector(
    onTap: ontap,
    child: Container(
      margin: EdgeInsets.only(bottom: 15),
      child: Row(
        children: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              icons,
              size: 35,
              color: Color(0xFF003540),
            ),
          ),
          ReusableText(
            FromLeft: 15,
            TextString: text,
            FontSize: 20,
            TextColor: ColorCollections.TeritiaryColor,
          ),
        ],
      ),
    ),
  );
}

LogoutShowDialogue(BuildContext context) {
  return showDialog(
      barrierColor: Colors.red.shade200,
      context: context,
      builder: (context) {
        return SimpleDialog(
          backgroundColor: Colors.green.shade200,
          children: [
            Center(
              child: ReusableText(
                TextColor: Colors.red.shade900,
                TextString: "Log Out",
                FontSize: 20,
                TextFontWeight: FontWeight.w700,
              ),
            ),
            ReusableText(
              FromLeft: 20,
              TextColor: ColorCollections.TeritiaryColor,
              TextString: " Are you sure you want to logout ?",
              FontSize: 19,
            ),
            Container(
              margin: EdgeInsets.only(left: 30, right: 30, top: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SigninPage(),
                          ),
                        );
                      },
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          color: ColorCollections.SecondaryColor,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Center(
                          child: ReusableText(
                            TextString: " Confirm",
                            FontSize: 18,
                            TextColor: Colors.red.shade900,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          color: ColorCollections.GreenColor,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Center(
                          child: ReusableText(
                            TextString: "Cancel",
                            FontSize: 18,
                            TextColor: ColorCollections.PrimaryColor,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        );
      });
}

Widget buildStepProgressBar(int currentStep, int totalSteps) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: List.generate(totalSteps, (index) {
      return Expanded(
        child: Container(
          margin: EdgeInsets.only(top: 20, left: 5, right: 5),
          height: 6,
          decoration: BoxDecoration(
            color: index < currentStep ? Colors.blue : Colors.blue[100],
            borderRadius: BorderRadius.circular(5),
          ),
        ),
      );
    }),
  );
}

Widget CommonSliderWidget({
  required BuildContext context,
  required double maxValue,
  required double minValue,
  required double valuePicked,
  required int division,
  required bool selectedPoint,
  required String labelText,
  required ValueChanged<double> onChanged,
}) {
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.all(2),
        child: SliderTheme(
          data: SliderTheme.of(context).copyWith(
            trackHeight: 5,
            thumbShape: RoundSliderThumbShape(
              enabledThumbRadius: 12,
              disabledThumbRadius: 12,
              elevation: 4,
            ),
            activeTrackColor: Colors.grey.shade200,
            inactiveTrackColor: Colors.grey.shade200,
            thumbColor: ColorCollections.QuaterneryColor,
            overlayColor: ColorCollections.QuaterneryColor.withOpacity(0.2),
            valueIndicatorShape: PaddleSliderValueIndicatorShape(),
            valueIndicatorColor: ColorCollections.QuaterneryColor,
            valueIndicatorTextStyle: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          child: Slider(
            value: valuePicked.clamp(
                minValue, maxValue), // Ensures value stays in bounds
            min: minValue,
            max: maxValue,
            divisions: division,
            label: labelText,
            onChanged: onChanged, // Directly use the callback
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ReusableText(
              TextString: minValue.toStringAsFixed(0), // Dynamic min value
              FontSize: 18,
              TextColor: Theme.of(context).colorScheme.primary,
            ),
            ReusableText(
              TextString: maxValue.toStringAsFixed(0), // Dynamic max value
              FontSize: 18,
              TextColor: Theme.of(context).colorScheme.primary,
            ),
          ],
        ),
      ),
    ],
  );
}

//COMMENT TEXT FIELD

Widget reusableCommentTextField({
  required BuildContext context,
  String suffixIconName = '', // Changed to camelCase
  required String hintText,
  required String textType,
  required ValueChanged<String> onChanged, // Changed to non-nullable callback
  double widthOfContainer = 300,
  double widthOfTextField = 150,
  double fromTop = 0,
  double fromBottom = 0,
  double fromRight = 0,
  double fromLeft = 0,
  Color focusedBorderColor = Colors.grey,
  Color enabledBorderColor = Colors.grey,
  Color disabledBorderColor = Colors.grey,
}) {
  return Container(
    height: 150.h,
    margin: EdgeInsets.only(
      top: fromTop.w,
      bottom: fromBottom.w,
      left: fromLeft.w,
      right: fromRight.w,
    ),
    // padding: const EdgeInsets.only(left: 17),
    decoration: BoxDecoration(
      color: Theme.of(context).colorScheme.primaryContainer,
      borderRadius: BorderRadius.circular(10),
      // border: Border.all(color: Theme.of(context).colorScheme.onPrimary)
    ),
    child: TextField(
      style: TextStyle(color: Theme.of(context).colorScheme.primary),
      onChanged: onChanged,
      expands: true,
      maxLines: null,
      textAlignVertical: TextAlignVertical.top,
      keyboardType: TextInputType.multiline,
      decoration: InputDecoration(
        isDense: true,
        hintText: hintText,
        hintStyle: TextStyle(
          color: Colors.grey,
          fontWeight: FontWeight.bold,
        ),
        border: InputBorder.none,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1.5,
            color: enabledBorderColor,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: disabledBorderColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1.5,
            color: focusedBorderColor,
          ),
        ),
      ),
      obscureText: textType == "password",
    ),
  );
}
