import '/comman/connectivity.dart';
import '/comman/sharedpreferences.dart';
import '/comman/utils.dart';
import '/client_id/Common_url_service_provider.dart';
import '/core/app_constants.dart';
import '/pushnotifications/local_notifications.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '/constants.dart';
import 'package:flutter/material.dart';
import '../constants.dart';
import 'package:device_calendar/device_calendar.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ClientId extends StatefulWidget {
  const ClientId({
    Key? key,
  }) : super(key: key);

  @override
  _ClientIdState createState() => _ClientIdState();
}

class _ClientIdState extends State<ClientId> {
  final myController = TextEditingController();
  String notificationMsg = "";

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  TextEditingController clientIdController = TextEditingController();
  @override
  void initState() {
    permissionCheck();
    Sharedpreferences.setStringValue("last_route_Name", '');

    super.initState();
  }

  void permissionCheck() async {
    //Retrieve user's calendars from mobile device
    //Request permissions first if they haven't been granted
    try {
      var permissionsGranted = await DeviceCalendarPlugin().hasPermissions();
      if (permissionsGranted.isSuccess && (permissionsGranted.data == false)) {
        permissionsGranted = await DeviceCalendarPlugin().requestPermissions();

        if (permissionsGranted.isSuccess || permissionsGranted.data == true) {
          await LocalNotification.initilize();
          return;
        }
      }
      await LocalNotification.initilize();
    } on Exception catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => CommonUrlServiceProvider(),
        // create: (context) => getIt<CommonUrlServiceProvider>(),
        child: Consumer<CommonUrlServiceProvider>(
            builder: (context, provider, child) {
          return WillPopScope(
            onWillPop: () async {
              return false;
            },
            child: Scaffold(
                resizeToAvoidBottomInset: false,
                backgroundColor: AppColors.themeColor,
                body: Column(
                  children: [
                    Expanded(
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
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.1,
                              ),
                              SvgPicture.asset(
                                'assets/images/arms_apgh_logo-invert.svg',
                                height:
                                    MediaQuery.of(context).size.height * 0.1,
                                width: 300,
                              ),
                              // Padding(
                              //   padding:
                              //       const EdgeInsets.symmetric(vertical: 0),
                              //   child: SizedBox(
                              //     width:
                              //         MediaQuery.of(context).size.width * 0.7,
                              //     child: const Text(
                              //       'ATC STAFF MANAGEMENT SYSTEM',
                              //       textAlign: TextAlign.center,
                              //       style: TextStyle(
                              //           color: Color(0xFF00B6DE),
                              //           fontSize: 18.0),
                              //     ),
                              //   ),
                              // ),
                              // SizedBox(
                              //   width:
                              //       MediaQuery.of(context).size.width * 0.6,
                              //   child: const Text(
                              //     '(ASMS)',
                              //     textAlign: TextAlign.center,
                              //     style: TextStyle(
                              //         color: Color(0xFF00B6DE),
                              //         fontSize: 18.0),
                              //   ),
                              // ),
                              const SizedBox(
                                height: 8,
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(vertical: 10),
                                child: Text(
                                  'Aviation Resource Management System (APGH)',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16.0),
                                ),
                              ),
                              //
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          // Container(
                          //   decoration: const BoxDecoration(
                          //       color: Colors.white,
                          //       // border: Border.all(
                          //       //   color: Colors.red,
                          //       // ),
                          //       borderRadius:
                          //           BorderRadius.all(Radius.circular(5))),
                          //   width: MediaQuery.of(context).size.width * 0.6,
                          //   height: 35,
                          //   child: Padding(
                          //     padding: const EdgeInsets.only(left: 30),
                          //     child: TextFormField(
                          //       enableSuggestions: false,
                          //       autocorrect: false,
                          //       inputFormatters: [
                          //         UpperCaseTextFormatter(),
                          //         FilteringTextInputFormatter.deny(
                          //             RegExp(r'\s'))
                          //       ],
                          //       controller: myController,
                          //       textAlign: TextAlign.center,
                          //       textCapitalization:
                          //           TextCapitalization.characters,
                          //       decoration: InputDecoration(
                          //           focusedBorder: InputBorder.none,
                          //           enabledBorder: InputBorder.none,
                          //           errorBorder: InputBorder.none,
                          //           disabledBorder: InputBorder.none,
                          //           hintText: 'Client ID',
                          //           isDense: true,
                          //           // contentPadding: const EdgeInsets.fromLTRB(
                          //           //     10, 10, 10, 10),
                          //           suffixIcon: IconButton(
                          //             constraints: BoxConstraints(maxHeight: 35,maxWidth: 35,minHeight: 35,minWidth: 35),
                          //             onPressed: () async {
                          //               if (myController.text.isNotEmpty) {
                          //                 await DeviceCalendarPlugin()
                          //                     .hasPermissions()
                          //                     .then((value) async {
                          //                   print(value);
                          //                   if (value.isSuccess &&
                          //                       (value.data == false)) {
                          //                     DialogBox().clientErrorMsgDialog(
                          //                         context,
                          //                         "The permission you denied is required for AOM to work. Please uninstall AOM and install again");
                          //                   } else {
                          //                     ConnectivityCheck()
                          //                         .checkInternet(context)
                          //                         .then((value) async {
                          //                       if (value) {
                          //                         const SizedBox(
                          //                           height: 10,
                          //                         );
                          //                         DialogBox().showMainDialog(
                          //                             context);

                          //                         await provider.getData(
                          //                             context,
                          //                             myController.text);
                          //                       }
                          //                     });
                          //                   }
                          //                 });
                          //               } else {
                          //                 DialogBox().clientErrorMsgDialog(
                          //                     context,
                          //                     "Please enter a client ID");
                          //               }
                          //             },
                          //             icon: Image.asset(
                          //               'assets/images/Arrow_copy.png',
                          //               fit: BoxFit.contain,
                          //               // height: 35,
                          //               // width: 35,
                          //             ),
                          //             // Icon(
                          //             //   Image.asset("assets/images/Arrow.png");
                          //             //     // Icons.arrow_circle_right,
                          //             //    )
                          //           )),
                          //       validator: (text) {
                          //         return null;
                          //       },
                          //     ),
                          //   ),
                          // ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(color: Colors.white),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(2))),
                                width: MediaQuery.of(context).size.width * 0.5,
                                height: 35,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 30),
                                  child: Row(
                                    children: [
                                      // Expanded(child: TextFormField())
                                      Expanded(
                                        child: TextFormField(
                                          enableSuggestions: false,
                                          autocorrect: false,
                                          inputFormatters: [
                                            UpperCaseTextFormatter(),
                                            FilteringTextInputFormatter.deny(
                                                RegExp(r'\s'))
                                          ],
                                          controller: myController,
                                          textAlign: TextAlign.center,
                                          textCapitalization:
                                              TextCapitalization.characters,
                                          decoration: const InputDecoration(
                                            focusedBorder: InputBorder.none,
                                            enabledBorder: InputBorder.none,
                                            errorBorder: InputBorder.none,
                                            disabledBorder: InputBorder.none,
                                            hintStyle: TextStyle(
                                                color: Colors.black26),
                                            hintText: 'Enter Client ID',
                                            isDense: true,
                                            // contentPadding: EdgeInsets.fromLTRB(
                                            //     10, 10, 10, 10),
                                          ),
                                          validator: (text) {
                                            return null;
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Container(
                                height: 35,
                                decoration: BoxDecoration(
                                    color: AppColors.buttonColor,
                                    border: Border.all(color: Colors.white),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(2))),
                                child: GestureDetector(
                                  onTap: () async {
                                    if (myController.text.isNotEmpty) {
                                      await DeviceCalendarPlugin()
                                          .hasPermissions()
                                          .then((value) async {
                                        print(value);
                                        if (value.isSuccess &&
                                            (value.data == false)) {
                                          DialogBox().clientErrorMsgDialog(
                                              context,
                                              "The permission you denied is required for AOM to work. Please uninstall AOM and install again");
                                        } else {
                                          ConnectivityCheck()
                                              .checkInternet(context)
                                              .then((value) async {
                                            if (value) {
                                              const SizedBox(
                                                height: 10,
                                              );
                                              DialogBox().showMainDialog(
                                                  context,
                                                  color: Colors.blue[100]);

                                              await provider.getData(
                                                  context, myController.text);
                                            }
                                          });
                                        }
                                      });
                                    } else {
                                      DialogBox().clientErrorMsgDialog(
                                          context, "Please enter a client ID");
                                    }
                                  },
                                  child: const Padding(
                                      padding: EdgeInsets.all(3.0),
                                      child: Icon(
                                        Icons.arrow_forward_sharp,
                                        color: Colors.white,
                                      )
                                      //  Image.asset(
                                      //   'assets/images/Arrow.png',
                                      //   height: 25,
                                      //   width: 25,
                                      //   fit: BoxFit.contain,
                                      // ),
                                      ),

                                  // Icon(
                                  //   Image.asset("assets/images/Arrow.png");
                                  //     // Icons.arrow_circle_right,
                                  //    )
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'Powered by ARMS',
                          style: TextStyle(
                              color: Colors.white,
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
                    const SizedBox(
                      height: 10,
                    )
                  ],
                )),
          );
        }));
  }

  // Future<void> _initilizeFireBase() async {
  //   final FlutterLocalNotificationsPlugin _notificationsPlugin =
  //       FlutterLocalNotificationsPlugin();

  //   await LocalNotification.initilize();

  //   FirebaseMessaging.instance.getInitialMessage().then((message) {
  //     print(message);
  //     debugPrint('Notification 1 --->>>>>>${message?.data}');
  //     if (message != null) {
  //       notificationMsg =
  //           "${message.data['Notid'] ?? ""}${message.data['message'] ?? ""} notification is comingg from terminated state";
  //     }
  //   });
  //   FirebaseMessaging.onMessage.listen((message) async {
  //     debugPrint('Notification 4 (on message) --->>>>>> ${message.data}}');

  //   if(message.notification!=null){
  //       await LocalNotification.showNotificationOnForeground(message);
  //     notificationMsg =
  //         "${message.data['message'] ?? ""}${message.data['Notid'] ?? ""} notification is comingg from  foreground";
  //     print(notificationMsg);
  //   }
  //   }).onError((error, stackTrace) {
  //     print("onMessage error $error stackTrace $stackTrace");
  //   });
  //   FirebaseMessaging.onMessageOpenedApp.listen(
  //     (message) async {
  //       print("on open app $message");
  //       notificationMsg =
  //           "${message.data['Notid'] ?? ""}${message.data['message'] ?? ""} notification is comingg from background";
  //       print(notificationMsg);
  //     },
  //   ).onError((error, stackTrace) {
  //     print("onMessageOpenedApp error $error stackTrace $stackTrace");
  //   });
  // }
}

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
        text: newValue.text.toUpperCase(), selection: newValue.selection);
  }
}
