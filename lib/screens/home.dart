import 'package:course_finder_admin/screens/about_app.dart';
import 'package:course_finder_admin/screens/allocations_screen.dart';
import 'package:course_finder_admin/screens/courses_screen.dart';
import 'package:course_finder_admin/screens/dashboard_screen.dart';
import 'package:course_finder_admin/screens/institute_info_screen.dart';
import 'package:course_finder_admin/screens/profile_screen.dart';
import 'package:course_finder_admin/services/network_handler.dart';
import 'package:course_finder_admin/utilities/constants.dart';
import 'package:course_finder_admin/utilities/custom_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class Home extends StatefulWidget{
  @override
  _HomeState createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> with TickerProviderStateMixin{


  Widget _buildCategory(String text){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 10.0,bottom: 10.0,top: 10.0),
          child: Text(
            text,
            style: TextStyle(
                fontFamily: kNotoSansSC,
                fontWeight: FontWeight.bold
            ),
          ),
        ),
        Divider(height: 1.0,color: Theme.of(context).accentColor,),
      ],
    );
  }


  int _currentScreenIndex = 0;

  Animation openAnimation;
  AnimationController openController;

  NetworkHandler _networkHandler;

  @override
  void initState() {
    super.initState();
    _networkHandler = NetworkHandler();
    openController = AnimationController(
        duration: Duration(milliseconds: 200),
        vsync: this
    );
    openAnimation = Tween(
      begin: 1.0,
      end: 0.0,
    ).animate(openController);
    openController.reset();
    openController.forward();
  }

  Future getProfileData() async {
    return await _networkHandler.getProfile();
  }

  _menuHandler(){
    openController.reset();
    openController.forward();
  }

  @override
  Widget build(BuildContext context) {

    //Header for drawer
    final _drawerHeader = UserAccountsDrawerHeader(
      currentAccountPicture: InkWell(
        onTap: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProfileScreen()));
        },
        child: Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            color: Theme.of(context).accentColor,
            borderRadius: BorderRadius.all(Radius.circular(60)),
          ),
          child: Center(
            child: Icon(
              SimpleLineIcons.user,
              size: 35.0,
            ),
          ),
        ),
      ),
      accountEmail: Row(
        children: <Widget>[
          Icon(
            AntDesign.mail,
            color: Colors.white,
            size: 18.0,
          ),
          SizedBox(width: 10.0,),
          Text(
            'b170078@nitsikkim.ac.in',
            style: TextStyle(
              fontFamily: kQuicksand,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
      accountName: Row(
        children: <Widget>[
          Icon(
            SimpleLineIcons.user,
            color: Colors.white,
            size: 18,
          ),
          SizedBox(width: 10.0,),
          Text(
            'Prateek Kumar Oraon',
            style: TextStyle(
              fontFamily: kQuicksand,
              fontWeight: FontWeight.bold
            ),
          ),
        ],
      ),
    );

    //Drawer items
    final _drawerItems = ListView(
      children: <Widget>[
        _drawerHeader,
        _buildCategory('Main'),
        DrawerButton(
          text: 'Dashboard',
          icon: AntDesign.dashboard,
          onTap: (){
            setState(() {
              _currentScreenIndex = 0;
            });
          },
        ),
        DrawerButton(
          text: 'Institute Info',
          icon: MaterialCommunityIcons.city_variant_outline,
          onTap: (){
            setState(() {
              _currentScreenIndex = 1;
            });
          },
        ),
        DrawerButton(
          text: 'Courses',
          icon: AntDesign.book,
          onTap: (){
            setState(() {
              _currentScreenIndex = 2;
            });
          },
        ),
        _buildCategory('Analytics'),
        DrawerButton(
          text: 'Allocations',
          icon: SimpleLineIcons.event,
          onTap: (){
            setState(() {
              _currentScreenIndex = 3;
            });
          },
        ),
        _buildCategory('Others'),
        DrawerButton(
          text: 'About',
          icon: SimpleLineIcons.info,
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => AboutApp()));
          },
        ),
        DrawerButton(
          text: 'Exit',
          icon: AntDesign.logout,
          onTap: (){
            SystemChannels.platform.invokeMethod('SystemNavigator.pop');
          },
        ),
      ],
    );

    final _screens = <Widget>[
      Dashboard(),
      InstituteInfoScreen(),
      CoursesScreen(),
      AllocationsScreen(collegeId: 1,),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: <Widget>[
            Icon(
              Icons.school,
            ),
            SizedBox(width: 10.0,),
            Text(
              'Course Finder Admin',
              style: TextStyle(
                fontFamily: kQuicksand,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      body: _screens[_currentScreenIndex],
      drawer: Drawer(
        child: _drawerItems,
      ),
    );
  }

}