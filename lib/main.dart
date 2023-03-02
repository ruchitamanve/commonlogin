// import '/splash_screen.dart';
// import 'package:flutter/material.dart';

// class SplashScereenCall {
//   static Widget text({
//     Key? key,
//     @required lastScreenRouting,
//   }) {
//     return SplashScreen();
//   }
// }
import 'dart:async';

import '/comman/global_var.dart';
import '/comman/sharedpreferences.dart';
import '/get_it_locator.dart';
import '/local_db/moor_db.dart';
import '/login/login_screen.dart';
import '/pushnotifications/local_notifications.dart';
import '/pushnotifications/notifications_provider.dart';
import '/splash_screen.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> backroundHandler(message) async {
  print("This is a message from background $message");
  print(message.data);
  await LocalNotification.showNotificationOnForeground(message);
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(backroundHandler);
  setupLocator();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  Timer? _timer;

  final botToastBuilder = BotToastInit(); //1. call BotToastInit
  static final GlobalKey<NavigatorState> _navigatorKey =
      GlobalKey<NavigatorState>();
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<CaasLocalDatabase>(create: (_) => CaasLocalDatabase()),
        ChangeNotifierProvider(
          create: (context) => NotificationProvider(),
        ),
      ],
      child: Builder(builder: (context) {
        return Listener(
            onPointerDown: (_) {
              print("gesture detect ${GlobalValues.isLoggedIn} ");
              _timer?.cancel();
              if (GlobalValues.isLoggedIn != "") {
                _timer = Timer(const Duration(minutes: 10), () async {
                  _navigatorKey.currentState?.pushAndRemoveUntil(
                      MaterialPageRoute(
                          builder: (context) => const LoginScreen(
                                backpopUp: true,
                                sessionPopUp: true,
                              )),
                      (Route<dynamic> route) => false);
                });
              }
            },
            child: MaterialApp(
              theme: ThemeData(
                  fontFamily: 'Calibri',
                  // textTheme: Theme.of(context)
                  //     .textTheme
                  //     .apply(fontSizeDelta: 1.8, fontSizeFactor: 1.0),
                  appBarTheme: const AppBarTheme(
                    elevation: 0,
                    color: Colors.transparent,
                  )),
              builder: (context, child) {
                WidgetsBinding.instance.addObserver(this);

                child = botToastBuilder(context, child);
                return child;
              },
              navigatorKey: _navigatorKey,
              navigatorObservers: [BotToastNavigatorObserver()],
              debugShowCheckedModeBanner: false,
              home: const AnnotatedRegion<SystemUiOverlayStyle>(
                value: SystemUiOverlayStyle(
                  statusBarColor: Colors.transparent, // transparent status bar
                ),
                child: SplashScreen(),
              ),
            ));
      }),
    );
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _timer?.cancel();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state != AppLifecycleState.resumed) {
      _timer?.cancel();
      Sharedpreferences.setStringValue("last_sync", "");
    }
    super.didChangeAppLifecycleState(state);
  }
}
