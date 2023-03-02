import 'dart:convert';
import 'dart:io';

import '/comman/global_var.dart';
import '/comman/sharedpreferences.dart';
import '/comman/utils.dart';
import '/constants.dart';
import '/core/app_theme/theme_generator.dart';
import '/data_models/idr_data_model.dart';
import '/local_db/moor_db.dart';
import '/login/login_screen.dart';
import '/registration/google_auth.dart';
import '/registration/portal_login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';

class TermsandCondition extends StatefulWidget {
  final idr_data_model? idrResponse;
  const TermsandCondition({Key? key, required this.idrResponse})
      : super(key: key);

  @override
  State<TermsandCondition> createState() => _TermsandConditionState();
}

class _TermsandConditionState extends State<TermsandCondition> {
  String _termsOfUseContent = '';

  final ValueNotifier<bool> _checkBoxValue = ValueNotifier<bool>(false);
  idr_data_model? _idrModel;
  late WebViewController _webViewController;
  final ValueNotifier<bool> _isLoading = ValueNotifier<bool>(true);

  @override
  void initState() {
    // _idrServiceCall();
    _idrModel = widget.idrResponse;
    _loadTermData();
    super.initState();
  }

  void _loadTermData() async {
    _termsOfUseContent =
        await Sharedpreferences.getStringValue("termsOfUseContent");
    print("_termsOfUseContent_termsOfUseContent===? $_termsOfUseContent");
    if (_termsOfUseContent.isNotEmpty) {
      _loadHtmlFromAssets(_termsOfUseContent);
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        // appBar: AppBar(
        //   elevation: 0,
        //   automaticallyImplyLeading: false,
        //   backgroundColor: ThemeGenerator().headerColor,
        // ),
        resizeToAvoidBottomInset: false,
        body: _body(),
        backgroundColor: ThemeGenerator().headerColor,
      ),
    );
  }

  Widget _body() {
    return Container(
      padding: EdgeInsets.only(top: MediaQuery.of(context).viewPadding.top),
      color: ThemeGenerator().headerColor,
      child: Column(
        // shrinkWrap: true,
        // scrollDirection: Axis.vertical,
        children: [_termsBox(), _bottomBar()],
      ),
    );
  }

  Widget _bottomBar() {
    return Padding(
        padding: const EdgeInsets.only(bottom: 15),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Powered by ARMS',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: ThemeGenerator().subHeaderColorDark,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Text(
                  "Ⓡ",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: ThemeGenerator().subHeaderColorDark,
                      fontSize: 8),
                ),
              ),
            ],
          ),
        ));
  }

  Widget _termsBox() {
    return Expanded(
      child: Card(
        margin: const EdgeInsets.all(20),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        color: Colors.white,
        elevation: 4,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: ValueListenableBuilder(
              valueListenable: _isLoading,
              builder: (context, value, _) {
                return Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 7),
                      child: Text(
                        'Terms & Conditions',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Expanded(
                      child: Stack(
                        children: <Widget>[
                          _isLoading.value
                              ? const Center(
                                  child: CircularProgressIndicator(),
                                )
                              : WebViewWidget(
                                  controller: _webViewController,
                                  gestureRecognizers: Set()
                                    ..add(Factory<
                                            VerticalDragGestureRecognizer>(
                                        () => VerticalDragGestureRecognizer())),
                                ),
                          // WebView(
                          //   initialUrl: '',
                          //   javascriptMode: JavascriptMode.unrestricted,
                          //   backgroundColor: Colors.white,
                          //   gestureRecognizers: Set()
                          //     ..add(Factory<VerticalDragGestureRecognizer>(
                          //         () => VerticalDragGestureRecognizer())),
                          //   onWebViewCreated:
                          //       (WebViewController webViewController) {
                          //     _webViewController = webViewController;
                          //     _loadHtmlFromAssets(base64Data);
                          //   },
                          //   onPageFinished: (finish) {
                          //     _isLoading.value = false;
                          //   },
                          // ),

                          // _isLoading.value? const Center(
                          //     child: CircularProgressIndicator(),
                          //   )
                          // : Stack(),
                        ],
                      ),
                    ),
                    _conditionButtons(),
                  ],
                );
              }),
        ),
      ),
    );
  }

  String getFontUri(ByteData data, String mime) {
    final buffer = data.buffer;
    return Uri.dataFromBytes(
            buffer.asUint8List(data.offsetInBytes, data.lengthInBytes),
            mimeType: mime)
        .toString();
  }

  Future<String> addFontToHtml(
      String htmlContent, String fontAssetPath, String fontMime) async {
    final fontData = await rootBundle.load(fontAssetPath);
    final fontUri = getFontUri(fontData, fontMime).toString();
    final fontCss =
        '@font-face { font-family: Calibri;text-align:justify; src: url($fontUri); } * { font-family: Calibri;text-align:justify }';
    return '<style>$fontCss</style>$htmlContent';
  }

  _loadHtmlFromAssets(text) async {
    String _htmlText = await addFontToHtml(utf8.decode(base64.decode(text)),
        "assets/font/Calibri.ttf", "font/opentype");
    _webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(Colors.white)
      ..setNavigationDelegate(NavigationDelegate(
        onPageFinished: (finish) {
          _isLoading.value = false;
        },
      ))
      ..loadRequest(Uri.dataFromString(_htmlText,
          mimeType: "text/html", encoding: Encoding.getByName('utf-8')));

    // _webViewController.loadUrl(Uri.dataFromString(
    //         (utf8.decode(base64.decode(text))),
    //         mimeType: 'text/html',
    //         encoding: Encoding.getByName('utf-8'))
    //     .toString());
  }

  Widget _conditionButtons() {
    return ValueListenableBuilder(
        valueListenable: _checkBoxValue,
        builder: (context, value, _) {
          return Column(
            children: [
              Row(
                children: [
                  Material(
                    child: Checkbox(
                      splashRadius: 1,
                      value: _checkBoxValue.value,
                      activeColor: Colors.black,
                      onChanged: (value) {
                        _checkBoxValue.value = !_checkBoxValue.value;
                      },
                    ),
                  ),
                  const Expanded(
                    child: Text(
                      'I have read and accept terms and conditions',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: TextStyle(fontSize: 13),
                    ),
                  )
                ],
              ),
              Container(
                decoration: const BoxDecoration(
                    border: Border(
                  top: BorderSide(
                    //                   <--- left side
                    color: AppColors.colorcement,
                    width: 1.0,
                  ),
                )),
                child: IntrinsicHeight(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () {
                          if (_checkBoxValue.value) {
                            if (_idrModel?.sTATUS?.length == 1 ||
                                _idrModel?.dEVICEUSER?[0].userStatus == 0 ||
                                _idrModel?.dEVICEUSER?[0].userStatus == 3) {
                              // Navigator.of(context).push(MaterialPageRoute(
                              //     builder: (context) => const PortalLogin())
                              // );
                              getScreenToNavigate();
                            } else {
                              Sharedpreferences.setStringValue(
                                  "last_route_Name", "LoginScreen");
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const LoginScreen()));
                            }
                          } else {
                            DialogBox().errorMsgDialog(context,
                                "Please accept 'Terms & Conditions' to proceed");
                          }
                        },
                        child: Container(
                          color: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          child: Text(
                            "PROCEED",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 18,
                                color: !_checkBoxValue.value
                                    ? const Color.fromARGB(255, 133, 214, 248)
                                    : ThemeGenerator().subHeaderColorDark,
                                fontWeight: FontWeight.lerp(
                                    FontWeight.w500, FontWeight.w600, 0.6)),
                          ),
                        ),
                      ),
                      const VerticalDivider(
                        color: AppColors.colorcement,
                        thickness: 1,
                      ),
                      InkWell(
                          onTap: () {
                            if (Platform.isAndroid) {
                              SystemChannels.platform
                                  .invokeMethod('SystemNavigator.pop');
                            } else if (Platform.isIOS) {
                              exit(0);
                            }

                            //  SystemNavigator.pop();
                          },
                          child: Container(
                            color: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            child: Text(
                              "EXIT",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 18,
                                  color: ThemeGenerator().subHeaderColorDark,
                                  fontWeight: FontWeight.lerp(
                                      FontWeight.w500, FontWeight.w600, 0.6)),
                            ),
                          ))
                    ],
                  ),
                ),
              ),
            ],
          );
        });
  }

  getScreenToNavigate() {
    // Security Model= 11 it is predefined otp
    // Security Model= 2 it is SMS  otp
    // Security Model= 1 it is GA
    // if (GlobalValues.securityModel == "11") {
    //   Navigator.of(context)
    //       .push(MaterialPageRoute(builder: (context) => const PortalLogin()));
    // } else if (GlobalValues.securityModel == "2") {
    //   Navigator.of(context)
    //       .push(MaterialPageRoute(builder: (context) => const PortalLogin()));
    // } else if (GlobalValues.securityModel == "1") {
    //   Navigator.of(context)
    //       .push(MaterialPageRoute(builder: (context) => const GoogleAuth()));
    // }
    if (GlobalValues.securityModel == "1") {
      Sharedpreferences.setStringValue("last_route_Name", "GoogleAuth");
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const GoogleAuth()));
    } else {
      Sharedpreferences.setStringValue("last_route_Name", "PortalLogin");
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const PortalLogin()));
    }
  }
}
