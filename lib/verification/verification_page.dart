import '/comman/Sharedpreferences.dart';
import '/comman/connectivity.dart';
import '/comman/failure_reponse_model.dart';
import '/comman/global_var.dart';
import '/comman/utils.dart';
import '/core/app_constants.dart';
import '/core/app_theme/theme_generator.dart';
import '/core/utils/common_functions.dart';
import '/registration/mobile_registration_model.dart';
import '/registration/model_to_otp_mr.dart';
import '/login/user_details_model.dart';
import '/extras/cryptString.dart';
import '/login/login_screen.dart';
import '/login/login_page_service_provider.dart';
import '/registration/mobile_registration_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';
import '../local_db/moor_db.dart';
import 'package:drift/drift.dart' as drift;
import '/extras/storage.dart';

class Verification extends StatefulWidget {
  final mobile_registration_model? response;
  final DateTime dateTime;
  const Verification({Key? key, this.response, required this.dateTime})
      : super(key: key);

  @override
  _VerificationState createState() => _VerificationState();
}

class _VerificationState extends State<Verification> {
  late CaasLocalDatabase _cassLocalDbVerification;
  TextEditingController textEditingController = TextEditingController();
  final _pinPutController = TextEditingController();
  final _pinPutFocusNode = FocusNode();
  Failure? _failure;
  model_to_otp_mr? _model;
  bool hasError = false;
  String currentText = "";
  final defaultPinTheme = const PinTheme(
    width: 35,
    height: 35,
    textStyle: TextStyle(fontSize: 18, color: Colors.black),
  );
  late DateTime _responseGetTime;

