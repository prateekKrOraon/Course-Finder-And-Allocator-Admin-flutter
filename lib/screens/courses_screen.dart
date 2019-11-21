import 'package:course_finder_admin/services/network_handler.dart';
import 'package:course_finder_admin/utilities/constants.dart';
import 'package:course_finder_admin/utilities/custom_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

import 'add_course_screen.dart';

class CoursesScreen extends StatefulWidget{
  @override
  _CoursesScreenState createState() {
    return _CoursesScreenState();
  }
}

class _CoursesScreenState extends State<CoursesScreen>{

  Future _instituteCourses;
  NetworkHandler _networkHandler;
  int _collegeId = 1;

  TextStyle _categoryStyle = TextStyle(
    fontFamily: kQuicksand,
    fontSize: 25.0,
    fontWeight: FontWeight.bold,
  );

  @override
  void initState() {
    super.initState();
    _networkHandler = NetworkHandler();
    _instituteCourses = _getCourses(_collegeId);
  }

  Future _getCourses(int collegeId)async{
    return _networkHandler.getCourses(collegeId.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        isExtended: true,
        shape: StadiumBorder(),
        backgroundColor: Colors.white,
        icon: Icon(
          AntDesign.plus,
          color: Theme.of(context).accentColor,
        ),
        label: Text(
          'Add new course',
          style: _categoryStyle.copyWith(
            fontSize: 20.0,
            color: Theme.of(context).accentColor,
          ),
        ),
        onPressed: (){
          var reply = Navigator.push(context, MaterialPageRoute(builder: (context) => AddCourseScreen()));
          if(reply.toString() == kRefresh){
            Scaffold.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Colors.green,
                  content: Row(
                    children: <Widget>[
                      Icon(Icons.error_outline),
                      SizedBox(width:10.0),
                      Text('Course Added'),
                    ],
                  ),
                  duration: Duration(seconds: 3),
                  action: SnackBarAction(
                    label: "OK",
                    textColor: Colors.white,
                    onPressed: (){
                      //TODO
                    },
                  ),
                )
            );
          }
        },
      ),
      body: FutureBuilder(
        future: _instituteCourses,
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
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SizedBox(height: 25.0,),
                Icon(
                  MaterialCommunityIcons.wifi_strength_alert_outline,
                  size: 50.0,
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
            );
          }
          if(!snapshot.hasData){
            return Container(
              height: 50.0,
              width: double.infinity,
              child: CircularProgressIndicator(),
            );
          }

          List list = snapshot.data;

          List<CourseCard> resultList = [];

          for(Map item in list){
            resultList.add(
              CourseCard(
                courseName: item[kCourseName],
                fee: item[kCourseCost],
                duration: item[kCourseDuration],
                seats: item[kSeats].toString(),
                minQual: item[kMinQual],
                minAgg: item[kMinAgg],
                about: item[kCourseDetail],
              ),
            );
          }

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
              padding: EdgeInsets.only(bottom: 50.0),
              itemCount: resultList.length,
              itemBuilder: (BuildContext context,int index){
                return resultList[index];
              },
            ),
          );
        },
      )
    );
  }
}