import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShowLoader extends StatelessWidget {
  const ShowLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
        insetPadding: const EdgeInsets.symmetric(horizontal: 28, vertical: 70),
        backgroundColor: Colors.white,
        child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Center(
                      child: CupertinoActivityIndicator(
                    color: Colors.black,
                    animating: true,
                    radius: 15,
                  )),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Please wait, syncing data...",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                    textAlign: TextAlign.center,
                  ),
                ])));
  }
}
