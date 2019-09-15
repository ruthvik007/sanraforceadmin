import 'LoginPage.dart';

class Login {
  final String message;
  final bool success;
  final Member data;

  Login({this.message, this.success, this.data});

  factory Login.fromJson(Map<String, dynamic> json) {
    return Login(
        message: json['message'],
        success: json['success'],
        data: Member.fromJson(json['data']));
  }
}

class Member {
  String user_id;
  String name;
  String mobile_no;
  String email_id;

  Member({this.user_id, this.name, this.mobile_no, this.email_id});

  factory Member.fromJson(Map<String, dynamic> json) {
    return Member(
        user_id: json['user_id'],
        name: json['name'],
        mobile_no: json['mobile_no'],
        email_id: json['email_id']);
  }

  Map<String, dynamic> toJson() => {
        'user_id': user_id,
        'name': name,
        'mobile_no': mobile_no,
        'email_id': email_id,
      };
}
