import 'package:faker_person_api/src/widgets/custom_circle_avatar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:faker_person_api/src/pages/person_details/controller.dart';
import 'package:faker_person_api/src/extensions/date.dart';

class PersonDetailsPage extends GetView<PersonDetailsController> {
  const PersonDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(controller.person.name),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 20),
        children: [
          CustomCircleAvatar(
            person: controller.person,
            radius: 50,
            fontSize: 30,
          ),
          if (controller.person.email != null)
            ListTile(
              leading: const Icon(Icons.email_outlined),
              title: const Text('Email address'),
              subtitle: hyperText(controller.person.email!,
                  onTap: controller.sendEmail),
            ),
          if (controller.person.phone != null)
            ListTile(
              leading: const Icon(Icons.phone_outlined),
              title: const Text('Phone number'),
              subtitle: hyperText(controller.person.phone!,
                  onTap: controller.phoneCall),
            ),
          if (controller.person.birthday != null)
            ListTile(
              leading: const Icon(Icons.date_range_outlined),
              title: const Text('Date of birth'),
              subtitle: Text(controller.person.birthday!.formattedDate),
            ),
          if (controller.fullAddress != null)
            ListTile(
              leading: const Icon(Icons.home_outlined),
              title: const Text('Address'),
              subtitle: Text(controller.fullAddress!),
              trailing: IconButton(
                  onPressed: () async {
                    await controller.copyToClipboard(controller.fullAddress!);
                  },
                  icon: const Icon(Icons.copy)),
            ),
          if (controller.person.website != null)
            ListTile(
              leading: const Icon(Icons.web_outlined),
              title: const Text('Website'),
              subtitle: hyperText(controller.person.website!,
                  onTap: controller.openWeb),
            ),
        ],
      ),
    );
  }

  Widget hyperText(String text, {VoidCallback? onTap}) {
    return InkWell(
      onTap: onTap,
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.blue,
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }
}
