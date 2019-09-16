class ReportBody {
  final String message;
  final bool success;
  final List<ReportData> data;
  final String offset;
  final int count;

  ReportBody({this.message, this.success, this.data, this.offset, this.count});

  factory ReportBody.fromJson(Map<String, dynamic> json) {
    var list = json['data'] as List;
//    print(list.runtimeType); //returns List<dynamic>
    List<ReportData> productsList =
        list.map((i) => ReportData.fromJson(i)).toList();

    return ReportBody(
        message: json['message'],
        success: json['success'],
        data: productsList,
        offset: json['offset'],
        count: json['count']);
  }

  Map<String, dynamic> toJson() => {
        'message': message,
        'success': success,
        'data': data,
        'offset': offset,
        'count': count
      };
}

class ReportData {
  ReportDetailedData Report;

  FarmerReport Farmer;

  List<FollowedReport> Followed_Report;

  ReportData({this.Report, this.Farmer, this.Followed_Report});

  factory ReportData.fromJson(Map<String, dynamic> json) {
    var list = json['Followed_Report'] as List;
    List<FollowedReport> productsList =
        list.map((i) => FollowedReport.fromJson(i)).toList();

    return ReportData(
        Report: ReportDetailedData.fromJson(json['Report']),
        Farmer: FarmerReport.fromJson(json['Farmer']),
        Followed_Report: productsList);
  }
}

class FarmerReport {
  String id;
  String farmer_name;
  String mobile_no;
  String farm_address;
  String lattitude;
  String longitude;
  FarmerCrop Farmer_Crop;

  FarmerReport(
      {this.id,
      this.farmer_name,
      this.mobile_no,
      this.farm_address,
      this.lattitude,
      this.longitude,
      this.Farmer_Crop});

  factory FarmerReport.fromJson(Map<String, dynamic> json) {
    return FarmerReport(
        id: json['id'],
        farmer_name: json['farmer_name'],
        mobile_no: json['mobile_no'],
        farm_address: json['farm_address'],
        lattitude: json['lattitude'],
        longitude: json['longitude'],
        Farmer_Crop: FarmerCrop.fromJson(json['Farmer_Crop']));
  }
}

class FarmerCrop {
  String id;
  String crop;
  String crop_age;
  String crop_picture;
  String farmer_id;

  FarmerCrop(
      {this.id, this.crop, this.crop_picture, this.farmer_id, this.crop_age});

  factory FarmerCrop.fromJson(Map<String, dynamic> json) {
    return FarmerCrop(
      id: json['id'],
      crop: json['crop'],
      crop_picture: json['crop_picture'],
      farmer_id: json['farmer_id'],
      crop_age: json['crop_age'],
    );
  }
}

class ReportDetailedData {
  String id;
  String reporter_id;
  String farmer_id;
  String diagnosis;
  String solution;
  String summary;
  String date;
  String next_follow_date;

  ReportDetailedData({
    this.id,
    this.reporter_id,
    this.farmer_id,
    this.diagnosis,
    this.solution,
    this.summary,
    this.date,
    this.next_follow_date,
  });

  factory ReportDetailedData.fromJson(Map<String, dynamic> json) {
    return ReportDetailedData(
        id: json['id'],
        reporter_id: json['reporter_id'],
        farmer_id: json['farmer_id'],
        diagnosis: json['diagnosis'],
        solution: json['solution'],
        summary: json['summary'],
        date: json['date'],
        next_follow_date: json['next_follow_date']);
  }
}

class FollowedReport {
  String id;
  String report_id;
  String feedback;
  String reason;
  String recommendation;
  String followed_suggetion;
  String next_followed_date;
  String next_followup_date;
  ReportDetailedData Report;

  FollowedReport({
    this.id,
    this.report_id,
    this.feedback,
    this.reason,
    this.recommendation,
    this.followed_suggetion,
    this.next_followed_date,
    this.next_followup_date,
  });

  factory FollowedReport.fromJson(Map<String, dynamic> json) {
    return FollowedReport(
      id: json['id'],
      report_id: json['report_id'],
      feedback: json['feedback'],
      reason: json['reason'],
      recommendation: json['recommendation'],
      followed_suggetion: json['followed_suggetion'],
      next_followed_date: json['next_followed_date'],
      next_followup_date: json['next_followup_date'],
    );
  }
}
