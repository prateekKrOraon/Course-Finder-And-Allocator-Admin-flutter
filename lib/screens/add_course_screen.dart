import 'package:course_finder_admin/services/network_handler.dart';
import 'package:course_finder_admin/utilities/constants.dart';
import 'package:course_finder_admin/utilities/custom_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class AddCourseScreen extends StatefulWidget{

  AddCourseScreen({this.collegeId});
  int collegeId;
  @override
  _AddCourseScreenState createState() {
    return _AddCourseScreenState();
  }
}

class _AddCourseScreenState extends State<AddCourseScreen>{

  int _collegeId;
  double _seats = 30;
  String _courseName;
  String _duration;
  String _fee;
  String _minAgg;
  String _minQual;
  String _feeType;
  String _aboutCourse;
  bool _showIndicator = false;

  NetworkHandler _networkHandler;

  @override
  void initState() {
    super.initState();
    _collegeId = widget.collegeId;
    _networkHandler = NetworkHandler();
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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical:20.0),
                    child: Text(
                      'Add Course',
                      style: TextStyle(
                        fontFamily: kStaleMate,
                        fontSize: 50.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  CustomTextField(
                    labelText: 'Course Name',
                    onSubmitted: (String value){
                      _courseName = value;
                    },
                  ),
                  CustomTextField(
                    labelText: 'Duration',
                    onSubmitted: (String value){
                      _duration = value;
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
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
                            'Fee :',
                            style: textStyle,
                          ),
                          SizedBox(width: 10.0,),
//                          Text(
//                            _facultyCount.toInt().toString(),
//                            style: textStyle.copyWith(
//                                color: Colors.black
//                            ),
//                          ),
                          Expanded(
                            child: TextField(
                              cursorColor: Theme.of(context).accentColor,
                              enableInteractiveSelection: true,
                              cursorWidth: 1.0,
                              style: TextStyle(
                                fontFamily: kQuicksand,
                                fontSize: 20.0,
                                fontWeight: FontWeight.normal,
                              ),
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(0.0),
                                hintText: 'Input Amount',
                                hintStyle: TextStyle(
                                  color: Theme.of(context).accentColor,
                                  fontFamily: kQuicksand,
                                ),
                                border: InputBorder.none,
                              ),
                              onSubmitted: (String value){
                                _fee = value + _feeType;
                              },
                            ),
                          ),
                          DropdownButton(
                            hint: Text(
                              'Click here',
                              style: TextStyle(
                                fontFamily: kQuicksand
                              ),
                            ),
                            items: <DropdownMenuItem>[
                              DropdownMenuItem(
                                value: 'Thousands',
                                child: Text(
                                  'Thousands',
                                  style: TextStyle(
                                    fontFamily: kQuicksand,
                                  ),
                                ),
                              ),
                              DropdownMenuItem(
                                value: 'Lakhs',
                                child: Text(
                                  'Lakhs',
                                  style: TextStyle(
                                    fontFamily: kQuicksand,
                                  ),
                                ),
                              ),
                            ],
                            onChanged: (value){
                              setState(() {
                                _fee = value + _feeType;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ),//TODO kuch ar sochna hai
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
                              'Seats :',
                              style: textStyle,
                            ),
                            SizedBox(width: 10.0,),
//                          Text(
//                            _facultyCount.toInt().toString(),
//                            style: textStyle.copyWith(
//                                color: Colors.black
//                            ),
//                          ),
                          ],
                        ),
                      ),
                      onTap: (){
                        showDialog(
                            context: context,
                            builder: (BuildContext context){
                              return ShowDialog(
                                value: _seats,
                                max: 500,
                                min: _seats,
                                division: 15,
                              );
                            }
                        ).then((returnVal)async{

                          if(returnVal != null){
                            setState(() {
                              _seats = returnVal.toDouble();
                            });
                          }
                        });
                      },
                    ),
                  ),
                  CustomTextField(
                    labelText: 'Minimum Qualification',
                    onSubmitted: (String value){
                      _minQual = value;
                    },
                  ),
                  CustomTextField(
                    labelText: 'Minimum Aggregate',
                    onSubmitted: (String value){
                      _minAgg = value;
                    },
                  ),
                  CustomTextField(
                    labelText: 'About Course',
                    minLines: 8,
                    onSubmitted: (String value){
                      _aboutCourse = value;
                    },
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
                        'Add this course',
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
                        var res = await _networkHandler.addCourse(
                            _collegeId.toString(),
                            _courseName,
                            _aboutCourse,
                            _duration,
                            _fee,
                            _minAgg,
                            _minQual,
                            _seats.toString()
                        );
                        if(!res[kError]){
                          setState(() {
                            _showIndicator = false;
                          });
                          Navigator.pop(context,kRefresh);
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