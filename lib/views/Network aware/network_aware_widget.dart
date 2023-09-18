import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

import '../pages/Widgets/TextWidget.dart';

class ConnectionCheck extends StatelessWidget {
  final Widget child;
  const ConnectionCheck({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ConnectivityResult>(
        stream: Connectivity().onConnectivityChanged,
        builder: (contex, snapshot) {
          return snapshot.data == ConnectivityResult.none
              ? Scaffold(
                  body: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Center(
                          child: Icon(
                        Icons.wifi_off,
                        size: 50,
                      )),
                      TextWidget(
                        text: "No internet",
                      ),
                      TextWidget(
                        text: 'Please Check Your internet',
                      ),
                    ],
                  ),
                )
              : child;
        });
  }
}
