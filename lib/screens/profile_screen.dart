import 'package:course_finder_admin/utilities/constants.dart';
import 'package:course_finder_admin/utilities/custom_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class ProfileScreen extends StatefulWidget{
  @override
  _ProfileScreenState createState() {
    return _ProfileScreenState();
  }
}

class _ProfileScreenState extends State<ProfileScreen> with SingleTickerProviderStateMixin{

  Animation _openAnimation;
  AnimationController _openController;

  @override
  void initState() {
    super.initState();

    _openController = AnimationController(
        duration: Duration(milliseconds: 200),
        vsync: this
    );
    _openAnimation = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(_openController);
    _openController.reset();
    _openController.forward();
  }

  _menuHandler(){
    _openController.reset();
    _openController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile',
          style: TextStyle(
            fontFamily: kQuicksand,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                width:MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(75)),
                  border: Border.all(
                    width: 2,
                    color: Theme.of(context).accentColor
                  )
                ),
                child: Center(
                  child: Icon(
                    Icons.person_outline,
                    size: 120,
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                'Prateek Kumar Oraon',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: kQuicksand,
                  fontWeight: FontWeight.bold,
                  fontSize: 45,
                )
              ),
              Text(
                'National Institute of Technology Sikkim',
                style: TextStyle(
                  fontFamily: kQuicksand,
                  fontSize: 25,
                ),
              ),
              SizedBox(height: 50,),
              Card(
                elevation: 2.0,
                margin: EdgeInsets.all(10.0),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Personla info',
                        style: TextStyle(
                          fontFamily: kQuicksand,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10.0,),
                      Divider(height: 20.0,color: Theme.of(context).accentColor,),

                      CustomListTile(
                        header: 'Email',
                        text: 'b170078@nitsikkim.ac.in',
                        icon: AntDesign.mail,
                      ),
                      CustomListTile(
                        header: 'Phone Number',
                        text: '7478731167',
                        icon: AntDesign.phone,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              CustomFlatButton(
                text: "Edit Details",
                icon: SimpleLineIcons.pencil,
                onPressed: (){
                  //TODO
//                  Navigator.push(context, MaterialPageRoute(
//                    builder:(context) => EditDetailsScreen(
//                      email: res[kEmailId],
//                      name: res[kFullName],
//                      phoneNo: res[kPhoneNo],
//                      qual: res[kQualification],
//                      city: res[kCity],
//                    ),
//                  ),);
                },
              ),
              Hero(
                tag: 'change_password',
                child: CustomFlatButton(
                  text: "Change Password",
                  icon: SimpleLineIcons.pencil,
                  onPressed: (){
                    //TODO
                    // Navigator.push(context, MaterialPageRoute(builder: (context) => ChangePassword(emailId:res[kEmailId])));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}