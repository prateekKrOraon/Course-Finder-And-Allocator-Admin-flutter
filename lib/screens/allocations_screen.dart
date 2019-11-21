import 'package:course_finder_admin/screens/students_list.dart';
import 'package:course_finder_admin/services/network_handler.dart';
import 'package:course_finder_admin/utilities/constants.dart';
import 'package:course_finder_admin/utilities/custom_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class AllocationsScreen extends StatefulWidget{

  AllocationsScreen({this.collegeId});
  final int collegeId;

  @override
  _AllocationsScreenState createState() {
    return _AllocationsScreenState(collegeId: collegeId);
  }

}

class _AllocationsScreenState extends State<AllocationsScreen>{

  _AllocationsScreenState({this.collegeId});
  final int collegeId;

  Future _allocationDetails;

  NetworkHandler _networkHandler;

  @override
  void initState() {
    super.initState();
    _networkHandler = NetworkHandler();
    _allocationDetails = _getAllocationDetails();
  }

  Future _getAllocationDetails()async{
    return await _networkHandler.getAllocationDetails(collegeId.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _allocationDetails,
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

          Map<dynamic,dynamic> response = snapshot.data;

          List<AllocationCard> resultList = [];

          List<Map<String,dynamic>> listOfStudents = [];
          response.forEach(
              (key,value){
                var res = value as List;
                resultList.add(
                  AllocationCard(
                    courseName: key.toString(),
                    count: res.length.toString(),
                    onPressed: (){
                      if(res.isNotEmpty)
                        Navigator.push(context, MaterialPageRoute(builder: (context) => StudentsList(key.toString(),res)));
                      else{
                        Scaffold.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: Colors.red,
                            content: Row(
                              children: <Widget>[
                                Text('No Allocated Students'),
                              ],
                            ),

                          )
                        );
                      }
                      //TODO value bhejna hai
                    },
                  ),
                );
              }
          );

          return Padding(
            padding: EdgeInsets.all(5.0),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: resultList.length,
              itemBuilder: (context,index){
                return resultList[index];
              },
            ),
          );
        },
      ),
    );
  }
}