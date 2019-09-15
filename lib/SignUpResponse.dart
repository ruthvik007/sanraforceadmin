class SignUpResponse {
  final bool success;
  final String message;

  SignUpResponse({this.success, this.message});

  factory SignUpResponse.fromJson(Map<String, dynamic> json) {
    return SignUpResponse(
      success: json['success'],
      message: json['message'],
    );
  }

  Map<String, dynamic> toJson() => {
        'success': success,
        'message': message,
      };
}
