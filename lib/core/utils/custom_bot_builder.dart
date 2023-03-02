import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';

class CustomBotBuilder {
  static showCustomBotAlert(String? message) {
    BotToast.showCustomLoading(
        align: Alignment.center,
        toastBuilder: (toastBuilder) {
          return AlertDialog(
            alignment: Alignment.center,
            contentPadding: EdgeInsets.zero,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15.0))),
            content: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  height: 20,
                ),
                RichText(
                  text: const TextSpan(children: [
                    TextSpan(
                      text: 'Info',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                  ]),
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    message ?? '',
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w400),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Divider(
                  color: Colors.grey,
                  thickness: 0.2,
                  height: 0.5,
                ),
                InkWell(
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    alignment: Alignment.center,
                    child: const Text(
                      "OK",
                      style: TextStyle(
                          fontSize: 18,
                          color: Color(0xFF0086bf),
                          fontWeight: FontWeight.w500),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  onTap: () {
                    BotToast.closeAllLoading();
                  },
                )
              ],
            ),
          );
          // return Card(
          //   elevation: 3,
          //   margin: const EdgeInsets.all(16),
          //   child: Container(
          //     padding: const EdgeInsets.all(16),
          //     child: Column(
          //       mainAxisSize: MainAxisSize.min,
          //       children: [
          //         Text('$message'),
          //         const SizedBox(height: 16,),
          //         Container(
          //           alignment: Alignment.center,
          //           child: FlatButton(
          //               child: const Text('Ok', style: TextStyle(color: Colors.white),),
          //               color: Colors.blue,
          //               onPressed: () {
          //                 BotToast.closeAllLoading();
          //               }),
          //         ),
          //       ],),
          //   ),
          // );
        });
  }

  static showCustomBotLoader() {
    BotToast.showCustomLoading(
        align: Alignment.center,
        toastBuilder: (toastBuilder) {
          return Card(
            elevation: 3,
            margin: const EdgeInsets.all(16),
            child: Container(
              width: 300,
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text('Loading ...'),
                  SizedBox(
                    height: 16,
                  ),
                  CircularProgressIndicator(
                    color: Colors.grey,
                    strokeWidth: 4,
                  )
                ],
              ),
            ),
          );
        });
  }
}
