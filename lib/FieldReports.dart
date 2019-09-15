import 'package:flutter/material.dart';
import 'dart:async';
import 'package:async/async.dart';
import 'dart:convert';
import 'ProductAPiBody.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'ProductBody.dart';
import 'ReportBody.dart';
import 'ReportAPiBody.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'ReportDetail.dart';
import 'SignUpResponse.dart';

const List<String> filter = ["Next FOllowed Date"];
const filter_next_followed_Date = 1;

class FieldReports extends StatelessWidget {
  var localContext;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    localContext = context;

    return Scaffold(
      backgroundColor: Colors.white,
      body: MyFieldReport(),
    );
  }
}

class MyFieldReport extends StatefulWidget {
  @override
  _MyFieldReportForm createState() => _MyFieldReportForm();
}

class _MyFieldReportForm extends State<MyFieldReport> {
  Future<List<ReportData>> listFuture;
  var myContext;

  @override
  Widget build(BuildContext context) {
    myContext = context;
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text(
          'Field Reports',
          textAlign: TextAlign.center,
        ),
      ),
      body: new FutureBuilder<List<ReportData>>(
        future: listFuture,
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);

          return snapshot.hasData
              ? getDisplayWidget(snapshot.data, context)
              : new Center(child: new CircularProgressIndicator());
        },
      ),
      floatingActionButton: new FloatingActionButton(
        child: new Icon(Icons.sort),
        backgroundColor: Colors.green,
        onPressed: () {
          _showDialog(myContext);
          /* Navigator.push(context,
              MaterialPageRoute(builder: (context) => FieldvisitForm()));*/
        },
      ),
    );
  }

  void _showToast(String msg) {
    print(msg);
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIos: 1,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  Future<List<ReportData>> fetchProducts(
      http.Client client, bool isSortRequired, bool isRefresh) async {
    print("entered api section");
    String limit = "1";
    String offset = "0";
    bool sortByFollowUpDate = isSortRequired;

    String reporter_id = await getReporterId();
    if (reporter_id == null || reporter_id.isEmpty) {
      reporter_id = "0";
    }

    ReportApiBody post = ReportApiBody(
        limit: limit,
        offset: offset,
        );
    print(jsonEncode(post));
    final response = await client.post(
        'http://in.atdrive.com:835/farms/WebServices/get_all_reports',
        body: jsonEncode(post));
    // Use the compute function to run parsePhotos in a separate isolate
    print("fetch prodcuts issued");
    print(response.statusCode);
    print(response.body);
    if (response != null && response.statusCode == 200) {


      final jsonResponse = json.decode(response.body);
      ReportBody reportBody = new ReportBody.fromJson(jsonResponse);
      List<ReportData> reportData = reportBody.data;
      print(
          "First Product Name displayed: " + reportData[0].Farmer.farmer_name);
      if (isRefresh) {
        Navigator.of(context, rootNavigator: true).pop();
      }
      return reportData;
    } else if (response != null && response.body != null) {
      if (isRefresh) {
        Navigator.of(context, rootNavigator: true).pop();
      }
      final jsonResponse = json.decode(response.body);
      SignUpResponse responseBody = new SignUpResponse.fromJson(jsonResponse);
      if (responseBody != null && responseBody.message != null) {
        _showToast(responseBody.message);
      }
      List<ReportData> localReportList = new List<ReportData>();
      return localReportList;
    } else {
      if (isRefresh) {
        Navigator.of(context, rootNavigator: true).pop();
      }
      _showToast("Report Fetch failed! Please try again");
    }

    return null;
  }

  Widget createListView(List<ReportData> list, BuildContext localContext) {
    var assetImage = new AssetImage('assets/logo.png');
    var image = new Image(
      image: assetImage,
      width: 100.0,
      height: 100.0,
    );

    print("list length is" + list.length.toString());
    print("list length is" + list.length.toString());
    return new ListView.builder(
        primary: true,
        itemCount: list.length,
        itemBuilder: (BuildContext ctxt, int Index) {
          return Center(
            child: GestureDetector(
                child: new Padding(
                  padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
                  child: SizedBox(
                    width: 1600,
                    child: new Card(
                      elevation: 1.5,
                      child: new Padding(
                        padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
                        child: new Wrap(direction: Axis.horizontal, children: <
                            Widget>[
                          new Column(
                            children: <Widget>[
                              new Row(
                                children: <Widget>[
                                  //getImage(list[Index]),
                                  Padding(
                                    padding:
                                        new EdgeInsets.fromLTRB(15, 0, 0, 0),
                                  ),
                                  new Column(
                                    children: <Widget>[getRow(list[Index])],
                                  ),
                                ],
                              ),
                              new Row(
                                children: <Widget>[
                                  Expanded(
                                      child: Divider(
                                    height: 20,
                                    color: Colors.black,
                                  )),
                                ],
                              ),
                              new Wrap(
                                direction: Axis.horizontal,
                                children: <Widget>[
                                  new GestureDetector(
                                    child: Padding(
                                      padding:
                                          new EdgeInsets.fromLTRB(0, 5, 10, 5),
                                      child: getRoundedText('Follow Up'),
                                    ),
                                    onTap: () {
                                      print(list[Index].Report.reporter_id);

                                    },
                                  ),
                                  new GestureDetector(
                                    child: Padding(
                                      padding:
                                          new EdgeInsets.fromLTRB(10, 5, 0, 5),
                                      child: getRoundedText('View Report'),
                                    ),
                                    onTap: () {
                                      Navigator.of(context).pushReplacement(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ReportDetail(
                                                      reportItem:
                                                          list[Index])));
                                    },
                                  )
                                ],
                              ),
                            ],
                          )
                        ]),
                      ),
                    ),
                  ),
                ),
                onTap: () {}),
          );
        });
  }

  Widget getRow(ReportData localObject) {
    return new Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        new Padding(
          padding: new EdgeInsets.fromLTRB(15.0, 7.0, 15.0, 0.0),
          child: new Text(
            (localObject != null && localObject.Farmer != null)
                ? localObject.Farmer.farmer_name.toString()
                : "Farmer Name",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        new Padding(
          padding: new EdgeInsets.fromLTRB(15.0, 7.0, 15.0, 0.0),
          child: new Text(
            (localObject != null && localObject.Farmer != null)
                ? localObject.Farmer.mobile_no.toString()
                : "9999999999",
            style: TextStyle(fontWeight: FontWeight.normal),
          ),
        ),
        new Padding(
          padding: new EdgeInsets.fromLTRB(15.0, 7.0, 15.0, 0.0),
          child: new Text(
            (localObject != null &&
                    localObject.Report != null &&
                    localObject.Report.next_follow_date != null)
                ? localObject.Report.next_follow_date.toString()
                : "Follow Date : -----",
          ),
        ),
      ],
    );
  }

  Future<String> getReporterId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.get('user_id');
  }

  /*Widget getImage(ReportData list) {
    var image;
    if (list.Farmer != null &&
        list.Farmer.Farmer_Crop != null &&
        list.Farmer.Farmer_Crop.crop_picture != null &&
        list.Farmer.Farmer_Crop.crop_picture.isNotEmpty) {
      image = new CachedNetworkImage(
        imageUrl: list.Farmer.Farmer_Crop.crop_picture,
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
*/
  Widget getRoundedText(String buttonName) {
    return new Container(
      child: new Text(
        buttonName,
        style: new TextStyle(
            color: Colors.white, fontWeight: FontWeight.w900, fontSize: 12),
        textAlign: TextAlign.center,
        overflow: TextOverflow.ellipsis,
      ),
      decoration: new BoxDecoration(
          borderRadius: new BorderRadius.all(new Radius.circular(10.0)),
          color: Colors.green),
      padding: new EdgeInsets.fromLTRB(14.0, 10.0, 14.0, 10.0),
    );
  }

  void _showDialog(BuildContext localcontext) {
    // flutter defined function
    showDialog(
      context: localcontext,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text(
            "Filter By",
            textAlign: TextAlign.center,
          ),
          content: new Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              new GestureDetector(
                child: new Text(
                  'Next Followed Date',
                  style: new TextStyle(fontSize: 16.0),
                ),
                onTap: () {
                  Navigator.pop(context);
                  setState(() {
                    _showProgressDialog(myContext);
                    refreshList(myContext);
                  });
                },
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        );
      },
    );
  }

  void refreshList(BuildContext myContext) {
    listFuture = fetchProducts(new http.Client(), true, true);
  }

  @override
  void initState() {
    super.initState();
    print("init is called");
    if (listFuture == null) {
      listFuture = fetchProducts(new http.Client(), false, false);
    }
  }

  void _showProgressDialog(BuildContext localcontext) {
    // flutter defined function
    showDialog(
      context: localcontext,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          content: new Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              new Text("Loading..."),
              SizedBox(
                height: 20,
              ),
              new CircularProgressIndicator(),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        );
      },
    );
  }

  Widget getDisplayWidget(
      List<ReportData> localList, BuildContext localContext) {
    if (localList != null && localList.length > 0) {
      return createListView(localList, localContext);
    } else {
      return new Scaffold(
        body: new Center(
          child: new Text(
            "No reports to show",
            style: TextStyle(fontSize: 18, fontStyle: FontStyle.normal),
          ),
        ),
      );
    }
  }
}
