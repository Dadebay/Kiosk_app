import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kiosk_app/app/home_view/dialogs.dart';

class CheckInScreen extends StatefulWidget {
  const CheckInScreen({super.key});

  @override
  State<CheckInScreen> createState() => _CheckInScreenState();
}

class _CheckInScreenState extends State<CheckInScreen> {
  final TextEditingController _phoneController = TextEditingController();
  final List<String> _images = const [
    'assets/image/1.webp',
    'assets/image/2.webp',
    'assets/image/3.webp',
    'assets/image/4.webp',
    'assets/image/5.webp',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Gri arka plan sorununu çözmek için
      body: Stack(
        children: [
          // Arkada kayan resimler için widget
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(_images[4]),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            color: Colors.black.withOpacity(0.5),
          ),
          // Giriş arayüzü
          SafeArea(
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Logo
                    const Text(
                      'Funny', // Resimdeki logo metni
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 60),
                    const Icon(
                      Icons.check_circle_outline_rounded,
                      color: Colors.white,
                      size: 70,
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Check In',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Please enter your phone number below to check in!',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 40),
                    // Telefon numarası giriş alanı
                    Container(
                      width: Get.size.width * 0.6,
                      // Genişliği azaltmak için
                      child: TextField(
                        controller: _phoneController,
                        keyboardType: TextInputType.phone,
                        style: const TextStyle(color: Colors.white, fontSize: 18),
                        decoration: InputDecoration(
                          labelText: 'Your phone number',
                          labelStyle: const TextStyle(color: Colors.white70),
                          filled: true,
                          fillColor: Colors.white.withOpacity(0.2),
                          contentPadding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide.none,
                          ),
                          prefixIcon: const Icon(Icons.phone, color: Colors.white70),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    // İlerleme butonu
                    ElevatedButton(
                      onPressed: () {
                        if (_phoneController.text.isNotEmpty) {
                          showDialog(
                            context: context,
                            builder: (context) => CheckInDialog(
                              phoneNumber: _phoneController.text,
                              onCheckInSuccess: () => _phoneController.clear(),
                            ),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(),
                        padding: const EdgeInsets.all(20),
                        backgroundColor: Colors.white,
                      ),
                      child: const Icon(
                        Icons.arrow_forward,
                        color: Colors.black,
                        size: 30,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
