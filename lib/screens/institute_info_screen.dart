import 'package:course_finder_admin/screens/edit_institute_info_screen.dart';
import 'package:course_finder_admin/services/network_handler.dart';
import 'package:course_finder_admin/utilities/constants.dart';
import 'package:course_finder_admin/utilities/custom_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class InstituteInfoScreen extends StatefulWidget{

  @override
  _InstituteInfoScreenState createState() {
    return _InstituteInfoScreenState();
  }

}

class _InstituteInfoScreenState extends State<InstituteInfoScreen>{

  Future _instituteInfo;
  int _collegeId = 1;
  NetworkHandler _networkHandler;
  Map<dynamic,dynamic> _result;

  TextStyle _categoryStyle = TextStyle(
    fontFamily: kQuicksand,
    fontSize: 25.0,
    fontWeight: FontWeight.bold,
  );

  @override
  void initState() {
    super.initState();
    _networkHandler = NetworkHandler();
    _instituteInfo = _getInstituteInfo(_collegeId);
  }

  Future _getInstituteInfo(int collegeId) async{
    return await _networkHandler.getInstituteDetails(collegeId.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        isExtended: true,
        shape: StadiumBorder(),
        backgroundColor: Colors.white,
        icon: Icon(
          AntDesign.edit,
          color: Theme.of(context).accentColor,
        ),
        label: Text(
          'Edit',
          style: _categoryStyle.copyWith(
            fontSize: 20.0,
            color: Theme.of(context).accentColor,
          ),
        ),
        onPressed: ()async{
          Map<dynamic,dynamic> res = await Navigator.push(context, MaterialPageRoute(builder: (context) => EditInstituteInfoScreen(instituteInfo: _result,)));
          if(res != null){
            if(!res[kError]){
              _instituteInfo = _getInstituteInfo(_collegeId);
              Scaffold.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: Colors.green,
                    content: Row(
                      children: <Widget>[
                        Icon(AntDesign.check),
                        SizedBox(width:10.0),
                        Text('Details Changed'),
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
          }
        },
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(6.0),
        child: FutureBuilder(
          future: _instituteInfo,
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
                crossAxisAlignment: CrossAxisAlignment.center,
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

             _result = snapshot.data;

            return Card(
              child: Column(
                children: <Widget>[
                  InstituteInfoTile(
                    icon: MaterialCommunityIcons.city_variant_outline,
                    label: 'Institute Name',
                    text: _result[kCollegeName],
                  ),
                  InstituteInfoTile(
                    icon: SimpleLineIcons.location_pin,
                    label: 'Location',
                    text: kCollegeLocation,
                  ),
                  InstituteInfoTile(
                    icon: AntDesign.filetext1,
                    label: 'Type of Institute',
                    text: _result[kType],
                  ),
                  InstituteInfoTile(
                    icon: MaterialCommunityIcons.home_city_outline,
                    label: 'Ownership',
                    text: _result[kOwner],
                  ),
                  InstituteInfoTile(
                    icon: AntDesign.clockcircleo,
                    label: 'Established Year',
                    text: _result[kEstdYear].toString(),
                  ),
                  InstituteInfoTile(
                    icon: Icons.person_outline,
                    label: 'Number of Faculty',
                    text: _result[kTotalFaculty].toString(),
                  ),
                  InstituteInfoTile(
                    icon: MaterialCommunityIcons.circle_edit_outline,
                    label: 'No of Programmes',
                    text: _result[kCourseCount].toString(),
                  ),
                  InstituteInfoTile(
                    icon: AntDesign.infocirlceo,
                    label: 'About',
                    text: _result[kCollegeDes],
                    des: true,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

}