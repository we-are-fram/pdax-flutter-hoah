import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/services.dart';
import 'package:faker_person_api/src/model/person.dart';

class PersonDetailsController extends GetxController {
  late final Person person;

  String? get fullAddress => person.address?.fullAddress;

  @override
  void onInit() {
    super.onInit();
    person = Get.arguments;
  }

  String? _encodeQueryParameters(Map<String, String> params) {
    return params.entries
        .map((MapEntry<String, String> e) =>
            '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
        .join('&');
  }

  void sendEmail() {
    if (person.email == null) {
      return;
    }

    final Uri emailLaunchUri = Uri(
        scheme: 'mailto',
        path: person.email,
        query: _encodeQueryParameters(<String, String>{
          'subject': 'Subject',
          'body': 'Sent from faker app'
        }));

    launchUrl(emailLaunchUri);
  }

  void phoneCall() {
    if (person.phone == null) {
      return;
    }

    final Uri smsLaunchUri = Uri(
      scheme: 'tel',
      path: person.phone,
    );

    launchUrl(smsLaunchUri);
  }

  void openWeb() async {
    if (person.website == null) {
      return;
    }

    final String website = person.website!;
    final String encodedUrl = Uri.encodeFull(website);
    final Uri? url = Uri.tryParse(encodedUrl);
    if (url == null) {
      throw Exception('cannot parse website: $website');
    }

    if (await canLaunchUrl(url)) {
      launchUrl(url);
    } else {
      throw Exception('Could not launch $website');
    }
  }

  Future<void> copyToClipboard(String text) async {
    await Clipboard.setData(ClipboardData(text: text));
  }
}
