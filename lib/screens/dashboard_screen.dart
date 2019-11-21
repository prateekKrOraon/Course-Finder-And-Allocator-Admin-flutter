import 'package:course_finder_admin/services/network_handler.dart';
import 'package:course_finder_admin/utilities/constants.dart';
import 'package:course_finder_admin/utilities/custom_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class Dashboard extends StatefulWidget{
  @override
  _DashboardState createState() {
    return _DashboardState();
  }

}

class _DashboardState extends State<Dashboard>{


  Future _dashboardElements;
  int _collegeId =1;
  NetworkHandler _networkHandler;

  @override
  void initState() {
    super.initState();
    _networkHandler = NetworkHandler();
    _dashboardElements = getDashboard(_collegeId);
  }

  Future getDashboard(int collegeId)async{
    return await _networkHandler.getDashboard(collegeId.toString());
  }

  @override
  Widget build(BuildContext context) {


    TextStyle _categoryStyle = TextStyle(
      fontFamily: kQuicksand,
      fontSize: 25.0,
      fontWeight: FontWeight.bold,
    );

//    List _courseItems = <DashboardCard>[
//      DashboardCard(
//        header: 'CSE',
//        contentMain: '42',
//        contentSub: 'Students',
//      ),
//      DashboardCard(
//        header: 'EEE',
//        contentMain: '27',
//        contentSub: 'Students',
//      ),
//      DashboardCard(
//        header: 'ECE',
//        contentMain: '29',
//        contentSub: 'Students',
//      )
//    ];

    return SingleChildScrollView(
      child: FutureBuilder(
        future: _dashboardElements,
        builder: (BuildContext context, snapshot){

          if(snapshot.connectionState == ConnectionState.waiting){
            return Padding(
              padding: const EdgeInsets.only(top:20.0),
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
          if(snapshot.hasError){
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 25.0,),
                  Icon(
                    MaterialCommunityIcons.wifi_strength_alert_outline,
                    size: 70.0,
                    color: Theme.of(context).accentColor,
                  ),
                  SizedBox(width:20.0),
                  Text(
                    'Internet connection not available',
                    style: TextStyle(
                      fontFamily: kQuicksand,
                      fontSize: 30.0,
                    ),
                  ),
                ],
              ),
            );
          }
          if(!snapshot.hasData){
            return Container(
              height: 50.0,
              width: double.infinity,
              child: CircularProgressIndicator(),
            );
          }

          Map result = snapshot.data;

          List _gridItems = <DashboardCard>[
            DashboardCard(
              header: 'Your Courses',
              contentMain: result[kTotalCourses].toString(),
              contentSub: 'Courses',
            ),
            DashboardCard(
              header: 'Total Allocation',
              contentMain: result[kTotalAllocation].toString(),
              contentSub: 'Students',
            )
          ];

          Map courses = result[kCourses];

          List<DashboardCard> courseItems = [];
          courses.forEach(
              (key,value){
                courseItems.add(
                  DashboardCard(
                    header: key.toString(),
                    contentMain: value.toString(),
                    contentSub: 'Students',
                  ),
                );
              }
          );

          return Container(
            color: Colors.grey[100],
            padding: EdgeInsets.symmetric(horizontal: 5.0,vertical: 5.0,),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    'Quick Facts',
                    style: _categoryStyle,
                  ),
                ),
                GridView.builder(
                  controller: ScrollController(
                      keepScrollOffset: false
                  ),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: 1.2),
                  itemCount: _gridItems.length,
                  itemBuilder: (BuildContext context, int index) {
                    return _gridItems[index];
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    'Course Wise Statistic',
                    style: _categoryStyle,
                  ),
                ),
                ListView.builder(
                  controller: ScrollController(
                      keepScrollOffset: false
                  ),
                  shrinkWrap: true,
                  itemCount: courseItems.length,
                  itemBuilder: (BuildContext context,int index){
                    return courseItems[index];
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }

}