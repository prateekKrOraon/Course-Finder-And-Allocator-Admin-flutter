import 'dart:convert';

import 'package:course_finder_admin/utilities/constants.dart';
import 'package:http/http.dart' as http;

class NetworkHandler{

  String _globalUrl = 'http://course-finder-prateek.000webhostapp.com/course_finder_app/services/admin-services';
  Map<String,String> _header = {"Accept":"application/json",};

  //getAllCourses from college_courses key = college_id

  Future getInstituteDetails(String collegeId)async{

    String url = '$_globalUrl/getInstituteDetails.php';
    var res = await http.post(url,headers: _header,body: {kCollegeId:collegeId});
    return jsonDecode(res.body);
  }

  Future getCourses(String collegeId)async{
    String url = 'http://course-finder-prateek.000webhostapp.com/course_finder_app/services/admin-services/getCourses.php';
    var res = await http.post(url,headers: _header,body: {kCollegeId:collegeId});
    var json = jsonDecode(res.body);
    return jsonDecode(json);
  }

  Future getDashboard(String collegeID) async {
    String url = 'http://course-finder-prateek.000webhostapp.com/course_finder_app/services/admin-services/getDashboard.php';
    var res = await http.post(url,headers: _header,body: {kCollegeId:collegeID});
    var json = jsonDecode(res.body);
    return json;
  }

  Future addCourse(String collegeID,String courseName,String aboutCourse,String duration,String fee,String minAgg,String minQual,String seats)async{
    String url = 'http://course-finder-prateek.000webhostapp.com/course_finder_app/services/admin-services/addCourse.php';
    var res = await http.post(
        url,
        headers: _header,
        body:
        {
          kCollegeId:collegeID,
          kCourseName:courseName,
          kCourseDetail:aboutCourse,
          kCourseDuration:duration,
          kCourseCost:fee,
          kMinQual:minQual,
          kMinAgg:minAgg,
          kSeats:seats,
        }
    );
    var json = jsonDecode(res.body);
    return json;
  }

  Future editInstituteDetails(String collegeId, String collegeName, String location, String des, String type, String faculty, String owner,String year)async{
    String url = "$_globalUrl/editCollegeDetails.php";
    var res = await http.post(
      url,
      headers: _header,
      body:
        {
          kCollegeId:collegeId,
          kCollegeName:collegeName,
          kCollegeLocation:location,
          kCollegeDes:des,
          kType:type,
          kTotalFaculty:faculty,
          kOwner:owner,
          kEstdYear:year,
        }
    );

    return jsonDecode(res.body);
  }

  Future getAllocationDetails(String collegeId) async {
    String url = "$_globalUrl/getAllocationDetails.php";
    var res = await http.post(
      url,
      headers: _header,
      body: {kCollegeId:collegeId},
    );
    return jsonDecode(res.body);
  }

  Future getProfile() async {
    String url = 'http://course-finder-prateek.000webhostapp.com/course_finder_app/services/getProfileData.php';
    var res = await http.post(
      url,
      headers: _header,
      body: {kUserID:'1'}
    );

    return jsonDecode(res.body);
  }

}