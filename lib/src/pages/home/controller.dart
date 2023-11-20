import 'package:faker_person_api/src/model/person.dart';
import 'package:faker_person_api/src/repositories/person.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  HomeController(this._personRepository);

  final PersonRepository _personRepository;

  final ScrollController scrollController = ScrollController();
  RxList<Person> persons = <Person>[].obs;
  RxBool isLoading = false.obs;
  RxString errorMsg = ''.obs;

  int _fetchAttempt = 0;
  RxBool endOfList = false.obs;

  int get lengthPersons => persons.length;

  int get count {
    if (persons.isEmpty && isLoading.value) {
      return 5;
    }
    if (isLoading.value) {
      return lengthPersons + 2;
    }
    if (endOfList.value || errorMsg.value.isNotEmpty) {
      return lengthPersons + 1;
    }
    return lengthPersons + (kIsWeb ? 1 : 0);
  }

  @override
  void onInit() {
    super.onInit();
    fetchPerson(isFirstCall: true);
  }

  void reset() {
    isLoading.value = false;
    errorMsg.value = '';
    _fetchAttempt = 0;
    endOfList.value = false;
  }

  Future<void> fetchPerson({bool isFirstCall = false}) async {
    if (isLoading.value || endOfList.value) {
      return;
    }
    try {
      isLoading.value = true;
      errorMsg.value = '';
      List<Person> list =
          await _personRepository.getPersons(isFirstCall ? 10 : 20);
      if (isFirstCall) {
        persons.clear();
      }
      persons.addAll(list);
      _fetchAttempt++;
      if (_fetchAttempt == 4) {
        endOfList.value = true;
      }
      Future.delayed(const Duration(milliseconds: 400), () {
        isLoading.value = false;
        if (isFirstCall) {
          if (!kIsWeb) {
            scroll1px();
          }
        }
      });
    } catch (e) {
      isLoading.value = false;
      errorMsg.value = e.toString();
    }
  }

  void scrollToEnd() {
    if (scrollController.positions.length != 1) {
      return;
    }
    scrollController.animateTo(scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 200), curve: Curves.linear);
  }

  void scroll1px() {
    if (scrollController.positions.length != 1) {
      return;
    }
    scrollController.animateTo(scrollController.position.pixels + 1,
        duration: const Duration(milliseconds: 200), curve: Curves.linear);
  }
}
