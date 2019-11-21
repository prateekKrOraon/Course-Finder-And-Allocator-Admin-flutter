import 'package:course_finder_admin/services/network_handler.dart';
import 'package:course_finder_admin/utilities/constants.dart';
import 'package:course_finder_admin/utilities/custom_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class EditInstituteInfoScreen extends StatefulWidget{

  EditInstituteInfoScreen({this.instituteInfo});
  final Map<dynamic,dynamic> instituteInfo;

  @override
  _EditInstituteInfoScreenState createState() {
    return _EditInstituteInfoScreenState();
  }
}

class _EditInstituteInfoScreenState extends State<EditInstituteInfoScreen>{

  double minYear = 1900;
  double maxYear = DateTime.now().year.toDouble();
  Map<dynamic,dynamic> _instituteInfo;

  String _instituteName;
  int _collegeId;
  String _location;
  String _type;
  String _ownership;
  double _year;
  double _facultyCount;
  String _about;
  bool _showIndicator;

  NetworkHandler networkHandler;

  @override
  void initState() {
    super.initState();
    _instituteInfo = widget.instituteInfo;
    _collegeId = _instituteInfo[kCollegeId].toInt();
    _instituteName = _instituteInfo[kCollegeName].toString();
    _location = _instituteInfo[kCollegeLocation].toString();
    _type = _instituteInfo[kType].toString();
    _ownership = _instituteInfo[kOwner].toString();
    _year = _instituteInfo[kEstdYear].toDouble();
    _facultyCount = _instituteInfo[kTotalFaculty].toDouble();
    _about = _instituteInfo[kCollegeDes].toString();
    _showIndicator = false;
    networkHandler = NetworkHandler();
  }

  Future _changeDetails(String collegeId)async{
    return await networkHandler.getCourses(collegeId.toString());
  }

  @override
  Widget build(BuildContext context) {

    final TextStyle textStyle = TextStyle(
      fontFamily: kQuicksand,
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
      color: Theme.of(context).accentColor,
    );

    return Scaffold(
      body: SafeArea(
        child: ModalProgressHUD(
          inAsyncCall: _showIndicator,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[

                  Padding(
                    padding: const EdgeInsets.symmetric(vertical:20.0),
                    child: Text(
                      'Edit Details',
                      style: TextStyle(
                        fontFamily: kStaleMate,
                        fontSize: 50.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  CustomTextField(
                    labelText: 'Institute Name',
                    hintText: _instituteName,
                    onSubmitted: (String value){
                      _instituteName = value;
                    },
                  ),
                  CustomTextField(
                    labelText: 'Location',
                    hintText: _location,
                    onSubmitted: (String value){
                      _location = value;
                    },
                  ),
                  CustomTextField(
                    labelText: 'Type of Institute',
                    hintText: _type,
                    onSubmitted: (String value){
                      _type = value;
                    },
                  ),
                  CustomTextField(
                    labelText: 'Owenership',
                    hintText: _ownership,
                    onSubmitted: (String value){
                      _ownership = value;
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 16.0,horizontal: 16.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                          border: Border.all(
                            color: Theme.of(context).accentColor,
                            width: 1.0,
                          )
                        ),
                        child: Row(
                          children: <Widget>[
                            Text(
                              'Estd. Year :',
                              style: textStyle,
                            ),
                            SizedBox(width: 10.0,),
                            Text(
                              _year.toInt().toString(),
                              style: textStyle.copyWith(
                                color: Colors.black
                              ),
                            ),
                          ],
                        ),
                      ),
                      onTap: (){
                        showDialog(
                          context: context,
                          builder: (BuildContext context){
                            return ShowDialog(
                              value: _year,
                              min: minYear,
                              max: maxYear,
                              division: (maxYear - minYear).toInt(),
                            );
                          }
                        ).then((returnVal)async{

                          if(returnVal != null){
                            setState(() {
                              _year = returnVal;
                            });
                          }
                        });
                      },
                    ),
                  ),
                  SizedBox(height: 10.0,),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 16.0,horizontal: 16.0),
                        decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.all(Radius.circular(4)),
                            border: Border.all(
                              color: Theme.of(context).accentColor,
                              width: 1.0,
                            )
                        ),
                        child: Row(
                          children: <Widget>[
                            Text(
                              'Faculty Count:',
                              style: textStyle,
                            ),
                            SizedBox(width: 10.0,),
                            Text(
                              _facultyCount.toInt().toString(),
                              style: textStyle.copyWith(
                                  color: Colors.black
                              ),
                            ),
                          ],
                        ),
                      ),
                      onTap: (){
                        showDialog(
                            context: context,
                            builder: (BuildContext context){
                              return ShowDialog(
                                value: 0,
                                max: 1000,
                                min: 0,
                                division: 1000,
                              );
                            }
                        ).then((returnVal)async{

                          if(returnVal != null){
                            setState(() {
                              _facultyCount = returnVal;
                            });
                          }
                        });
                      },
                    ),
                  ),
                  CustomTextField(
                    labelText: 'About',
                    hintText: _about,
                    onSubmitted: (String value){
                      _about = value;
                    },
                    minLines: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical:30.0),
                    child: FloatingActionButton.extended(
                      elevation: 1.0,
                      isExtended: true,
                      shape: StadiumBorder(),
                      backgroundColor: Colors.white,
                      icon: Icon(
                        AntDesign.edit,
                        color: Theme.of(context).accentColor,
                      ),
                      label: Text(
                        'Confirm Changes',
                        style: TextStyle(
                          fontFamily: kQuicksand,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).accentColor,
                        ),
                      ),
                      onPressed: () async{
                        setState(() {
                          _showIndicator = true;
                        });
                        Map<dynamic,dynamic> response = await networkHandler
                            .editInstituteDetails(
                            _collegeId.toString(),
                            _instituteName,
                            _location,
                            _about,
                            _type,
                            _facultyCount.toString(),
                            _ownership,
                            _year.toString(),
                        );
                        if(!response[kError]){
                          setState(() {
                            _showIndicator = false;
                          });
                          Navigator.pop(context,response);
                        }else{
                          Scaffold.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: Colors.red,
                              content: Row(
                                children: <Widget>[
                                  Icon(Icons.error_outline),
                                  SizedBox(width:10.0),
                                  Text(response[kMessage].toString()),
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
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}