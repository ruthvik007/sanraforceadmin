import 'home_page.dart';
class FieldForm {
  final String farmer_name;
  final String mobile_no;
  final String farm_address;
  final String lattitude;
  final String longitude;
  final String crop;
   String crop_picture;
  final String diagnosis;
  final String solution;
  final String summary;
  final String date;
  final String next_followup_date;
  final String reporter_id;
  final String feedback;
  final String reason;
  final String recommendation;
  final String followed_suggetion;
  final String next_followed_date;
  final int report_id;
  final String crop_age;

  FieldForm({
    this.farmer_name,
    this.mobile_no,
    this.farm_address,
    this.lattitude,
    this.longitude,
    this.crop,
    this.diagnosis,
    this.solution,
    this.summary,
    this.date,
    this.next_followup_date,
    this.reporter_id,
    this.feedback,
    this.reason,
    this.recommendation,
    this.followed_suggetion,
    this.next_followed_date,
    this.report_id,
    this.crop_picture,
    this.crop_age,
  });

  factory FieldForm.fromJson(Map<String, dynamic> json) {
    return FieldForm(
        farmer_name: json['farmer_name'],
        mobile_no: json['mobile_no'],
        farm_address: json['farm_address'],
        lattitude: json['lattitude'],
        longitude: json['longitude'],
        crop: json['crop'],
        diagnosis: json['diagnosis'],
        solution: json['solution'],
        summary: json['summary'],
        date: json['date'],
        next_followup_date: json['next_followup_date'],
        reporter_id: json['reporter_id'],
        feedback: json['feedback'],
        reason: json['reason'],
        recommendation: json['recommendation'],
        followed_suggetion: json['followed_suggetion'],
        next_followed_date: json['next_followed_date'],
        report_id: json['report_id'],
        crop_picture: json['crop_picture'],
        crop_age: json['crop_age']);
  }

  Map<String, dynamic> toJson() => {
        'farmer_name': farmer_name,
        'mobile_no': mobile_no,
        'farm_address': farm_address,
        'lattitude': lattitude,
        'longitude': longitude,
        'crop': crop,
        'diagnosis': diagnosis,
        'solution': solution,
        'summary': summary,
        'date': date,
        'next_followup_date': next_followup_date,
        'reporter_id': reporter_id,
        'feedback': feedback,
        'reason': reason,
        'recommendation': recommendation,
        'followed_suggetion': followed_suggetion,
        'next_followed_date': next_followed_date,
        'report_id': report_id,
        'crop_picture': crop_picture,
        'crop_age': crop_age
      };
}
