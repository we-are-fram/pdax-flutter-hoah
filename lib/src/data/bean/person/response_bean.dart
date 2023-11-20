import 'package:faker_person_api/src/data/bean/person/person_detail_response_bean.dart';

class PersonResponseBean {
  final String status;
  final int code;
  final int total;
  final List<PersonDetailResponseBean> persons;

  PersonResponseBean({
    required this.status,
    required this.code,
    required this.total,
    required this.persons,
  });

  factory PersonResponseBean.fromJson(Map<String, dynamic> json) =>
      PersonResponseBean(
        status: json['status'],
        code: json['code'],
        total: json['total'],
        persons: json['data'] == null
            ? []
            : List<PersonDetailResponseBean>.from(
                json['data']!.map((x) => PersonDetailResponseBean.fromJson(x))),
      );
}
