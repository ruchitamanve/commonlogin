import 'dart:convert';

import '/constants.dart';
import '/core/app_theme/theme_generator.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

import 'app_text_formfild.dart';
// import 'package:text_field/app_text_formfild.dart';

class CommonWidget {
  Widget pageLogin(
      {required String base64string,
      required String clientId,
      required BuildContext context,
      required String clientColorId,
      required TextEditingController userIdController,
      required TextEditingController passwordController,
      bool isGA = false,
      TextEditingController? pinPutController,
      FocusNode? pinPutFocusNode}) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
          ),
          imageFromBase64String(base64string),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text(
              'Enter login credentials',
              style: TextStyle(color: ThemeGenerator().iconColor, fontSize: 16),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                color: ThemeGenerator().subHeaderColorDark,
                width: 60,
                height: 28,
                child: Center(
                  child: Text(
                    clientId,
                    style: const TextStyle(
                        // color: getColorFromServerValues(clientColorId, 1),
                        color: Colors.black,
                        decorationColor: Colors.black),
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Container(
                decoration: BoxDecoration(
                    color: ThemeGenerator().subHeaderColorDark,
                    borderRadius: const BorderRadius.all(Radius.circular(0))),
                width: MediaQuery.of(context).size.width * 0.6,
                height: 30,
                child: AppTextFormField.text(
                  underlineBorder: false,
                  contentEdgeInsets: const EdgeInsets.only(
                    left: 8,
                    right: 8,
                    bottom: 18,
                  ),
                  textAlign: TextAlign.center,
                  hint: ' Login ID',
                  style: const TextStyle(color: Colors.black),
                  //  formKey: _validationForm,
                  controller: userIdController,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                width: 75,
                height: 35,
              ),
              Container(
                decoration: BoxDecoration(
                    color: ThemeGenerator().subHeaderColorDark,
                    borderRadius: const BorderRadius.all(Radius.circular(0))),
                width: MediaQuery.of(context).size.width * 0.6,
                height: 30,
                child: AppTextFormField.text(
                  underlineBorder: false,
                  passwordText: true,
                  contentEdgeInsets: const EdgeInsets.only(
                    left: 8,
                    right: 8,
                    bottom: 18,
                  ),
                  textAlign: TextAlign.center,
                  hint: 'Password',
                  style: const TextStyle(color: Colors.black),
                  //  formKey: _validationForm,
                  controller: passwordController,
                ),
              ),
            ],
          ),
          isGA
              ? isGoogleAuth(context, pinPutFocusNode!, pinPutController!)
              : Container(),
          const SizedBox(
            height: 50,
          ),
          // Row(
          //   children: [
          //     const SizedBox(
          //       width: 75,
          //       height: 35,
          //     ),
          //     SizedBox(
          //       width: MediaQuery.of(context).size.width * 0.6,
          //       child: Center(
          //         child: Padding(
          //           padding: const EdgeInsets.only(left: 50),
          //           child: InkWell(
          //             onTap: onTapSubmit(),
          //             child: Container(
          //               padding: const EdgeInsets.symmetric(
          //                   horizontal: 20, vertical: 10),
          //               decoration: BoxDecoration(
          //                 color: ThemeGenerator().buttonColor,
          //                 borderRadius: BorderRadius.circular(5.0),
          //               ),
          //               child: Text(
          //                 "SUBMIT",
          //                 style: TextStyle(
          //                     color: ThemeGenerator().headerTextColor,
          //                     fontWeight: FontWeight.bold,
          //                     fontSize: 16),
          //               ),
          //             ),
          //           ),
          //         ),
          //       ),
          //     )
          //   ],
          // ),
        ],
      ),
    );
  }

  Widget AppButton(BuildContext context, Function() Onsubmit) {
    return Row(
      children: [
        const SizedBox(
          width: 75,
          height: 35,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.6,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 50),
              child: InkWell(
                onTap: Onsubmit,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                    color: ThemeGenerator().iconColor,
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: const Text(
                    "SUBMIT",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 17),
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget isGoogleAuth(BuildContext context, FocusNode pinPutFocusNode,
      TextEditingController pinPutController) {
    const defaultPinTheme = PinTheme(
      width: 35,
      height: 35,
      textStyle: TextStyle(fontSize: 18, color: Colors.black),
    );
    return Column(children: [
      const SizedBox(
        height: 25,
      ),
      const Text(
        "Enter Google Authenticator PIN",
        style: TextStyle(color: Colors.black, fontSize: 14),
      ),
      const SizedBox(
        height: 10,
      ),
      Container(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.15),
        child: Pinput(
          obscuringCharacter: "*",
          // eachFieldMargin: EdgeInsets.zero,
          showCursor: true,
          length: 6, obscureText: true,
          defaultPinTheme: defaultPinTheme,
          focusNode: pinPutFocusNode,
          controller: pinPutController,
          submittedPinTheme: defaultPinTheme.copyWith(
              decoration: const BoxDecoration(color: Colors.white)),
          focusedPinTheme: defaultPinTheme.copyWith(
              decoration: const BoxDecoration(color: Colors.white)),
          followingPinTheme: defaultPinTheme.copyWith(
              decoration: BoxDecoration(color: Colors.grey[200])),
        ),
      ),
    ]);
  }

  BoxDecoration pinPutDecoration = BoxDecoration(
    border: Border.all(color: AppColors.themeColor, width: 5),
    color: Colors.white,
    // borderRadius: BorderRadius.circular(5.0),
  );

//Elevation Button used in settings screen
  Widget appElevatedButton(
      BuildContext context, String title, Function() onTap) {
    return ElevatedButton(
      child: Text(
        title,
        style: TextStyle(color: ThemeGenerator().subHeaderColor, fontSize: 17),
      ),
      style: TextButton.styleFrom(
        minimumSize: const Size(130, 40),
        backgroundColor: ThemeGenerator().iconColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0.0),
        ),
      ),
      onPressed: onTap,
    );
  }
}

Image imageFromBase64String(String base64String) {
  return Image.memory(
    base64Decode(base64String),
    gaplessPlayback: true,
  );
}

Color getColorFromServerValues(String commaSeparatedString, double opacityVal) {
  List<String> result = commaSeparatedString.split(',');
  Color clr = Color.fromRGBO(int.parse(result[0]), int.parse(result[1]),
      int.parse(result[2]), opacityVal);
  return clr;
}
