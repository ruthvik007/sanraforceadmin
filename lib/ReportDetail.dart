import 'package:flutter/material.dart';
import 'ProductBody.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'ReportBody.dart';
import 'FieldReports.dart';

class ReportDetail extends StatelessWidget {
  ReportData reportItem;
  static String productName;

  ReportDetail({Key key, @required this.reportItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new WillPopScope(
      onWillPop: () {
        _onWillPop(context);
      },
      child: new Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: const Text(
            'Report Detail',
          ),
        ),
        // floatingActionButton: floating_button,
        backgroundColor: Colors.white,
        body: getDisplayWidet(reportItem, context),
      ),
    );
  }

  final logo = Hero(
    tag: 'hero',
    child: CircleAvatar(
      backgroundColor: Colors.transparent,
      radius: 48.0,
      child: Icon(Icons.dashboard),
    ),
  );

  /* final floating_button = new FloatingActionButton(
    backgroundColor: Colors.green,
    child: const Icon(Icons.arrow_back),
    onPressed: () {},
  );
*/

  String getLineCharacter(int k, int length) {
    if (k == length - 1) {
      return "";
    } else {
      return "\n\n";
    }
  }

  Widget getHeaderImage(String url) {
    var image;
    if (url != null && url.isNotEmpty) {
      image = new CachedNetworkImage(
        imageUrl: url,
        width: 100.0,
        height: 100.0,
          placeholder: (context, progressText) => Center(child: CircularProgressIndicator()));

      return image;
    } else {
      return new Text('');
    }
  }

  Widget getDisplayWidet(ReportData reportItem, BuildContext context) {
    return new ListView(
      children: <Widget>[
        _getReportSection(context),
        getFollowedReportTitle(),
        new ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (BuildContext context, int Index) {
            return _buildFollowReport(context, Index);
          },
          itemCount: reportItem.Followed_Report.length,
        )
      ],
    );
  }

  Widget getRowDispplayWidet(String key, String value) {
    if (value != null && value.isNotEmpty) {
      return Container(
        child: new Column(
          children: <Widget>[
            new Container(
              child: new Text(
                value,
                textAlign: TextAlign.left,
                style: new TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.normal,
                    fontSize: 16),
              ),
            ),
          ],
        ),
      );
    } else {
      return new Column(
        children: <Widget>[
          new Container(
            child: new Text(
              key,
              textAlign: TextAlign.left,
              style: new TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                  fontSize: 16),
            ),
          )
        ],
      );
    }
  }

  Widget getLargeRowDispplayWidet(
      String key, String value, BuildContext localContext) {
    if (value != null && value.isNotEmpty) {
      return new Container(
        child: new Text(
          value,
          textAlign: TextAlign.left,
          style: new TextStyle(
              color: Colors.black, fontWeight: FontWeight.normal, fontSize: 16),
        ),
        width: 350,
        constraints: BoxConstraints(
          minHeight: 50,
        ),
      );
    } else {
      return new Container(
        child: new Text(
          key,
          textAlign: TextAlign.left,
          style: new TextStyle(
              color: Colors.black, fontWeight: FontWeight.normal, fontSize: 16),
        ),
        width: 350,
        constraints: BoxConstraints(
          minHeight: 50,
        ),
      );
    }
  }

  Widget _getReportSection(BuildContext localContext) {
    return new Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
      new Padding(
        padding: EdgeInsets.fromLTRB(15, 20, 15, 5),
        child: new Text(
          "Report Details",
          style: new TextStyle(
              fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black),
        ),
      ),
      new Padding(
        padding: EdgeInsets.fromLTRB(
          15,
          15,
          15,
          15,
        ),
        child: new Card(
          elevation: 1.5,
          child: new Padding(
            padding: EdgeInsets.fromLTRB(15, 20, 15, 15),
            child: new Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                new Padding(
                  padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      //getImage(reportItem.Farmer.Farmer_Crop.crop_picture),
                      new Padding(
                        padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                        child: new Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            new Text(
                              reportItem.Farmer.farmer_name,
                              style: new TextStyle(
                                  fontSize: 16, color: Colors.black),
                              textAlign: TextAlign.left,
                            ),
                            new SizedBox(
                              height: 10,
                            ),
                            new Text(
                              reportItem.Farmer.mobile_no,
                              style: new TextStyle(
                                  fontSize: 16, color: Colors.black),
                              textAlign: TextAlign.left,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                new SizedBox(
                  height: 10,
                ),
                Divider(
                  height: 20,
                  color: Colors.black,
                ),
                new SizedBox(
                  height: 35,
                ),
                new Padding(
                  padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      new Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          new Text(
                            "Report Date",
                            style: new TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          new SizedBox(
                            height: 10,
                          ),
                          getRowDispplayWidet(
                              "Report Date", reportItem.Report.date),
                        ],
                      ),
                      new Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          new Text(
                            "Next Follow-up Date",
                            style: new TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          new SizedBox(
                            height: 10,
                          ),
                          getRowDispplayWidet("Next Follow-up Date",
                              reportItem.Report.next_follow_date),
                        ],
                      ),
                    ],
                  ),
                ),
                new SizedBox(
                  height: 20,
                ),
                new Padding(
                  padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                  child: new Container(
                    child: new Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        new Text(
                          "Crop Name",
                          textAlign: TextAlign.left,
                          softWrap: true,
                          style: new TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        new SizedBox(
                          height: 10,
                        ),
                        /*getLargeRowDispplayWidet("Crop Name",
                            reportItem.Farmer.Farmer_Crop.crop, localContext),*/
                      ],
                    ),
                  ),
                ),
                new SizedBox(
                  height: 20,
                ),
                new Padding(
                    padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                    child: new Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        new Text(
                          "Crop Age",
                          textAlign: TextAlign.left,
                          softWrap: true,
                          style: new TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        new SizedBox(
                          height: 10,
                        ),
                        getLargeRowDispplayWidet(
                            "Crop Age",
                            reportItem.Farmer.Farmer_Crop.crop_age,
                            localContext),
                      ],
                    )),
                new SizedBox(
                  height: 20,
                ),
                new Padding(
                  padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                  child: new Container(
                    alignment: Alignment(-1.0, 00),
                    child: new Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        new Text(
                          "Farm Address",
                          textAlign: TextAlign.left,
                          softWrap: true,
                          style: new TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        new SizedBox(
                          height: 10,
                        ),
                        getLargeRowDispplayWidet("Farm Address",
                            reportItem.Farmer.farm_address, localContext),
                      ],
                    ),
                  ),
                ),
                new SizedBox(
                  height: 20,
                ),
                new Padding(
                  padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                  child: new Container(
                      alignment: Alignment(-1.0, 00),
                      child: new Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          new Text(
                            "Diagnosis",
                            softWrap: true,
                            style: new TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          new SizedBox(
                            height: 10,
                          ),
                          getLargeRowDispplayWidet("Diagnosis",
                              reportItem.Report.diagnosis, localContext),
                        ],
                      )),
                ),
                new SizedBox(
                  height: 20,
                ),
                new Padding(
                  padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                  child: new Container(
                      alignment: Alignment(-1.0, 00),
                      child: new Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          new Text(
                            "Solution",
                            softWrap: true,
                            textAlign: TextAlign.left,
                            style: new TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          new SizedBox(
                            height: 10,
                          ),
                          getLargeRowDispplayWidet("Solution",
                              reportItem.Report.solution, localContext),
                        ],
                      )),
                ),
                new SizedBox(
                  height: 20,
                ),
                new Padding(
                  padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                  child: new Container(
                      alignment: Alignment(-1.0, 00),
                      child: new Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          new Text(
                            "Summary",
                            softWrap: true,
                            style: new TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          new SizedBox(
                            height: 10,
                          ),
                          getLargeRowDispplayWidet("Summary",
                              reportItem.Report.summary, localContext),
                        ],
                      )),
                ),
                new SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    ]);
  }

  Widget getImage(String imUrl) {
    var image;
    if (imUrl != null && imUrl.isNotEmpty) {
      image = new CachedNetworkImage(
        imageUrl: imUrl,
        width: 100.0,
        height: 100.0,
        placeholder: (context, progressText) => Center(child: CircularProgressIndicator()),
      );
    } else {
      var assetImage = new AssetImage('assets/logo.png');
      image = new Image(
        image: assetImage,
        width: 100.0,
        height: 100.0,
      );
    }
    return image;
  }

  Widget _buildFollowReport(BuildContext context, int index) {
    FollowedReport localReport = reportItem.Followed_Report[index];
    return new Padding(
      padding: EdgeInsets.fromLTRB(15, 15, 15, 5),
      child: new Card(
        elevation: 1.5,
        child: new Padding(
          padding: EdgeInsets.fromLTRB(15, 25, 15, 15),
          child: new Container(
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Padding(
                  padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      new Container(
                        alignment: Alignment(-1.0, 00),
                        child: new Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            new Text(
                              "Followed Date",
                              style: new TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            new SizedBox(
                              height: 10,
                            ),
                            getRowDispplayWidet("Followed Date",
                                localReport.next_followed_date),
                          ],
                        ),
                      ),
                      new Container(
                        child: new Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            new Text(
                              "Next Follow-Up Date",
                              style: new TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            new SizedBox(
                              height: 10,
                            ),
                            getRowDispplayWidet("Next Follow-Up Date",
                                localReport.next_followup_date),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                new SizedBox(
                  height: 20,
                ),
                new Padding(
                  padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      new Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          new Text(
                            "Feedback",
                            style: new TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          new SizedBox(
                            height: 10,
                          ),
                          getRowDispplayWidet("Feedback", localReport.feedback),
                        ],
                      ),
                      new Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          new Text(
                            "Followed Sugestion",
                            style: new TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          new SizedBox(
                            height: 10,
                          ),
                          getRowDispplayWidet(
                              "Followed Sugestion",
                              getFollowedSuggestionValue(
                                  localReport.followed_suggetion)),
                        ],
                      ),
                    ],
                  ),
                ),
                new SizedBox(
                  height: 20,
                ),
                new Padding(
                  padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new Text(
                        "Reason",
                        textAlign: TextAlign.left,
                        softWrap: true,
                        style: new TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      new SizedBox(
                        height: 10,
                      ),
                      getLargeRowDispplayWidet(
                          "Reason", localReport.reason, context),
                    ],
                  ),
                ),
                new Padding(
                  padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new Text(
                        "Recommendation",
                        textAlign: TextAlign.left,
                        softWrap: true,
                        style: new TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      new SizedBox(
                        height: 10,
                      ),
                      getLargeRowDispplayWidet("Recommendation",
                          localReport.recommendation, context),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _getFollowedReportSection(BuildContext context) {
    return new Container(
        child: new Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: ListView.builder(
              shrinkWrap: true,
              itemBuilder: _buildFollowReport,
              itemCount: reportItem.Followed_Report.length,
            )));
  }

  Widget getFollowedReportTitle() {
    if (reportItem != null &&
        reportItem.Followed_Report != null &&
        reportItem.Followed_Report.length > 0) {
      return new Text(
        "Followed Reports",
        textAlign: TextAlign.center,
        style: new TextStyle(
            color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
      );
    } else {
      return new Text("");
    }
  }

  Future<bool> _onWillPop(BuildContext localContext) {
    Navigator.of(localContext).pushReplacement(
        MaterialPageRoute(builder: (context) => FieldReports()));
  }

  String getFollowedSuggestionValue(String followed_suggetion) {
    if ("true" == followed_suggetion.toLowerCase()) {
      return "Yes";
    } else if ("false" == followed_suggetion.toLowerCase()) {
      return "No";
    }
  }
}
