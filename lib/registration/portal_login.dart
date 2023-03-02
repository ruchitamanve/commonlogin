import 'dart:convert';
import '/comman/connectivity.dart';
import '/comman/failure_reponse_model.dart';
import '/comman/login_common_widget.dart';
import '/comman/sharedpreferences.dart';
import '/comman/utils.dart';
import '/core/app_theme/theme_generator.dart';
import '/registration/mobile_registration_model.dart';
import '/extras/storage.dart';
import '/registration/mobile_registration_provider.dart';
import '/verification/verification_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '/local_db/moor_db.dart';

class PortalLogin extends StatefulWidget {
  const PortalLogin({Key? key}) : super(key: key);

  @override
  _PortalLoginState createState() => _PortalLoginState();
}

class _PortalLoginState extends State<PortalLogin> {
  final myController = TextEditingController();
  final _passwordController = TextEditingController();

  Failure? _failure;
  mobile_registration_model? _model;
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

    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: ChangeNotifierProvider(
        create: (context) => MobileRegistrationProvider(),
        child: Consumer<MobileRegistrationProvider>(
            builder: (context, providerForRegistration, child) {
          return FutureBuilder<List<user_ui_detail>>(
              future: getLocallyStoredData(),
              builder: (cotext, snapshot) {
                if (snapshot.hasData) {
                  return Scaffold(
                    backgroundColor: ThemeGenerator().headerColor,
                    body: SingleChildScrollView(
                      child: Column(
                        children: [
                          CommonWidget().pageLogin(
                            base64string: snapshot.data![0].clientLogo,
                            clientId: snapshot.data![0].clientID,
                            context: context,
                            clientColorId: snapshot.data![0].headerColour,
                            userIdController: myController,
                            passwordController: _passwordController,
                          ),
                          CommonWidget().AppButton(context, () {
                            {
                              if (myController.text.isEmpty &&
                                  _passwordController.text.isEmpty) {
                                DialogBox().errorMsgDialog(context,
                                    "Enter valid username and password");
                              } else if (myController.text.isEmpty) {
                                DialogBox().errorMsgDialog(
                                    context, "Enter a valid login ID");
                              } else if (_passwordController.text.isEmpty) {
                                DialogBox().errorMsgDialog(
                                    context, "Enter valid password");
                              } else {
                                ConnectivityCheck()
                                    .checkInternet(context)
                                    .then((value) {
                                  if (value) {
                                    DialogBox().showMainDialog(
                                      context,
                                    );
                                    providerForRegistration
                                        .mrServiceWithoutOTP(
                                            context,
                                            myController.text,
                                            _passwordController.text)
                                        .then((value) {
                                      Navigator.of(context).pop();
                                      if (value is Failure) {
                                        _failure = value;
                                        DialogBox().errorMsgDialog(
                                            context,
                                            _failure?.error![0]
                                                    .errorDescription ??
                                                "");
                                      } else {
                                        _model = value;
                                        if (_model?.rEGISTRATIONDETAILS !=
                                                null ||
                                            _model?.rEGISTRATIONDETAILS![0]
                                                    .errorNo ==
                                                "0") {
                                          storage.set_idr_result_token(_model
                                                  ?.rEGISTRATIONDETAILS![0]
                                                  .deviceToken ??
                                              "");
                                          DialogBox()
                                              .errorMsgDialog(context,
                                                  "This device registration request has been sent successfully. Please check your registered mobile for OTP")
                                              .then((value) {
                                            Sharedpreferences.setStringValue(
                                                "last_route_Name",
                                                "Verification");
                                            Sharedpreferences.setStringValue(
                                                "verificationApiCallTime",
                                                DateTime.now());
                                            Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        Verification(
                                                          response: _model,
                                                          dateTime:
                                                              DateTime.now(),
                                                        )));
                                          });
                                        } else {
                                          DialogBox().errorMsgDialog(
                                              context,
                                              _model?.rEGISTRATIONDETAILS![0]
                                                      .errorMessage ??
                                                  "Oops Something went wrong");
                                        }
                                      }
                                    });
                                  }
                                });
                              }
                            }
                          })
                        ],
                      ),
                    ),
                    bottomNavigationBar: _bottomBar(),
                  );
                } else {
                  return const CircularProgressIndicator();
                }
              });
        }),
      ),
    );
  }

  Widget _bottomBar() {
    return Container(
      height: 40,
      padding: const EdgeInsets.only(bottom: 15),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Text(
          'Powered by ARMS®',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: ThemeGenerator().subHeaderColorDark),
        ),
      ),
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
}

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
        text: newValue.text.toUpperCase(), selection: newValue.selection);
  }
}
