import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeController extends GetxController {

  var aboutMe=  'I’m a passionate Flutter developer with over 2 year of professional experience building responsive, high-performance applications for both mobile and web platforms. I specialize in creating seamless user experiences with clean, maintainable code. Working in a fast-paced company environment has helped me sharpen my problem-solving skills, collaborate effectively with cross-functional teams, and stay up-to-date with the latest trends in Flutter and mobile development. I’m driven by a love for elegant UI/UX design and a commitment to writing scalable, efficient code that delivers real value to users.';


  final ScrollController scrollController = ScrollController();
  var isDarkMode = false.obs;

  void toggleTheme() {
    isDarkMode.value = !isDarkMode.value;
    Get.changeThemeMode(isDarkMode.value ? ThemeMode.dark : ThemeMode.light);
  }

  void scrollToSection(String section) {
    double offset;
    switch (section) {
      case 'about':
        offset = 0;
        break;
      case 'projects':
        offset = 600;
        break;
      case 'contact':
        offset = 1200;
        break;
      default:
        offset = 0;
    }
    scrollController.animateTo(
      offset,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  Future<void> launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      Get.snackbar('Error', 'Could not launch $url');
    }
  }

  Future<void> makePhoneCall(String phoneNumber) async {
    final Uri phoneUri = Uri(scheme: 'tel', path: phoneNumber);
    if (await canLaunchUrl(phoneUri)) {
      await launchUrl(phoneUri);
    } else {
      Get.snackbar('Error', 'Could not initiate call to $phoneNumber');
    }
  }

  Future<void> sendWhatsAppMessage(String phoneNumber, String message) async {
    final Uri whatsappUri = Uri.parse(
      'https://wa.me/$phoneNumber?text=${Uri.encodeComponent(message)}',
    );
    if (await canLaunchUrl(whatsappUri)) {
      await launchUrl(whatsappUri);
    } else {
      Get.snackbar('Error', 'Could not open WhatsApp for $phoneNumber');
    }
  }
}