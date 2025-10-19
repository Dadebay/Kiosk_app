// ignore_for_file: file_names, always_use_package_imports

import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kiosk_app/app/home_view/home_view.dart';

import '../home_view/dialogs.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    checkConnection();
  }

  void checkConnection() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result.first.rawAddress.isNotEmpty) {
        await Future.delayed(const Duration(seconds: 4), () => Get.offAll(() => CheckInScreen()));
      }
    } on SocketException catch (_) {
      DialogUtils().showNoConnectionDialog(
        onRetry: () {
          Navigator.of(context).pop();
          checkConnection();
        },
        context: context,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(child: FlutterLogo(size: 200)),
            LinearProgressIndicator(
              color: Colors.black,
            )
          ],
        ),
      ),
    );
  }
}
