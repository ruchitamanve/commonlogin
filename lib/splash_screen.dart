import 'dart:async';
import 'dart:convert';
import 'dart:io';

import '/client_id/common_url_data_model.dart';
import '/comman/connectivity.dart';
import '/comman/global_var.dart';
import '/comman/loader_bounce.dart';
import '/comman/sharedpreferences.dart';
import '/comman/utils.dart';
import '/core/app_constants.dart';
import '/core/app_theme/theme_generator.dart';
import '/data_models/idr_data_model.dart';
import '/login/login_screen.dart';
import '/constants.dart';
import '/logs/logs.dart';
import '/logs/termsandcondition.dart';
import '/registration/google_auth.dart';
import '/registration/mobile_registration_model.dart';
import '/registration/portal_login.dart';
import '/verification/verification_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'client_id/client_id.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import '/local_db/moor_db.dart';
import '/extras/storage.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter_udid/flutter_udid.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:android_id/android_id.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late CaasLocalDatabase _caasLocalDatabase;
  late String _lastRouteScreen;
  @override
  void initState() {
    super.initState();
    GlobalValues.isLoggedIn = "";
    _getPrefValues();
    if (!kIsWeb) {
      LogsGenrate().initmethod();
    }
    _getCommonData();
    _getUUId();
  }

  _getCommonData() async {
    var _data =
        await Sharedpreferences.getCommonUrlDataValue("common_url_data");
    var _clientID = await Sharedpreferences.getStringValue("clientId");
    _lastRouteScreen =
        await Sharedpreferences.getStringValue('last_route_Name');
    if (_data != "") {
      ThemeGenerator.init(
          context, GetClientBaseURLResult.fromJson(jsonDecode(_data)));
    }
  }

  _getUUId() async {
    var deviceInfo = DeviceInfoPlugin();
    if (Platform.isIOS) {
      String udid = await FlutterUdid.udid;

      return storage.set_device_token(udid);
    } else if (Platform.isAndroid) {
      const _androidIdPlugin = AndroidId();
      var androidDeviceInfo = await _androidIdPlugin.getId();
      return storage.set_device_token(androidDeviceInfo ?? "");
    }
  }

  Future<void> _getPrefValues() async {
    GlobalValues.userID = await Sharedpreferences.getStringValue("userID");
    GlobalValues.baseURL = "http://192.168.16.139:8085/apghlocal/IMDO";
    // await Sharedpreferences.getStringValue("BaseURL");
    GlobalValues.securityModel =
        await Sharedpreferences.getStringValue("securityModel");
  }

  @override
  Widget build(BuildContext context) {
    _caasLocalDatabase = Provider.of<CaasLocalDatabase>(context);

    return Scaffold(
      body: FutureBuilder<List<user_related_token>>(
          future: _getTokensFromDatabase(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              _caasLocalDatabase.delete_all_tokens();
              debugPrint("nothing here");
            } else if (snapshot.hasData) {
              print(snapshot.data);
              debugPrint("snapshot.hasData");

              if (snapshot.data!.isEmpty) {
                ConnectivityCheck()
                    .checkInternetWithoutPopup(context)
                    .then((value) {
                  if (value) {
                    debugPrint("empty is there");
                    debugPrint("_lastRouteScreen $_lastRouteScreen");
                    Timer(const Duration(seconds: 3), () async {
                      _routingToNextScreen(_lastRouteScreen);
                    });
                  } else {
                    DialogBox()
                        .errorMsgDialog(context, AppConstants.internetError)
                        .then((value) => DialogBox().errorMsgDialog(context,
                            "Please turn on internet connection and relaunch app to continue"));
                  }
                });
              } else if (snapshot.data!.isNotEmpty) {
                debugPrint("not empty is there");
                Timer(const Duration(seconds: 3), () {
                  ConnectivityCheck()
                      .checkInternetWithoutPopup(context)
                      .then((value) {
                    storage.set_idr_result_token(
                        snapshot.data![0].device_hash.toString());
                    if (value) {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (BuildContext context) =>
                              const LoginScreen()));
                    } else {
                      DialogBox()
                          .splashScreenPopUp(context,
                              "Please check your internet connection.\n App will continue in offline mode")
                          .then((value) {
                        if (value) {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      const LoginScreen()));
                        }
                      });
                    }
                  });
                });
              }
              // } else {
              // DialogBox()
              //     .errorMsgDialog(context, AppConstants.internetError)
              //     .then((value) => DialogBox().errorMsgDialog(context,
              //         "Please turn on internet connection and relaunch app to continue"));
              // }
              // });
            }
            // return Container(
            //   color: AppColors.themeColor,
            //   child: Column(
            //     children: [
            //       Expanded(
            //         child: Center(
            //           child: Container(
            //             child: Image.asset('assets/images/logo.png',
            //                 fit: BoxFit.fitHeight),
            //             color: AppColors.themeColor,
            //             height: MediaQuery.of(context).size.height * 0.2,
            //           ),
            //         ),
            //       ),
            //     ],
            //   ),
            // );
            return Container(
              color: AppColors.themeColor,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  //           Expanded(
                  //             child: Center(
                  //               child: Container(
                  //                 child: Image.asset('assets/images/logo.png',
                  //                     fit: BoxFit.fitHeight),
                  //                 color: AppColors.themeColor,
                  //                 height: MediaQuery.of(context).size.height * 0.2,
                  //               ),
                  //             ),
                  //           ),
                  //          const SpinKitThreeBounce(
                  // color: Colors.red, duration: Duration(seconds: 1),size: 30),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: SvgPicture.asset(
                              'assets/images/arms_apgh_logo-invert.svg',
                              fit: BoxFit.fitWidth),
                          color: AppColors.themeColor,
                          height: MediaQuery.of(context).size.height * 0.2,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 5),
                        child: Text(
                          "Aviation Resource Management System (APGH)",
                          style: TextStyle(
                              fontWeight: FontWeight.normal,
                              color: Colors.white,
                              fontSize: 18),
                        ),
                      ),
                    ],
                  ),

                  const Positioned(
                    bottom: 30,
                    child: SpinKitThreeBounce(
                        color: Colors.white70,
                        duration: Duration(seconds: 1),
                        size: 25),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            'Powered by ARMS',
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Segoe UI',
                                fontWeight: FontWeight.w800,
                                fontSize: 18),
                          ),
                          Padding(
                            padding: EdgeInsets.only(bottom: 10.0),
                            child: Text(
                              "Ⓡ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 8),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }

  Future<List<user_related_token>> _getTokensFromDatabase() async {
    _caasLocalDatabase.fetch_user_data();
    return await _caasLocalDatabase.get_users_tokens();
  }

  Future<void> _routingToNextScreen(screen) async {
    switch (screen) {
      case "TermsandCondition":
        var _data =
            await Sharedpreferences.getStringValue("idrServiceResponse");
        idr_data_model _idrModel = idr_data_model.fromJson(jsonDecode(_data));

        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) =>
                TermsandCondition(idrResponse: _idrModel)));

        break;
      case "LoginScreen":
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => const LoginScreen()));

        break;
      case "GoogleAuth":
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => const GoogleAuth()));

        break;
      case "PortalLogin":
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => const PortalLogin()));

        break;
      case "Verification":
        var _data =
            await Sharedpreferences.getStringValue("mrServiceWithoutOTPResp");
        mobile_registration_model _mbregisterResp =
            mobile_registration_model.fromJson(jsonDecode(_data));
        var _date =
            await Sharedpreferences.getStringValue("verificationApiCallTime");
        DialogBox()
            .splashScreenPopUp(context,
                "Registration process pending. Please check your registered mobile for OTP")
            .then((value) {
          if (value == true) {
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (BuildContext context) => Verification(
                      response: _mbregisterResp,
                      dateTime: DateTime.parse(_date),
                    )));
          } else {
            if (Platform.isAndroid) {
              SystemChannels.platform.invokeMethod('SystemNavigator.pop');
            } else if (Platform.isIOS) {
              exit(0);
            }
          }
        });

        break;
      default:
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => const ClientId()));
        break;
    }
  }
}
