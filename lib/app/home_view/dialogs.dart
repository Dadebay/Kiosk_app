import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kiosk_app/app/constants/color_constants.dart';
import 'package:kiosk_app/app/constants/theme.dart';
import 'package:lottie/lottie.dart';

class Child {
  final String name;
  final String course;
  bool isSelected;

  Child({required this.name, required this.course, this.isSelected = false});
}

class CheckInDialog extends StatefulWidget {
  final String phoneNumber;
  final VoidCallback onCheckInSuccess;
  const CheckInDialog({super.key, required this.phoneNumber, required this.onCheckInSuccess});

  @override
  State<CheckInDialog> createState() => _CheckInDialogState();
}

class _CheckInDialogState extends State<CheckInDialog> {
  List<Child> _getChildren(String phone) {
    // Mock data, can be replaced with actual data fetching logic
    return [
      Child(name: 'Ahmet Yılmaz', course: 'Swimming Course'),
      Child(name: 'Zeynep Kaya', course: 'Piano Lesson'),
      Child(name: 'Mustafa Demir', course: 'Chess Club'),
    ];
  }

  late List<Child> children;

  @override
  void initState() {
    super.initState();
    children = _getChildren(widget.phoneNumber);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      title: Text('Select Your Child', textAlign: TextAlign.center, style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold)),
      content: SizedBox(
        width: Get.size.width * 0.6,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: children.length,
          itemBuilder: (context, index) {
            final child = children[index];
            return CheckboxListTile(
              title: Text(child.name, style: const TextStyle(fontWeight: FontWeight.w600)),
              subtitle: Text(child.course),
              value: child.isSelected,
              onChanged: (bool? value) {
                setState(() {
                  child.isSelected = value ?? false;
                });
              },
              activeColor: ColorConstants.kPrimaryColor,
              controlAffinity: ListTileControlAffinity.leading,
            );
          },
        ),
      ),
      actionsAlignment: MainAxisAlignment.center,
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        const SizedBox(width: 10),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: ColorConstants.kPrimaryColor,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          ),
          onPressed: () {
            Navigator.pop(context);
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) => const SuccessDialog(),
            ).then((_) => widget.onCheckInSuccess());
          },
          child: const Text('Check In'),
        ),
      ],
    );
  }
}

class DialogUtils {
  dynamic showNoConnectionDialog({required VoidCallback onRetry, required BuildContext context}) {
    Get.dialog(
      Dialog(
        shape: const RoundedRectangleBorder(borderRadius: BorderRadii.borderRadius20),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        child: Stack(
          alignment: Alignment.topCenter,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(top: 50),
              child: Container(
                padding: const EdgeInsets.only(top: 100, left: 15, right: 15),
                decoration: const BoxDecoration(color: Colors.white, borderRadius: BorderRadii.borderRadius20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const Text(
                      'No Internet Connection',
                      style: TextStyle(
                        fontSize: 24.0,
                        color: ColorConstants.kPrimaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                      child: Text(
                        'Please check your internet connection and try again.',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.black, fontSize: 16.0),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Get.back();
                        Future.delayed(const Duration(milliseconds: 1000), () => onRetry());
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorConstants.kPrimaryColor,
                        shape: const RoundedRectangleBorder(borderRadius: BorderRadii.borderRadius10),
                        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
                      ),
                      child: const Text(
                        'Retry',
                        style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 0,
              child: CircleAvatar(
                backgroundColor: Colors.white,
                maxRadius: 70,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(70),
                  child: Image.asset(Assets.noConnection, fit: BoxFit.fill),
                ),
              ),
            ),
          ],
        ),
      ),
      barrierDismissible: false,
    );
  }
}

class SuccessDialog extends StatefulWidget {
  const SuccessDialog({super.key});

  @override
  State<SuccessDialog> createState() => _SuccessDialogState();
}

class _SuccessDialogState extends State<SuccessDialog> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      if (mounted) {
        Navigator.of(context).pop();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.black.withOpacity(0.6),
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      content: SizedBox(
        width: Get.size.width * 0.4,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Lottie.asset('assets/lottie/success_confetti.json', repeat: false, width: 300, height: 300),
            const SizedBox(height: 16),
            const Text(
              'Checked In Successfully!',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }
}
