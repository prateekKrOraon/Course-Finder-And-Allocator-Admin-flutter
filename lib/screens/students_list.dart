import 'package:course_finder_admin/utilities/constants.dart';
import 'package:flutter/material.dart';

class StudentsList extends StatefulWidget{

  StudentsList(this.title,this.list);
  final String title;
  final List list;
  @override
  _StudentsListState createState() {
    return _StudentsListState(title,list);
  }
}

class _StudentsListState extends State<StudentsList>{

  _StudentsListState(this.title,this.list);
  final List list;
  final String title;
  @override
  Widget build(BuildContext context) {
    Map<String,dynamic> first = list[0];
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: TextStyle(
            fontFamily: kQuicksand,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: ListView.builder(
          itemCount: list.length,
          itemBuilder: (BuildContext context, index){
            return Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0,bottom:5.0,left: 14.0),
                    child: Text(
                      list[index]['full_name'].toString(),
                      style: TextStyle(
                        fontFamily: kQuicksand,
                        fontSize: 25.0,
                      ),
                    ),
                  ),
                  ExpansionTile(
                    title: Text(
                      'See Details',
                      style: TextStyle(
                          fontFamily: kQuicksand,
                          fontSize: 20.0
                      ),
                    ),
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 16.0),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: Text(
                                'E-mail',
                                style: TextStyle(
                                  fontFamily: kQuicksand,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                list[index][kEmailId].toString(),
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                  fontFamily: kQuicksand,
                                  fontSize: 20.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 16.0),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: Text(
                                'Contact',
                                style: TextStyle(
                                  fontFamily: kQuicksand,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                list[index][kPhone].toString(),
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                  fontFamily: kQuicksand,
                                  fontSize: 20.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 16.0),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: Text(
                                'Qualification',
                                style: TextStyle(
                                  fontFamily: kQuicksand,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                list[index][kQualification].toString(),
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                  fontFamily: kQuicksand,
                                  fontSize: 20.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}