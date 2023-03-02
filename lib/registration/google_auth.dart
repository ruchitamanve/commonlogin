import 'dart:convert';

import '/comman/connectivity.dart';
import '/comman/failure_reponse_model.dart';
import '/comman/global_var.dart';
import '/comman/login_common_widget.dart';
import '/comman/utils.dart';
import '/constants.dart';
import '/core/utils/common_functions.dart';
import '/extras/cryptString.dart';
import '/local_db/moor_db.dart';
import '/login/login_page_service_provider.dart';
import '/login/login_screen.dart';
import '/registration/mobile_registration_model.dart';
import '/registration/model_to_otp_mr.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/extras/storage.dart';
import 'package:drift/drift.dart' as drift;
// import 'package:text_field/app_text_formfild.dart';

import '../comman/Sharedpreferences.dart';
import '../login/user_details_model.dart';
import 'mobile_registration_provider.dart';

class GoogleAuth extends StatefulWidget {
  const GoogleAuth({Key? key}) : super(key: key);

  @override
  State<GoogleAuth> createState() => _GoogleAuthState();
}

class _GoogleAuthState extends State<GoogleAuth> {
  final myController = TextEditingController();
  final _passwordController = TextEditingController();

  final _pinPutController = TextEditingController();
  final _pinPutFocusNode = FocusNode();

  BoxDecoration pinPutDecoration = BoxDecoration(
    border: Border.all(color: AppColors.themeColor, width: 5),
    color: Colors.white,
    // borderRadius: BorderRadius.circular(5.0),
  );

