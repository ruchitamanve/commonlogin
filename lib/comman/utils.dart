import '/client_id/client_id.dart';
import '/local_db/moor_db.dart';
import '/pushnotifications/notifications_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DialogBox {
  late CaasLocalDatabase _cassLocalDatabase;

  Future alretBox(context, String msg) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            alignment: Alignment.center,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15.0))),
            content: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                RichText(
                  text: TextSpan(children: [
                    const TextSpan(
                      text: 'ARMS',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                    WidgetSpan(
                      child: Transform.translate(
                        offset: const Offset(0, -6),
                        child: const Text(
                          'Ⓡ',
                          textScaleFactor: 0.8,
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: Colors.black),
                        ),
                      ),
                    )
                  ]),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  msg,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w400),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 10,
                ),
                InkWell(
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    alignment: Alignment.center,
                    child: Text(
                      "OK",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.blue.shade600,
                          fontWeight: FontWeight.w600),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            ),
          );
        });
  }

  showLoaderDialog(BuildContext context, {String? message}) {
    AlertDialog alert = AlertDialog(

        // backgroundColor: Colors.grey,
        insetPadding: const EdgeInsets.symmetric(horizontal: 20),
        content: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Center(
                    child: CupertinoActivityIndicator(
                  color: Colors.black,
                  animating: true,
                  radius: 15,
                )),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  message ?? "Please wait, syncing data...",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.lerp(
                          FontWeight.w500, FontWeight.w600, 0.4)),
                  textAlign: TextAlign.center,
                ),
              ]),
        ));
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  showMainDialog(BuildContext context, {String? message, Color? color}) {
    AlertDialog alert = AlertDialog(
        // backgroundColor: Colors.grey,
        alignment: Alignment.center,
        backgroundColor: color ?? Colors.white,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CupertinoActivityIndicator(
              color: Colors.black,
              animating: true,
              radius: 15,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Please wait, syncing data...',
              style: TextStyle(
                fontSize: 18,
                fontWeight:
                    FontWeight.lerp(FontWeight.w500, FontWeight.w600, 0.4),
                color: Colors.black,
              ),
            ),
          ],
        ));

    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  registerDialog(BuildContext context, {String? message}) {
    AlertDialog alert = AlertDialog(

        // backgroundColor: Colors.grey,
        insetPadding: const EdgeInsets.all(10),
        content: SizedBox(
          width: 5,
          child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Center(
                    child: CupertinoActivityIndicator(
                  color: Colors.black,
                  animating: true,
                  radius: 15,
                )),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  message ?? "Registering...",
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w400),
                  textAlign: TextAlign.center,
                ),
              ]),
        ));
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  Future showRejectRecall(context, String msg, String notificationLogId) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            alignment: Alignment.center,
            contentPadding: EdgeInsets.zero,
            content: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  RichText(
                    text: const TextSpan(children: [
                      TextSpan(
                        text: 'Info',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
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
                      msg,
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
                    thickness: 0.5,
                    height: 0.5,
                  ),
                  InkWell(
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                      alignment: Alignment.center,
                      child: Text(
                        "OK",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.blue.shade600,
                            fontWeight: FontWeight.w600),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    onTap: () async {
                      Navigator.of(context).pop();

                      ///need to call AMS_SA_NOTIFICATIONLOG_STATUS service
                      await Provider.of<NotificationProvider>(context,
                              listen: false)
                          .getDeleteNotifications(
                              context, notificationLogId, "1");
                    },
                  )
                ],
              ),
            ),
          );
        });
  }

  Future clientErrorMsgDialog(context, String msg) {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: const Color(0xFFc6daf2),
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
                  text: TextSpan(children: [
                    const TextSpan(
                      text: 'ARMS',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                    WidgetSpan(
                      child: Transform.translate(
                        offset: const Offset(0, -6),
                        child: const Text(
                          'Ⓡ',
                          textScaleFactor: 0.8,
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: Colors.black),
                        ),
                      ),
                    )
                  ]),
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    msg,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w400),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Divider(
                  color: Colors.blue.shade200,
                  thickness: 0.5,
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
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            ),
          );
        });
  }

  Future errorMsgDialog(context, String msg) {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
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
                  text: TextSpan(children: [
                    const TextSpan(
                      text: 'ARMS',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                    WidgetSpan(
                      child: Transform.translate(
                        offset: const Offset(0, -6),
                        child: const Text(
                          'Ⓡ',
                          textScaleFactor: 0.8,
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: Colors.black),
                        ),
                      ),
                    )
                  ]),
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    msg,
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
                    child: Text(
                      "OK",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.blue[400],
                          // fontWeight: FontWeight.bold,
                          fontFamily: "Calibri Bold"),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            ),
          );
        });
  }

  Future splashScreenPopUp(context, String msg) {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
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
                  text: TextSpan(children: [
                    const TextSpan(
                      text: 'ARMS',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                    WidgetSpan(
                      child: Transform.translate(
                        offset: const Offset(0, -6),
                        child: const Text(
                          'Ⓡ',
                          textScaleFactor: 0.8,
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: Colors.black),
                        ),
                      ),
                    )
                  ]),
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    msg,
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
                  thickness: 0.5,
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
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context).pop(true);
                  },
                )
              ],
            ),
          );
        });
  }

  Future showServerErrorDialog(context, String msg) {
    _cassLocalDatabase = Provider.of<CaasLocalDatabase>(context, listen: false);
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            alignment: Alignment.center,
            contentPadding: EdgeInsets.zero,
            content: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  RichText(
                    text: TextSpan(children: [
                      const TextSpan(
                        text: 'ARMS',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                      ),
                      WidgetSpan(
                        child: Transform.translate(
                          offset: const Offset(0, -6),
                          child: const Text(
                            'Ⓡ',
                            textScaleFactor: 0.8,
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                                color: Colors.black),
                          ),
                        ),
                      )
                    ]),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      msg,
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
                    thickness: 0.5,
                    height: 0.5,
                  ),
                  InkWell(
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                      alignment: Alignment.center,
                      child: Text(
                        "OK",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.blue.shade600,
                            fontWeight: FontWeight.w600),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    onTap: () async {
                      Navigator.of(context).pop();
                      await _cassLocalDatabase.delete_all_tokens();
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => const ClientId()));
                      return;
                    },
                  )
                ],
              ),
            ),
          );
        });
  }
}

class CustomDialogWidget extends StatelessWidget {
  final VoidCallback? onYesActionTap;
  final VoidCallback? onNoActionTap;
  final String? content;
  const CustomDialogWidget(
      {Key? key,
      this.onYesActionTap,
      this.onNoActionTap,
      @required this.content})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      alignment: Alignment.center,
      contentPadding: EdgeInsets.zero,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(15.0)),
      ),
      content: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            RichText(
              text: TextSpan(children: [
                const TextSpan(
                  text: 'ARMS',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                ),
                WidgetSpan(
                  child: Transform.translate(
                    offset: const Offset(0, -6),
                    child: const Text(
                      'Ⓡ',
                      textScaleFactor: 0.8,
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: Colors.black),
                    ),
                  ),
                )
              ]),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                content ?? 'N/A',
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
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
                padding: const EdgeInsets.all(8),
                alignment: Alignment.center,
                child: Text(
                  "OK",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.blue.shade600,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              onTap: () {
                onYesActionTap!();
              },
            )
          ],
        ),
      ),
    );
  }
}
