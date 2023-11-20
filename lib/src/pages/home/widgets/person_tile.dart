import 'package:faker_person_api/src/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:faker_person_api/src/model/person.dart';
import 'package:faker_person_api/src/widgets/skeleton.dart';
import 'package:flutter/material.dart';

import '../../../widgets/custom_circle_avatar.dart';

class PersonTile extends StatelessWidget {
  const PersonTile({super.key, this.person});

  final Person? person;

  @override
  Widget build(BuildContext context) {
    if (person == null) {
      return _buildSkeleton();
    }

    return ListTile(
      leading: CustomCircleAvatar(
        person: person!,
      ),
      title: Text(person!.name),
      subtitle: Text(person!.email ?? '-'),
      onTap: () {
        Get.toNamed(Routes.personDetails, arguments: person);
      },
    );
  }

  Widget _buildSkeleton() {
    return SkeletonWidget(
      child: ListTile(
        leading: const CircleAvatar(),
        title: _buildPlaceholder(),
        subtitle: _buildPlaceholder(),
      ),
    );
  }

  Widget _buildPlaceholder() => Container(
        height: 12,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
      );
}