  @override
  void initState() {
    debugPrint('Theme value Test VERYFI: ${ThemeGenerator().fontFamily}');
    textEditingController = TextEditingController();
    _responseGetTime = widget.dateTime;
    super.initState();
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _cassLocalDbVerification = Provider.of<CaasLocalDatabase>(context);
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: ChangeNotifierProvider(
          create: (context) => MobileRegistrationProvider(),
          child: Consumer<MobileRegistrationProvider>(
              builder: (context, providerforVerification, child) {
            return Scaffold(
              backgroundColor: ThemeGenerator().headerColor,
              body: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 15),
                      child: Text('Verification Code',
                          style: TextStyle(
                              color: ThemeGenerator().headerTextColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 16)),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 8),
                      child: Text(
                          'Please type the verification code sent on mobile',
                          style: TextStyle(
                            color: ThemeGenerator().headerTextColor,
                            fontSize: 13,
                          )),
                    ),

                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.10),
                      child: Pinput(
                        obscuringCharacter: "*",
                        showCursor: true,
                        obscureText: true,
                        length: 6,
                        defaultPinTheme: defaultPinTheme,
                        onCompleted: (String pin) {
                          ConnectivityCheck()
                              .checkInternetWithoutPopup(context)
                              .then((value) {
                            if (value) {
                              showLoaderDialog(context);
                              providerforVerification
                                  .mrServiceWithOTP(context, pin)
                                  .then((value) {
                                Navigator.of(context).pop();

                                if (value is Failure) {
                                  _failure = value;
                                  DialogBox()
                                      .errorMsgDialog(
                                          context,
                                          _failure?.error![0]
                                                  .errorDescription ??
                                              "")
                                      .then((value) {
                                    _pinPutController.clear();
                                    _responseGetTime = DateTime.now().subtract(
                                        Duration(
                                            minutes: (widget
                                                        .response
                                                        ?.rEGISTRATIONDETAILS?[
                                                            0]
                                                        .oTPExpiryMinutes ??
                                                    8) +
                                                2));
                                  });
                                } else {
                                  _model = value;
                                  if (_model?.sTATUS != null) {
                                    LoginPageServiceProvider()
                                        .userLoginService(
                                            context,
                                            storage.get_user_name(),
                                            storage.getPassword(),
                                            '',
                                            total_encryption_gcm(
                                                getRandomString(12) +
                                                    "|" +
                                                    "0"))
                                        .then((response) {
                                      if (response is UserDetailsModel) {
                                        UserDetailsModel? _userData = response;
                                        if (response.pARTYDETAILS!.isEmpty) {
                                          return DialogBox()
                                              .showServerErrorDialog(context,
                                                  AppConstants.serverError);
                                        } else {
                                          Sharedpreferences.setStringValue(
                                              "userID",
                                              _userData
                                                  .pARTYDETAILS?[0].userName);
                                          GlobalValues.userID = _userData
                                                  .pARTYDETAILS?[0].userName ??
                                              "";
                                          Sharedpreferences.setStringValue(
                                              "employeeName",
                                              _userData.pARTYDETAILS?[0]
                                                  .employeeName);
                                          batchRun();
                                          DialogBox()
                                              .errorMsgDialog(context,
                                                  "Device has been registered successfully!")
                                              .then((value) {
                                            if (response is Failure) {
                                              Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          const LoginScreen()));
                                            } else {
                                              // Navigator.of(context).push(
                                              //     MaterialPageRoute(
                                              //         builder: (context) =>
                                              //             const HomePage()));
                                            }
                                          });
                                        }
                                      } else {
                                        DialogBox().errorMsgDialog(
                                            context, AppConstants.serverError);
                                      }
                                    });
                                  }
                                }
                              });
                            } else {
                              DialogBox()
                                  .errorMsgDialog(
                                      context, AppConstants.internetError)
                                  .then((value) => _pinPutController.clear());
                            }
                          });
                          // print('pin verfication : $pin');
                        },
                        focusNode: _pinPutFocusNode,
                        controller: _pinPutController,
                        submittedPinTheme: defaultPinTheme.copyWith(
                            decoration: BoxDecoration(
                                color: ThemeGenerator().dottedLineColor)),
                        focusedPinTheme: defaultPinTheme.copyWith(
                            decoration: BoxDecoration(
                                color: ThemeGenerator().subHeaderColorDark)),
                        followingPinTheme: defaultPinTheme.copyWith(
                            decoration: BoxDecoration(
                                color: ThemeGenerator().dottedLineColor)),
                      ),
                    ),
                    //  pincodeFields(),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        '( OTP expires in 5 minutes )',
                        style: TextStyle(
                            color: ThemeGenerator().headerTextColor,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        print(
                            "time---->${widget.response?.rEGISTRATIONDETAILS?[0].oTPExpiryMinutes}==========$_responseGetTime");
                        print(DateTime.now()
                            .difference(_responseGetTime)
                            .inMinutes);
                        if (DateTime.now()
                                .difference(_responseGetTime)
                                .inMinutes >
                            int.parse(widget.response?.rEGISTRATIONDETAILS?[0]
                                    .oTPExpiryMinutes
                                    .toString() ??
                                "5")) {
                          ConnectivityCheck()
                              .checkInternet(context)
                              .then((value) {
                            if (value) {
                              DialogBox().showLoaderDialog(context);
                              providerforVerification
                                  .mrServiceWithoutOTP(
                                      context,
                                      storage.get_user_name(),
                                      storage.getPassword())
                                  .then((value) {
                                Navigator.of(context).pop();

                                if (value is mobile_registration_model) {
                                  if (value != null) {
                                    _responseGetTime = DateTime.now();
                                    Sharedpreferences.setStringValue(
                                        "verificationApiCallTime",
                                        DateTime.now());
                                    storage.set_idr_result_token(
                                        providerforVerification
                                                .mobileRegistrationDataModel
                                                ?.rEGISTRATIONDETAILS![0]
                                                .deviceToken ??
                                            "");
                                  }
                                  DialogBox().errorMsgDialog(context,
                                      "This device registration request has been sent successfully. Please check your registered mobile for OTP");
                                } else {
                                  DialogBox().errorMsgDialog(
                                      context, AppConstants.serverError);
                                }
                              });
                            }
                          });
                        } else {
                          DialogBox().errorMsgDialog(context,
                              "Previous shared OTP valid up to ${widget.response?.rEGISTRATIONDETAILS?[0].oTPExpiryMinutes.toString() ?? "0"} minutes. Please check your registered mobile.");
                        }
                      },
                      child: Text(
                        'Resend',
                        style: TextStyle(
                          color: ThemeGenerator().buttonColor,
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              bottomNavigationBar: _bottomBar(),
            );
          })),
    );
  }

  Widget _bottomBar() {
    return Container(
      height: 40,
      padding: const EdgeInsets.only(bottom: 15),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Powered by ARMS',
              style: TextStyle(
                  color: ThemeGenerator().buttonColor,
                  fontSize: 12,
                  fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Text(
                "Ⓡ",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: ThemeGenerator().buttonColor,
                    fontSize: 5),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void batchRun() {
    print("=====herr tooooo");
    print(storage.get_idr_result_token());
    _cassLocalDbVerification.delete_all_tokens().then((value) {
      _cassLocalDbVerification
          .insert_client_credentials_tokens(user_related_tokensCompanion(
        device_hash: drift.Value(storage.get_idr_result_token()),
        android_id: drift.Value(storage.get_device_token()),
        client_token: const drift.Value("test1"),
        uuid: drift.Value(GlobalValues.uuId),
        pns_key: const drift.Value("test5"),
        some_another_key: const drift.Value("test6"),
        some_another_value: const drift.Value("test7"),
      ));
    });
    DialogBox()
        .errorMsgDialog(context, "Device has been registered successfully!")
        .then((value) => Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const LoginScreen())));
  }
}

pinPut(
    {EdgeInsets? eachFieldMargin,
    bool? withCursor,
    int? fieldsCount,
    TextStyle? textStyle,
    double? eachFieldWidth,
    double? eachFieldHeight,
    FocusNode? focusNode,
    TextEditingController? controller,
    BoxDecoration? submittedFieldDecoration,
    BoxDecoration? selectedFieldDecoration,
    BoxDecoration? followingFieldDecoration}) {}

showLoaderDialog(BuildContext context) {
  AlertDialog alert = AlertDialog(
    content: Row(
      children: [
        const CupertinoActivityIndicator(
          color: Colors.grey,
          animating: true,
          radius: 10,
        ),
        Container(
            margin: const EdgeInsets.only(left: 7),
            child: const Text("Registering...")),
      ],
    ),
  );
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