  Failure? _failure;
  mobile_registration_model? _model;
  model_to_otp_mr? _modelOTP;
  @override
  void dispose() {
    myController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  late CaasLocalDatabase _cassLocalDatabase;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _cassLocalDatabase = Provider.of<CaasLocalDatabase>(context);
    return ChangeNotifierProvider(
      create: (context) => MobileRegistrationProvider(),
      child: Consumer<MobileRegistrationProvider>(
          builder: (context, providerForRegistration, child) {
        return FutureBuilder<List<user_ui_detail>>(
            future: getLocallyStoredData(),
            builder: (cotext, snapshot) {
              if (snapshot.hasData) {
                // return ChangeNotifierProvider(
                //     create: (context) => mobile_registration_provider(),
                //     child: Consumer<mobile_registration_provider>(
                // builder: (context, providerForRegistration, child) {
                return Scaffold(
                  backgroundColor: getColorFromServerValues(
                      snapshot.data![0].headerColour, 1.0),
                  body: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                              color: Color(0xFF01579B),
                              gradient: LinearGradient(
                                colors: [
                                  (Color(0xFF01579B)),
                                  (Color(0xFF01579B))
                                ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              )),
                        ),
                        CommonWidget().pageLogin(
                          base64string: snapshot.data![0].clientLogo,
                          clientId: snapshot.data![0].clientID,
                          context: context,
                          clientColorId: snapshot.data![0].headerColour,
                          userIdController: myController,
                          passwordController: _passwordController,
                          isGA: true,
                          pinPutController: _pinPutController,
                          pinPutFocusNode: _pinPutFocusNode,
                          // onTapSubmit: ()
                          // {
                          //   if (myController.text.isEmpty &&
                          //       _passwordController.text.isEmpty) {
                          //     DialogBox().errorMsgDialog(context,
                          //         "Enter valid username and password");
                          //   } else if (myController.text.isEmpty) {
                          //     DialogBox().errorMsgDialog(
                          //         context, "Enter a valid username");
                          //   } else if (_passwordController
                          //       .text.isEmpty) {
                          //     DialogBox().errorMsgDialog(
                          //         context, "Enter valid password");
                          //   } else if (_pinPutController
                          //       .text.isEmpty ||
                          //       _pinPutController.text.length != 6) {
                          //     print(
                          //         "username : ${myController.text.toString()}");
                          //     print(
                          //         "password : ${_passwordController.text.toString()}");
                          //     DialogBox().errorMsgDialog(context,
                          //         "Enter valid google authenticator pin");
                          //   } else {
                          //     ConnectivityCheck()
                          //         .checkInternet(context)
                          //         .then((value) {
                          //       if (value) {
                          //         DialogBox()
                          //             .showLoaderDialog(context);
                          //         storage.set_user_name(
                          //             myController.text);
                          //         storage.setPassword(
                          //             _passwordController.text);
                          //
                          //         /// calling otp method directly as we are getting pin from GA
                          //         MobileRegistrationProvider()
                          //             .mrServiceWithOTP(context,
                          //             _pinPutController.text)
                          //             .then((value) {
                          //           Navigator.of(context).pop();
                          //
                          //           if (value is Failure) {
                          //             _failure = value;
                          //             print(
                          //                 "value FAILEEEEE and directing to page");
                          //             DialogBox()
                          //                 .errorMsgDialog(
                          //                 context,
                          //                 _failure?.error![0]
                          //                     .errorDescription ??
                          //                     "")
                          //                 .then((value) {
                          //               _pinPutController.clear();
                          //             });
                          //           } else {
                          //             _modelOTP = value;
                          //             if (_modelOTP?.sTATUS != null) {
                          //               print(
                          //                   "value success and directing to page");
                          //               LoginPageServiceProvider()
                          //                   .userLoginService(
                          //                   context,
                          //                   storage
                          //                       .get_user_name(),
                          //                   storage.getPassword(),
                          //                   '',
                          //                   total_encryption_gcm(
                          //                       getRandomString(
                          //                           12) +
                          //                           "|" +
                          //                           "0"))
                          //                   .then((response) {
                          //                 UserDetailsModel?
                          //                 _userData = response;
                          //                 Sharedpreferences
                          //                     .setStringValue(
                          //                     "userID",
                          //                     _userData
                          //                         ?.pARTYDETAILS![
                          //                     0]
                          //                         .userName);
                          //                 GlobalValues
                          //                     .userID = _userData
                          //                     ?.pARTYDETAILS![0]
                          //                     .userName ??
                          //                     "";
                          //                 Sharedpreferences
                          //                     .setStringValue(
                          //                     "employeeName",
                          //                     _userData
                          //                         ?.pARTYDETAILS![
                          //                     0]
                          //                         .employeeName);
                          //                 batchRun();
                          //                 DialogBox()
                          //                     .errorMsgDialog(context,
                          //                     "Device has been registered successfully!")
                          //                     .then((value) {
                          //                   if (response is Failure) {
                          //                     print(
                          //                         "login value failure and directing to login page from GA");
                          //                     Navigator.of(context).push(
                          //                         MaterialPageRoute(
                          //                             builder:
                          //                                 (context) =>
                          //                             const LoginScreen()));
                          //                   } else {
                          //                     print(
                          //                         "login success and directing to Home Page from GA page");
                          //                     Navigator.of(context).push(
                          //                         MaterialPageRoute(
                          //                             builder:
                          //                                 (context) =>
                          //                             const HomePage()));
                          //                   }
                          //                 });
                          //               });
                          //             }
                          //           }
                          //         });
                          //
                          //         ///for new changes8
                          //         // providerForRegistration
                          //         //     .mrServiceWithoutOTP(
                          //         //     context, myController.text,_passwordController.text)
                          //         //     .then((value) {
                          //         //   Navigator.of(context).pop();
                          //         //   if (value is Failure) {
                          //         //     _failure = value;
                          //         //     DialogBox().errorMsgDialog(
                          //         //         context,
                          //         //         _failure?.error![0]
                          //         //             .errorDescription ??
                          //         //             "");
                          //         //   } else {
                          //         //     _model = value;
                          //         //     if(_model?.rEGISTRATIONDETAILS!=null || _model?.rEGISTRATIONDETAILS![0].errorNo == "0"){
                          //         //       storage.set_idr_result_token(_model?.rEGISTRATIONDETAILS![0].deviceToken??"");
                          //         //       DialogBox()
                          //         //           .errorMsgDialog(context,
                          //         //           "This device registration request has been sent successfully. Please check your registered mobile for OTP")
                          //         //           .then((value) => Navigator
                          //         //           .of(context)
                          //         //           .push(MaterialPageRoute(
                          //         //           builder: (context) =>
                          //         //           const Verification())));
                          //         //     }else{
                          //         //       DialogBox()
                          //         //           .errorMsgDialog(context,
                          //         //           _model?.rEGISTRATIONDETAILS![0].errorMessage?? "Oops Something went wrong" );
                          //         //
                          //         //     }
                          //         //   }
                          //         // }
                          //         // );
                          //       }
                          //     });
                          //   }
                          // }
                        ),
                        CommonWidget().AppButton(context, () {
                          if (myController.text.isEmpty &&
                              _passwordController.text.isEmpty) {
                            DialogBox().errorMsgDialog(
                                context, "Enter Valid Login ID and Password");
                          } else if (myController.text.isEmpty) {
                            DialogBox().errorMsgDialog(
                                context, "Enter a Valid Login ID");
                          } else if (_passwordController.text.isEmpty) {
                            DialogBox().errorMsgDialog(
                                context, "Enter Valid Password");
                          } else if (_pinPutController.text.isEmpty ||
                              _pinPutController.text.length != 6) {
                            print("username : ${myController.text.toString()}");
                            print(
                                "password : ${_passwordController.text.toString()}");
                            DialogBox().errorMsgDialog(context,
                                "Enter valid Google Authenticator pin");
                          } else {
                            ConnectivityCheck()
                                .checkInternet(context)
                                .then((value) {
                              if (value) {
                                DialogBox().showLoaderDialog(context);
                                storage.set_user_name(myController.text);
                                storage.setPassword(_passwordController.text);

                                /// calling otp method directly as we are getting pin from GA
                                MobileRegistrationProvider()
                                    .mrServiceWithOTP(
                                        context, _pinPutController.text)
                                    .then((value) {
                                  Navigator.of(context).pop();

                                  if (value is Failure) {
                                    _failure = value;
                                    print(
                                        "value FAILEEEEE and directing to page");
                                    DialogBox()
                                        .errorMsgDialog(
                                            context,
                                            _failure?.error![0]
                                                    .errorDescription ??
                                                "")
                                        .then((value) {
                                      _pinPutController.clear();
                                    });
                                  } else {
                                    _modelOTP = value;
                                    if (_modelOTP?.sTATUS != null) {
                                      print(
                                          "value success and directing to page");
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
                                        UserDetailsModel? _userData = response;
                                        Sharedpreferences.setStringValue(
                                            "userID",
                                            _userData
                                                ?.pARTYDETAILS![0].userName);
                                        GlobalValues.userID = _userData
                                                ?.pARTYDETAILS![0].userName ??
                                            "";
                                        Sharedpreferences.setStringValue(
                                            "employeeName",
                                            _userData?.pARTYDETAILS![0]
                                                .employeeName);
                                        batchRun();
                                        DialogBox()
                                            .errorMsgDialog(context,
                                                "Device has been registered successfully!")
                                            .then((value) {
                                          if (response is Failure) {
                                            print(
                                                "login value failure and directing to login page from GA");
                                            Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const LoginScreen()));
                                          } else {
                                            print(
                                                "login success and directing to Home Page from GA page");
                                            // Navigator.of(context).push(
                                            //     MaterialPageRoute(
                                            //         builder: (context) =>
                                            //             const HomePage()));
                                          }
                                        });
                                      });
                                    }
                                  }
                                });

                                ///for new changes8
                                // providerForRegistration
                                //     .mrServiceWithoutOTP(
                                //     context, myController.text,_passwordController.text)
                                //     .then((value) {
                                //   Navigator.of(context).pop();
                                //   if (value is Failure) {
                                //     _failure = value;
                                //     DialogBox().errorMsgDialog(
                                //         context,
                                //         _failure?.error![0]
                                //             .errorDescription ??
                                //             "");
                                //   } else {
                                //     _model = value;
                                //     if(_model?.rEGISTRATIONDETAILS!=null || _model?.rEGISTRATIONDETAILS![0].errorNo == "0"){
                                //       storage.set_idr_result_token(_model?.rEGISTRATIONDETAILS![0].deviceToken??"");
                                //       DialogBox()
                                //           .errorMsgDialog(context,
                                //           "This device registration request has been sent successfully. Please check your registered mobile for OTP")
                                //           .then((value) => Navigator
                                //           .of(context)
                                //           .push(MaterialPageRoute(
                                //           builder: (context) =>
                                //           const Verification())));
                                //     }else{
                                //       DialogBox()
                                //           .errorMsgDialog(context,
                                //           _model?.rEGISTRATIONDETAILS![0].errorMessage?? "Oops Something went wrong" );
                                //
                                //     }
                                //   }
                                // }
                                // );
                              }
                            });
                          }
                        })
                        // Column(
                        //   mainAxisAlignment: MainAxisAlignment.center,
                        //   children: [
                        //     SizedBox(
                        //       height:
                        //       MediaQuery.of(context).size.height * 0.1,
                        //     ),
                        //     imageFromBase64String(
                        //         snapshot.data![0].clientLogo),
                        //
                        //     const Padding(
                        //       padding: EdgeInsets.symmetric(vertical: 10),
                        //       child: Text('Enter Login ID'),
                        //     ),
                        //     //
                        //   ],
                        // ),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.center,
                        //   children: [
                        //     Container(
                        //       color: Colors.white,
                        //       width: 50,
                        //       height: 35,
                        //       child: Center(
                        //         child: Text(
                        //           snapshot.data![0].clientID,
                        //           style: TextStyle(
                        //             color: getColorFromServerValues(
                        //                 snapshot.data![0].headerColour, 1),
                        //           ),
                        //         ),
                        //       ),
                        //     ),
                        //     const SizedBox(
                        //       width: 20,
                        //     ),
                        //     Container(
                        //       decoration: const BoxDecoration(
                        //           color: Colors.white,
                        //           borderRadius:
                        //           BorderRadius.all(Radius.circular(0))),
                        //       width:
                        //       MediaQuery.of(context).size.width * 0.6,
                        //       height: 35,
                        //       child: AppTextFormField.text(
                        //         underlineBorder: false,
                        //         contentEdgeInsets: const EdgeInsets.only(
                        //           left: 8,
                        //           right: 8,
                        //           bottom: 18,
                        //         ),
                        //         textAlign: TextAlign.center,
                        //         hint: ' Login ID',
                        //         //  formKey: _validationForm,
                        //         controller: myController,
                        //       ),
                        //
                        //
                        //       ///testing the pkg creation
                        //       // child: TextFormField(
                        //       //   controller: myController,
                        //       //   inputFormatters: [
                        //       //     UpperCaseTextFormatter()
                        //       //   ],
                        //       //   textAlign: TextAlign.center,
                        //       //   decoration: const InputDecoration(
                        //       //     focusedBorder: InputBorder.none,
                        //       //     enabledBorder: InputBorder.none,
                        //       //     errorBorder: InputBorder.none,
                        //       //     disabledBorder: InputBorder.none,
                        //       //     isDense: true,
                        //       //     contentPadding:
                        //       //     EdgeInsets.fromLTRB(10, 10, 10, 10),
                        //       //     hintText: ' Login ID',
                        //       //   ),
                        //       // ),
                        //     )
                        //   ],
                        // ),
                        // const SizedBox(
                        //   height: 20,
                        // ),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.center,
                        //   children: [
                        //     const SizedBox(
                        //       width: 75,
                        //       height: 35,
                        //     ),
                        //     Container(
                        //       decoration: const BoxDecoration(
                        //           color: Colors.white,
                        //           borderRadius: BorderRadius.all(
                        //               Radius.circular(0))),
                        //       width:
                        //       MediaQuery.of(context).size.width * 0.6,
                        //       height: 35,
                        //       child: AppTextFormField.text(
                        //         underlineBorder: false,
                        //         passwordText: true,
                        //         contentEdgeInsets: const EdgeInsets.only(
                        //           left: 8,
                        //           right: 8,
                        //           bottom: 18,
                        //         ),
                        //         textAlign: TextAlign.center,
                        //         hint: 'Password',
                        //         //  formKey: _validationForm,
                        //         controller: _passwordController,
                        //       ),
                        //       // child: TextFormField(
                        //       //   controller: _passwordController,
                        //       //   obscureText: true,
                        //       //   textAlign: TextAlign.center,
                        //       //   decoration: const InputDecoration(
                        //       //     focusedBorder: InputBorder.none,
                        //       //     enabledBorder: InputBorder.none,
                        //       //     errorBorder: InputBorder.none,
                        //       //     disabledBorder: InputBorder.none,
                        //       //     isDense: true,
                        //       //     contentPadding: EdgeInsets.fromLTRB(
                        //       //         10, 10, 10, 10),
                        //       //     hintText: 'Password',
                        //       //   ),
                        //       // )
                        //     ),
                        //   ],
                        // ),
                        // const SizedBox(
                        //   height: 40,
                        // ),
                        // const Text(
                        //   "Enter Google Authenticator PIN",
                        //   style: TextStyle(color: Colors.black, fontSize: 14),
                        // ),
                        // const SizedBox(
                        //   height: 10,
                        // ),
                        // Container(
                        //   padding: EdgeInsets.symmetric(
                        //       horizontal:
                        //           MediaQuery.of(context).size.width * 0.15),
                        //   child: PinPut(
                        //     obscureText: "*",
                        //     // eachFieldMargin: EdgeInsets.zero,
                        //     withCursor: true,
                        //     fieldsCount: 6,
                        //     // preFilledWidget: const FlutterLogo(),
                        //     textStyle: const TextStyle(
                        //         fontSize: 20.0, color: Colors.black),
                        //     eachFieldWidth: 20.0,
                        //     eachFieldHeight: 20.0,
                        //     focusNode: _pinPutFocusNode,
                        //     controller: _pinPutController,
                        //     submittedFieldDecoration:
                        //         pinPutDecoration.copyWith(color: Colors.white),
                        //     selectedFieldDecoration:
                        //         pinPutDecoration.copyWith(color: Colors.white),
                        //     followingFieldDecoration: pinPutDecoration.copyWith(
                        //         color: Colors.grey[200]),
                        //   ),
                        // ),
                        // const SizedBox(
                        //   height: 25,
                        // ),
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
                        //             onTap: ()
                        //             {
                        //               if (myController.text.isEmpty &&
                        //                   _passwordController.text.isEmpty) {
                        //                 DialogBox().errorMsgDialog(context,
                        //                     "Enter valid username and password");
                        //               } else if (myController.text.isEmpty) {
                        //                 DialogBox().errorMsgDialog(
                        //                     context, "Enter a valid username");
                        //               } else if (_passwordController
                        //                   .text.isEmpty) {
                        //                 DialogBox().errorMsgDialog(
                        //                     context, "Enter valid password");
                        //               } else if (_pinPutController
                        //                       .text.isEmpty ||
                        //                   _pinPutController.text.length != 6) {
                        //                 print(
                        //                     "username : ${myController.text.toString()}");
                        //                 print(
                        //                     "password : ${_passwordController.text.toString()}");
                        //                 DialogBox().errorMsgDialog(context,
                        //                     "Enter valid google authenticator pin");
                        //               } else {
                        //                 ConnectivityCheck()
                        //                     .checkInternet(context)
                        //                     .then((value) {
                        //                   if (value) {
                        //                     DialogBox()
                        //                         .showLoaderDialog(context);
                        //                     storage.set_user_name(
                        //                         myController.text);
                        //                     storage.setPassword(
                        //                         _passwordController.text);
                        //
                        //                     /// calling otp method directly as we are getting pin from GA
                        //                     MobileRegistrationProvider()
                        //                         .mrServiceWithOTP(context,
                        //                             _pinPutController.text)
                        //                         .then((value) {
                        //                       Navigator.of(context).pop();
                        //
                        //                       if (value is Failure) {
                        //                         _failure = value;
                        //                         print(
                        //                             "value FAILEEEEE and directing to page");
                        //                         DialogBox()
                        //                             .errorMsgDialog(
                        //                                 context,
                        //                                 _failure?.error![0]
                        //                                         .errorDescription ??
                        //                                     "")
                        //                             .then((value) {
                        //                           _pinPutController.clear();
                        //                         });
                        //                       } else {
                        //                         _modelOTP = value;
                        //                         if (_modelOTP?.sTATUS != null) {
                        //                           print(
                        //                               "value success and directing to page");
                        //                           LoginPageServiceProvider()
                        //                               .userLoginService(
                        //                                   context,
                        //                                   storage
                        //                                       .get_user_name(),
                        //                                   storage.getPassword(),
                        //                                   '',
                        //                                   total_encryption_gcm(
                        //                                       getRandomString(
                        //                                               12) +
                        //                                           "|" +
                        //                                           "0"))
                        //                               .then((response) {
                        //                             UserDetailsModel?
                        //                                 _userData = response;
                        //                             Sharedpreferences
                        //                                 .setStringValue(
                        //                                     "userID",
                        //                                     _userData
                        //                                         ?.pARTYDETAILS![
                        //                                             0]
                        //                                         .userName);
                        //                             GlobalValues
                        //                                 .userID = _userData
                        //                                     ?.pARTYDETAILS![0]
                        //                                     .userName ??
                        //                                 "";
                        //                             Sharedpreferences
                        //                                 .setStringValue(
                        //                                     "employeeName",
                        //                                     _userData
                        //                                         ?.pARTYDETAILS![
                        //                                             0]
                        //                                         .employeeName);
                        //                             batchRun();
                        //                             DialogBox()
                        //                                 .errorMsgDialog(context,
                        //                                     "Device has been registered successfully!")
                        //                                 .then((value) {
                        //                               if (response is Failure) {
                        //                                 print(
                        //                                     "login value failure and directing to login page from GA");
                        //                                 Navigator.of(context).push(
                        //                                     MaterialPageRoute(
                        //                                         builder:
                        //                                             (context) =>
                        //                                                 const LoginScreen()));
                        //                               } else {
                        //                                 print(
                        //                                     "login success and directing to Home Page from GA page");
                        //                                 Navigator.of(context).push(
                        //                                     MaterialPageRoute(
                        //                                         builder:
                        //                                             (context) =>
                        //                                                 const HomePage()));
                        //                               }
                        //                             });
                        //                           });
                        //                         }
                        //                       }
                        //                     });
                        //
                        //                     ///for new changes8
                        //                     // providerForRegistration
                        //                     //     .mrServiceWithoutOTP(
                        //                     //     context, myController.text,_passwordController.text)
                        //                     //     .then((value) {
                        //                     //   Navigator.of(context).pop();
                        //                     //   if (value is Failure) {
                        //                     //     _failure = value;
                        //                     //     DialogBox().errorMsgDialog(
                        //                     //         context,
                        //                     //         _failure?.error![0]
                        //                     //             .errorDescription ??
                        //                     //             "");
                        //                     //   } else {
                        //                     //     _model = value;
                        //                     //     if(_model?.rEGISTRATIONDETAILS!=null || _model?.rEGISTRATIONDETAILS![0].errorNo == "0"){
                        //                     //       storage.set_idr_result_token(_model?.rEGISTRATIONDETAILS![0].deviceToken??"");
                        //                     //       DialogBox()
                        //                     //           .errorMsgDialog(context,
                        //                     //           "This device registration request has been sent successfully. Please check your registered mobile for OTP")
                        //                     //           .then((value) => Navigator
                        //                     //           .of(context)
                        //                     //           .push(MaterialPageRoute(
                        //                     //           builder: (context) =>
                        //                     //           const Verification())));
                        //                     //     }else{
                        //                     //       DialogBox()
                        //                     //           .errorMsgDialog(context,
                        //                     //           _model?.rEGISTRATIONDETAILS![0].errorMessage?? "Oops Something went wrong" );
                        //                     //
                        //                     //     }
                        //                     //   }
                        //                     // }
                        //                     // );
                        //                   }
                        //                 });
                        //               }
                        //             },
                        //             child: Container(
                        //               padding: const EdgeInsets.symmetric(
                        //                   horizontal: 20, vertical: 10),
                        //               decoration: BoxDecoration(
                        //                 color: AppColors.themeColor,
                        //                 borderRadius:
                        //                     BorderRadius.circular(5.0),
                        //               ),
                        //               child: const Text(
                        //                 "SUBMIT",
                        //                 style: TextStyle(
                        //                     color: Colors.white,
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
                  ),
                );
                // }));
              } else {
                return const CircularProgressIndicator();
              }
            });
      }),
    );
  }

  Future<List<user_ui_detail>> getLocallyStoredData() {
    return _cassLocalDatabase.fetch_user_data();
  }

  Image imageFromBase64String(String base64String) {
    return Image.memory(base64Decode(base64String));
  }

  Color getColorFromServerValues(
      String commaSeparatedString, double opacityVal) {
    List<String> result = commaSeparatedString.split(',');
    Color clr = Color.fromRGBO(int.parse(result[0]), int.parse(result[1]),
        int.parse(result[2]), opacityVal);
    return clr;
  }

  void batchRun() {
    print("=====herr tooooo");
    print(storage.get_idr_result_token());
    _cassLocalDatabase.delete_all_tokens().then((value) {
      _cassLocalDatabase
          .insert_client_credentials_tokens(user_related_tokensCompanion(
        client_token: const drift.Value("test1"),
        device_hash: drift.Value(storage.get_idr_result_token()),
        uuid: const drift.Value("test3"),
        android_id: drift.Value(storage.get_device_token()),
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
