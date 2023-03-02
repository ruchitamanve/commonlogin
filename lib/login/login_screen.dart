import 'dart:convert';

import '/client_id/Common_url_service_provider.dart';
import '/comman/Sharedpreferences.dart';
import '/comman/connectivity.dart';
import '/comman/failure_reponse_model.dart';
import '/comman/global_var.dart';
import '/comman/utils.dart';
import '/constants.dart';
import '/core/app_constants.dart';
import '/core/app_theme/theme_generator.dart';
import '/core/utils/common_functions.dart';
import '/data_models/idr_data_model.dart';
import '/get_it_locator.dart';
import '/login/user_details_model.dart';
import '/extras/cryptString.dart';
import '/login/login_page_service_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';
import '/comman/bottom_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../local_db/moor_db.dart';

class LoginScreen extends StatefulWidget {
  final bool? backpopUp;
  final bool? sessionPopUp;
  final bool? autoLoginWithoutOTP;
  const LoginScreen(
      {Key? key, this.backpopUp, this.sessionPopUp, this.autoLoginWithoutOTP})
      : super(key: key);
  @override
  LoginScreenState createState() {
    return LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen> {
  final _userNameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _pinPutController = TextEditingController();
  final _pinPutFocusNode = FocusNode();
  bool hasError = false;
  String currentText = "";
  UserDetailsModel? _model;
  final ValueNotifier<bool> _showOtp = ValueNotifier<bool>(false);
  final ValueNotifier<bool> _showLogin = ValueNotifier<bool>(true);
  late Failure? _failure;
  late idr_data_model? _idrModel;
  late DateTime _responseGetTime;
  String? _lastSync;
  final defaultPinTheme = const PinTheme(
    width: 35,
    height: 35,
    textStyle: TextStyle(fontSize: 18, color: Colors.black),
  );
  @override
  void initState() {
    // debugPrint('Theme value Test Login: ${ThemeGenerator().fontFamily}');
    _userNameController.text = GlobalValues.userID;
    _getIDRdataFromStorage();
    GlobalValues.isLoggedIn = "";
    if (widget.sessionPopUp == true) {
      Future.delayed(const Duration(seconds: 1), () {
        DialogBox()
            .errorMsgDialog(context, "Session expired. Please login again");
      });
    }
    // makeDummyApi(); /// TODO: Remove the dummy api call
    super.initState();
  }

  _getIDRdataFromStorage() async {
    _lastSync = await Sharedpreferences.getStringValue("last_sync");

    var _data = await Sharedpreferences.getStringValue("idrServiceResponse");
    if (_data != '') {
      _idrModel = idr_data_model.fromJson(jsonDecode(_data));
    }
  }

  makeDummyApi() async {
    await getIt<CommonUrlServiceProvider>()
        .getDummyCommonData(context, "CAAST");
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    _userNameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  late CaasLocalDatabase _cassLocalDatabase;

  final emailController = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    _cassLocalDatabase = Provider.of<CaasLocalDatabase>(context);
    return WillPopScope(
      onWillPop: () async {
        if (widget.backpopUp == true) {
          _onWillPop();
        }
        return false;
      },
      child: ChangeNotifierProvider(
        create: (context) => LoginPageServiceProvider(),
        child: Consumer<LoginPageServiceProvider>(
            builder: (context, provider, child) {
          return FutureBuilder<List<user_ui_detail>>(
              future: getLocallyStoredData(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Scaffold(
                      resizeToAvoidBottomInset: false,
                      appBar: AppBar(
                        automaticallyImplyLeading: false,
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              'ARMS',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                            // Padding(
                            //   padding: const EdgeInsets.only(bottom: 10.0),
                            //   child: Text(
                            //     "Ⓡ",
                            //     style: TextStyle(
                            //         fontWeight: FontWeight.bold,
                            //         color: ThemeGenerator().headerTextColor,
                            //         fontSize: 8),
                            //   ),
                            // ),
                            SizedBox(
                              width: 3,
                            ),
                            Text(
                              'APGH',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                          ],
                        ),
                        centerTitle: true,
                        // backgroundColor: ThemeGenerator().headerColor,
                        backgroundColor: AppColors.themeColor,
                      ),
                      bottomNavigationBar: _bottomBar(),
                      body: Container(
                        height: MediaQuery.of(context).size.height,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                        ),
                        child: ValueListenableBuilder(
                            valueListenable: _showOtp,
                            builder: (context, value, _) {
                              return Column(
                                children: [
                                  Expanded(
                                    child: SingleChildScrollView(
                                      child: Container(
                                        margin: const EdgeInsets.only(
                                            left: 20, right: 20, top: 40),
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                vertical: 10,
                                              ),
                                              child: Container(
                                                child: imageFromBase64String(
                                                    snapshot
                                                        .data![0].clientLogo),
                                                // Image.asset('assets/images/logo.png'),
                                                // color: (const Color(0xFF204F84)),
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.12,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.6,
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 7),
                                              child: Text(
                                                'Enter login credentials',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    color: ThemeGenerator()
                                                        .iconColor,
                                                    fontSize: 16,
                                                    wordSpacing: 2),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 6),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 4),
                                                    child: SizedBox(
                                                      height: 35,
                                                      width: 35,
                                                      child: SvgPicture.asset(
                                                        'assets/images/user.svg',
                                                        color: ThemeGenerator()
                                                            .iconColor,
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    height: 35,
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.5,
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 20,
                                                            right: 20),
                                                    decoration: BoxDecoration(
                                                      color: ThemeGenerator()
                                                          .subHeaderColorDark,
                                                    ),
                                                    alignment: Alignment.center,
                                                    child: TextFormField(
                                                      textAlign:
                                                          TextAlign.center,
                                                      readOnly:
                                                          GlobalValues.userID !=
                                                                  ''
                                                              ? true
                                                              : false,
                                                      controller:
                                                          _userNameController,
                                                      cursorColor: const Color(
                                                          0xFF01579B),
                                                      decoration:
                                                          const InputDecoration(
                                                        isDense: true,
                                                        contentPadding:
                                                            EdgeInsets.fromLTRB(
                                                                10, 10, 10, 10),
                                                        hintText: "Login ID",
                                                        enabledBorder:
                                                            InputBorder.none,
                                                        focusedBorder:
                                                            InputBorder.none,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(horizontal: 4),
                                                  child: SizedBox(
                                                    height: 35,
                                                    width: 35,
                                                    child: SvgPicture.asset(
                                                      'assets/images/password.svg',
                                                      color: ThemeGenerator()
                                                          .iconColor,
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(vertical: 10),
                                                  child: Container(
                                                    height: 35,
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.5,
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 20,
                                                            right: 20),
                                                    decoration: BoxDecoration(
                                                        color: ThemeGenerator()
                                                            .subHeaderColorDark),
                                                    alignment: Alignment.center,
                                                    child: TextFormField(
                                                      textCapitalization:
                                                          TextCapitalization
                                                              .characters,
                                                      textAlign:
                                                          TextAlign.center,
                                                      controller:
                                                          _passwordController,
                                                      cursorColor: const Color(
                                                          0xFF01579B),
                                                      obscureText: true,
                                                      readOnly: _showOtp.value
                                                          ? true
                                                          : false,
                                                      inputFormatters: [
                                                        FilteringTextInputFormatter
                                                            .deny(RegExp(r'\s'))
                                                      ],
                                                      decoration:
                                                          const InputDecoration(
                                                        hintText: "Password",
                                                        hintStyle: TextStyle(
                                                            color:
                                                                Colors.black54),
                                                        enabledBorder:
                                                            InputBorder.none,
                                                        focusedBorder:
                                                            InputBorder.none,
                                                        isDense: true,
                                                        contentPadding:
                                                            EdgeInsets.fromLTRB(
                                                                10, 10, 10, 10),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            (_showOtp.value &&
                                                    GlobalValues
                                                            .securityModel ==
                                                        '1')
                                                ? const Text(
                                                    "Enter Google Authenticator PIN",
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 14),
                                                  )
                                                : Container(),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Container(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .width *
                                                          0.10),
                                              child: Visibility(
                                                visible: _showOtp.value,
                                                child: Pinput(
                                                  obscuringCharacter: "*",
                                                  showCursor: true,
                                                  obscureText: true,
                                                  length: 6,
                                                  defaultPinTheme:
                                                      defaultPinTheme,
                                                  onCompleted:
                                                      (String pin) async {
                                                    if (_pinPutController
                                                            .text.length ==
                                                        6) {
                                                      print(
                                                          "GlobalValuessecurityModel ${GlobalValues.securityModel}");
                                                      DialogBox()
                                                          .showMainDialog(
                                                              context);
                                                      await ConnectivityCheck()
                                                          .checkInternetWithoutPopup(
                                                              context)
                                                          .then((value) {
                                                        if (value) {
                                                          provider
                                                              .userLoginService(
                                                                  context,
                                                                  _userNameController
                                                                      .text,
                                                                  _passwordController
                                                                      .text,
                                                                  total_encryption_gcm(
                                                                      _pinPutController
                                                                          .text),
                                                                  // (GlobalValues
                                                                  //             .securityModel !=
                                                                  //         '1')
                                                                  //     ?
                                                                  //     total_encryption_gcm(getRandomString(
                                                                  //             12) +
                                                                  //         "|" +
                                                                  //         '0')
                                                                  //     :
                                                                  total_encryption_gcm(getRandomString(
                                                                          12) +
                                                                      "|" +
                                                                      GlobalValues
                                                                          .securityModel)) // GlobalValues.securityModel
                                                              .then((value) {
                                                            Navigator.of(
                                                                    context)
                                                                .pop();

                                                            if (value
                                                                is Failure) {
                                                              _failure = value;
                                                              _pinPutController
                                                                  .clear();
                                                              _responseGetTime = DateTime
                                                                      .now()
                                                                  .subtract(Duration(
                                                                      minutes:
                                                                          (_idrModel?.dEVICEUSER?[0].oTPExpiryMin ?? 8) +
                                                                              2));

                                                              DialogBox().errorMsgDialog(
                                                                  context,
                                                                  _failure
                                                                          ?.error![
                                                                              0]
                                                                          .errorDescription ??
                                                                      "");
                                                            } else {
                                                              _model = value;
                                                              if (value
                                                                  ?.pARTYDETAILS
                                                                  ?.isEmpty) {
                                                                return DialogBox()
                                                                    .showServerErrorDialog(
                                                                        context,
                                                                        AppConstants
                                                                            .serverError);
                                                              } else {
                                                                DialogBox()
                                                                    .errorMsgDialog(
                                                                        context,
                                                                        "OTP Validated Successfully!")
                                                                    .then(
                                                                        (value) {
                                                                  return "Suceesful";
                                                                }
                                                                        // Navigator.of(
                                                                        //         context)
                                                                        //     .push(MaterialPageRoute(
                                                                        //         builder: (context) =>
                                                                        //             const HomePage())

                                                                        );
                                                              }
                                                            }
                                                          });
                                                        } else {
                                                          Navigator.of(context)
                                                              .pop();
                                                          DialogBox()
                                                              .errorMsgDialog(
                                                                  context,
                                                                  AppConstants
                                                                      .internetError)
                                                              .then((value) {
                                                            _pinPutController
                                                                .clear();
                                                          });
                                                        }
                                                      });
                                                    }
                                                  },
                                                  focusNode: _pinPutFocusNode,
                                                  controller: _pinPutController,
                                                  submittedPinTheme:
                                                      defaultPinTheme.copyWith(
                                                          decoration:
                                                              BoxDecoration(
                                                                  color: Colors
                                                                          .blue[
                                                                      50])),
                                                  focusedPinTheme:
                                                      defaultPinTheme.copyWith(
                                                          decoration:
                                                              BoxDecoration(
                                                                  color: Colors
                                                                          .blue[
                                                                      100])),
                                                  followingPinTheme:
                                                      defaultPinTheme.copyWith(
                                                          decoration:
                                                              BoxDecoration(
                                                                  color: Colors
                                                                          .blue[
                                                                      50])),
                                                ),
                                              ),
                                            ),
                                            _showOtp.value
                                                ? const SizedBox(
                                                    height: 8,
                                                  )
                                                : Container(),
                                            _showOtp.value
                                                ? Text(
                                                    '(OTP expires in 5 minutes)',
                                                    style: TextStyle(
                                                      color: ThemeGenerator()
                                                          .buttonColor,
                                                      fontSize: 16,
                                                    ),
                                                  )
                                                : Container(),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            (GlobalValues.securityModel != '1')
                                                ? Visibility(
                                                    visible: _showOtp.value,
                                                    child: InkWell(
                                                      onTap: () {
                                                        print(
                                                            "time---->${_responseGetTime}");
                                                        print(DateTime.now()
                                                            .difference(
                                                                _responseGetTime)
                                                            .inMinutes);
                                                        if (DateTime.now()
                                                                .difference(
                                                                    _responseGetTime)
                                                                .inMinutes >
                                                            int.parse(_idrModel
                                                                    ?.dEVICEUSER?[
                                                                        0]
                                                                    .oTPExpiryMin
                                                                    .toString() ??
                                                                "5")) {
                                                          ConnectivityCheck()
                                                              .checkInternet(
                                                                  context)
                                                              .then((value) {
                                                            if (value) {
                                                              DialogBox()
                                                                  .showMainDialog(
                                                                      context);
                                                              provider
                                                                  .userLoginService(
                                                                context,
                                                                _userNameController
                                                                    .text,
                                                                _passwordController
                                                                    .text,
                                                                '',
                                                                total_encryption_gcm(
                                                                    getRandomString(
                                                                            12) +
                                                                        "|" +
                                                                        GlobalValues
                                                                            .securityModel), //' GlobalValues.securityModel'
                                                              )
                                                                  .then(
                                                                      (value) {
                                                                Navigator.of(
                                                                        context)
                                                                    .pop();
                                                                if (value
                                                                    is Failure) {
                                                                  _failure =
                                                                      value;
                                                                  DialogBox().errorMsgDialog(
                                                                      context,
                                                                      _failure?.error![0]
                                                                              .errorDescription ??
                                                                          "");
                                                                } else {
                                                                  _model =
                                                                      value;
                                                                  _responseGetTime =
                                                                      DateTime
                                                                          .now();
                                                                  if (value
                                                                      ?.pARTYDETAILS
                                                                      ?.isEmpty) {
                                                                    return DialogBox().showServerErrorDialog(
                                                                        context,
                                                                        AppConstants
                                                                            .serverError);
                                                                  } else {
                                                                    Sharedpreferences.setStringValue(
                                                                        "employeeName",
                                                                        _model
                                                                            ?.pARTYDETAILS![0]
                                                                            .employeeName);

                                                                    DialogBox()
                                                                        .errorMsgDialog(
                                                                            context,
                                                                            (GlobalValues.securityModel == '1')
                                                                                ? 'Please check your Google Authenticator App for OTP'
                                                                                : "Please check your registered mobile for OTP")
                                                                        .then(
                                                                            (value) {
                                                                      _showOtp.value =
                                                                          true;
                                                                      _showLogin
                                                                              .value =
                                                                          true;
                                                                    });
                                                                  }
                                                                }
                                                              });
                                                            }
                                                          });
                                                        } else {
                                                          DialogBox()
                                                              .errorMsgDialog(
                                                                  context,
                                                                  "Previous shared OTP valid up to ${int.parse(_idrModel?.dEVICEUSER?[0].oTPExpiryMin.toString() ?? "0")} minutes. Please check your registered mobile.");
                                                        }
                                                      },
                                                      child: Text(
                                                        'Resend',
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color:
                                                              ThemeGenerator()
                                                                  .buttonColor,
                                                          fontSize: 18,
                                                          decoration:
                                                              TextDecoration
                                                                  .underline,
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                : Container(),
                                            isLoading
                                                ? const Center(
                                                    child:
                                                        CircularProgressIndicator(),
                                                  )
                                                : Visibility(
                                                    visible: !_showOtp.value,
                                                    child: GestureDetector(
                                                      onTap: () => {
                                                        if (_userNameController
                                                                .text
                                                                .isNotEmpty &&
                                                            _passwordController
                                                                .text
                                                                .isNotEmpty)
                                                          {
                                                            ConnectivityCheck()
                                                                .checkInternet(
                                                                    context)
                                                                .then((value) {
                                                              if (value) {
                                                                DialogBox()
                                                                    .showMainDialog(
                                                                        context);
                                                                provider
                                                                    .userLoginService(
                                                                  context,
                                                                  _userNameController
                                                                      .text,
                                                                  _passwordController
                                                                      .text,
                                                                  '',
                                                                  total_encryption_gcm(getRandomString(
                                                                          12) +
                                                                      "|" +
                                                                      GlobalValues
                                                                          .securityModel), //'0'
                                                                )
                                                                    .then(
                                                                        (value) {
                                                                  Navigator.of(
                                                                          context)
                                                                      .pop();
                                                                  if (value
                                                                      is Failure) {
                                                                    _failure =
                                                                        value;
                                                                    DialogBox().errorMsgDialog(
                                                                        context,
                                                                        _failure?.error![0].errorDescription ??
                                                                            "");
                                                                  } else {
                                                                    if (widget
                                                                            .autoLoginWithoutOTP ==
                                                                        true) {
                                                                      return "Suceesful";

                                                                      // Navigator.of(
                                                                      //         context)
                                                                      //     .push(
                                                                      //         MaterialPageRoute(builder: (context) => const HomePage()));
                                                                    } else {
                                                                      _model =
                                                                          value;
                                                                      _responseGetTime =
                                                                          DateTime
                                                                              .now();
                                                                      if (value
                                                                          ?.pARTYDETAILS
                                                                          ?.isNotEmpty) {
                                                                        Sharedpreferences.setStringValue(
                                                                            "employeeName",
                                                                            _model?.pARTYDETAILS![0].employeeName);

                                                                        DialogBox()
                                                                            .errorMsgDialog(context,
                                                                                "Please check your registered mobile for OTP")
                                                                            .then((value) {
                                                                          _showOtp.value =
                                                                              true;
                                                                          _showLogin.value =
                                                                              true;
                                                                        });
                                                                      } else {
                                                                        DialogBox().errorMsgDialog(
                                                                            context,
                                                                            AppConstants.serverError);
                                                                      }
                                                                    }
                                                                  }
                                                                });
                                                              }
                                                            })
                                                          }
                                                        else
                                                          {
                                                            DialogBox()
                                                                .errorMsgDialog(
                                                                    context,
                                                                    "Enter valid Password")
                                                          }
                                                      },
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                vertical: 10),
                                                        child: Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            color:
                                                                ThemeGenerator()
                                                                    .buttonColor,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        0),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .symmetric(
                                                                    horizontal:
                                                                        30,
                                                                    vertical:
                                                                        10),
                                                            child: Text(
                                                              widget.autoLoginWithoutOTP ==
                                                                      true
                                                                  ? "Login"
                                                                  : "SUBMIT",
                                                              style: TextStyle(
                                                                  color: ThemeGenerator()
                                                                      .subHeaderColor),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                            Visibility(
                                              visible: _showOtp.value,
                                              child: GestureDetector(
                                                onTap: () {
                                                  ConnectivityCheck()
                                                      .checkInternet(context)
                                                      .then((value) {
                                                    if (_pinPutController
                                                            .text.length !=
                                                        6) {
                                                      DialogBox().errorMsgDialog(
                                                          context,
                                                          "Invalid OTP! Please try again");
                                                    }
                                                  });
                                                },
                                                child: Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(vertical: 10),
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      color: ThemeGenerator()
                                                          .buttonColor,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                    child: Padding(
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 30,
                                                          vertical: 10),
                                                      child: Text(
                                                        "LOGIN",
                                                        style: TextStyle(
                                                            color: ThemeGenerator()
                                                                .subHeaderColor),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            }),
                      ));
                } else {
                  return const CircularProgressIndicator();
                }
              });
        }),
      ),
    );
  }

  Future<List<user_ui_detail>> getLocallyStoredData() {
    return _cassLocalDatabase.fetch_user_data();
  }

  Image imageFromBase64String(String base64String) {
    return Image.memory(
      base64Decode(base64String),
      gaplessPlayback: true,
    );
  }

  Future<bool> _onWillPop() async {
    return await showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(5.0))),
          child: Container(
            margin: const EdgeInsets.only(
              top: 25,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                RichText(
                  text: TextSpan(children: [
                    const TextSpan(
                      text: 'ARMS',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    WidgetSpan(
                      child: Transform.translate(
                        offset: const Offset(0, -6),
                        child: const Text(
                          '®',
                          textScaleFactor: 0.7,
                        ),
                      ),
                    )
                  ]),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  child: const Text(
                    "Are you sure you want to exit?",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Colors.black),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  decoration: const BoxDecoration(
                      border: Border(
                    top: BorderSide(
                      color: AppColors.colorcement,
                      width: 1.5,
                    ),
                  )),
                  child: IntrinsicHeight(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pop(context, true);
                          },
                          child: Container(
                            color: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            child: Text(
                              "NO",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 18,
                                  color: ThemeGenerator().subHeaderColorDark,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                        const VerticalDivider(
                          color: AppColors.colorcement,
                          thickness: 1.5,
                        ),
                        InkWell(
                            onTap: () {
                              SystemChannels.platform
                                  .invokeMethod('SystemNavigator.pop');
                            },
                            child: Container(
                              color: Colors.white,
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              child: Text(
                                "YES",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 18,
                                    color: ThemeGenerator().subHeaderColorDark,
                                    fontWeight: FontWeight.w500),
                              ),
                            ))
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _bottomBar() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          // height: MediaQuery.of(context).size.height / 10,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Powered by ARMS',
                  style: TextStyle(
                      color: ThemeGenerator().subHeaderColorDark,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: Text(
                    "Ⓡ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: ThemeGenerator().subHeaderColorDark,
                      fontSize: 6,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        _lastSync != '' && _lastSync != null
            ? Container(
                color: ThemeGenerator().headerColor,
                padding:
                    const EdgeInsets.symmetric(vertical: 5.0, horizontal: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Powered by ARMS',
                          style: TextStyle(
                              color: ThemeGenerator().headerTextColor,
                              fontSize: 14),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: Text(
                            "Ⓡ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: ThemeGenerator().headerTextColor,
                                fontSize: 7),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      'Last Sync: $_lastSync',
                      style: TextStyle(
                          color: ThemeGenerator().headerTextColor,
                          fontSize: 14),
                    ),
                  ],
                ))
            : Container(
                height: 0,
              )
      ],
    );
  }
}
