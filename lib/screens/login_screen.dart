import 'package:course_finder_admin/utilities/constants.dart';
import 'package:course_finder_admin/utilities/custom_widgets.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class LoginScreen extends StatefulWidget{
  @override
  _LoginScreenState createState() {
    return _LoginScreenState();
  }
}

class _LoginScreenState extends State<LoginScreen>{

  String email;
  String password;
  bool showSpinner = false;
  var responseBody;

  //TODO
  //NetworkHandler networkHandler = NetworkHandler();

  saveToSharedPref(bool loggedIn,int userId,String email)async{
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(kLoggedIn, true);
    await prefs.setInt(kUserID, userId);
    await prefs.setString(kEmailId, email);
  }

  Future<void> checkLogInStatus()async{
    final prefs = await SharedPreferences.getInstance();
    String emailId = prefs.getString(kEmailId);
    bool filledDetails = prefs.getBool(emailId);
    bool loggedIn = await isLoggedIn();
    if(loggedIn !=null && loggedIn){
      if(filledDetails != null && !filledDetails){
        /*Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => InputUserDetail(),
          ),
              (route)=>false,
        );*/
        //TODO
      }else{
        //int userId = prefs.getInt(kUserID);
        /*Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (context) => Home(userId: userId,)
          ),
              (root)=>false,
        );*/
        //TODO
      }
    }
  }

  Future<bool> isLoggedIn()async{
    final prefs = await SharedPreferences.getInstance();
    bool loggedIn = prefs.getBool(kLoggedIn);
    return loggedIn;
  }

  @override
  void initState() {
    super.initState();
    checkLogInStatus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ModalProgressHUD(
          inAsyncCall: showSpinner,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text(
                    "Course Finder",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 100.0,
                      fontFamily: 'Stalemate',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Institute Login',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Theme.of(context).accentColor,
                      fontSize: 25.0,
                      fontFamily: kQuicksand,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      InputTextField(
                        labelText: "E-mail",
                        icon: AntDesign.mail,
                        onChanged: (String value){
                          email = value;
                        },
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      InputTextField(
                        labelText: "Password",
                        icon: SimpleLineIcons.lock,
                        obscureText: true,
                        onChanged: (String value){
                          password = value;
                        },
                      ),
                    ],
                  ),
                  Builder(
                    builder: (context) =>
                    Hero(
                      tag: 'button',
                      child: CustomRaisedButton(
                        text: "Login",
                        //TODO
                        onPressed: ()async{
                          /*setState(() {
                            showSpinner = true;
                          });
                          responseBody = await networkHandler.loginUser(email, password);
                          if(!responseBody[kError]) {
                            showSpinner = false;
                            await saveToSharedPref(true,responseBody[kUserID],email);
                            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (
                                context) => Home(userId: responseBody[kUserID],)),(rout)=>false);
                          }else{
                            setState(() {
                              showSpinner = false;
                            });
                            Scaffold.of(context).showSnackBar(SnackBar(
                              backgroundColor: Colors.red,
                             content: Row(
                               children: <Widget>[
                                 Icon(Icons.error_outline),
                                 SizedBox(width:10.0),
                                 Text(responseBody[kMessage]),
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
                            ));
                          }*/
                        },
                      ),
                    ),
                  ),
                  SizedBox(height:20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Don\'t have an account?',
                        textAlign: TextAlign.end,
                        style: TextStyle(
                          fontFamily: kNotoSansSC,
                          fontSize: 20.0,
                        ),
                      ),
                      FlatButton(
                        splashColor: Colors.transparent,
                        child: Text(
                          'Sign Up',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: Theme.of(context).accentColor,
                            fontFamily: kNotoSansSC,
                            fontSize: 20.0,
                          ),
                        ),
                        onPressed: (){
                          //TODO
                          //Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpScreen()));
                        },
                      ),
                    ],
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