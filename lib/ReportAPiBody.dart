class ReportApiBody {
  final String reporter_id;
  final String limit;
  final String offset;
  final bool sortByFollowUpDate;

  ReportApiBody({this.limit, this.offset, this.reporter_id, this.sortByFollowUpDate});

  Map<String, dynamic> toJson() =>
      {'limit': limit, 'offset': offset, 'reporter_id': reporter_id, 'sortByFollowUpDate':sortByFollowUpDate};
}
