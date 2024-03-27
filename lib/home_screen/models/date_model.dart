// ignore_for_file: public_member_api_docs, sort_constructors_first
class DateModel {
  String? maximum;
  String? minimum;
  DateModel({
    this.maximum,
    this.minimum,
  });
  DateModel.fromJson(Map<String, dynamic> json) {
    maximum = json["maximum"];
    minimum = json["minimum"];
  }
}
