import 'package:faker_person_api/src/pages/home/widgets/person_tile.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../model/person.dart';
import '../../resources/colors.dart';
import 'controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: kIsWeb
          ? _buildListPerson()
          : RefreshIndicator(
              onRefresh: () async {
                controller.reset();
                await controller.fetchPerson(isFirstCall: true);
              },
              child: NotificationListener<ScrollNotification>(
                onNotification: (ScrollNotification notification) {
                  if (notification is ScrollUpdateNotification &&
                      notification.metrics.axis == Axis.vertical) {
                    double currentPixel = notification.metrics.pixels;
                    double maxScrollExtent =
                        notification.metrics.maxScrollExtent;

                    if (currentPixel > (maxScrollExtent - 250)) {
                      controller.fetchPerson();
                    }
                  }
                  return false;
                },
                child: _buildListPerson(),
              ),
            ),
    );
  }

  Widget _buildListPerson() {
    return Obx(
      () => ListView.builder(
        padding: const EdgeInsets.only(bottom: 20),
        controller: controller.scrollController,
        physics: const AlwaysScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          if (index < controller.lengthPersons) {
            final Person p = controller.persons[index];
            return PersonTile(person: p);
          }

          if (controller.isLoading.value) {
            return const PersonTile(person: null);
          }

          if (controller.endOfList.value) {
            return const Text(
              key: ValueKey('end_txt'),
              '----- You reach end of page -----',
              textAlign: TextAlign.center,
            );
          }

          if (controller.errorMsg.isNotEmpty) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: InkWell(
                child: Text(
                  '${controller.errorMsg.value}. Click here to try again',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: FakerColors.error),
                ),
                onTap: () {
                  controller.fetchPerson(
                      isFirstCall: controller.lengthPersons == 0);
                },
              ),
            );
          }

          if (kIsWeb) {
            return MaterialButton(
              child: const Text(
                'Load more',
                textAlign: TextAlign.center,
              ),
              onPressed: () async {
                controller.fetchPerson();
                await Future.delayed(const Duration(milliseconds: 50));
                controller.scrollToEnd();
              },
            );
          }
          return Container();
        },
        itemCount: controller.count,
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      centerTitle: true,
      title: Obx(
        () {
          String length = controller.lengthPersons == 0
              ? ''
              : '(${controller.lengthPersons})';
          return Text('Faker Person $length');
        },
      ),
    );
  }
}
