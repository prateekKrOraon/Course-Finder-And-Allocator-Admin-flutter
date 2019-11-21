import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'constants.dart';

class InputTextField extends StatelessWidget{

  InputTextField({this.labelText,this.icon,this.onChanged,this.onTap,this.obscureText:false});

  final String labelText;
  final Function onChanged;
  final IconData icon;
  final bool obscureText;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50.0),
      child: TextField(
        obscureText: obscureText,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(0.0),
          suffixIcon: GestureDetector(onTap:onTap,child: Icon(icon)),
          labelText: labelText,
          border: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Theme.of(context).accentColor,
                width: 2.0,
              )
          ),
        ),
        onChanged: onChanged,
      ),
    );
  }
}

class CustomRaisedButton extends StatelessWidget{

  CustomRaisedButton({this.text, this.onPressed});

  final String text;
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 100.0),
      child: RaisedButton(
        color: Colors.white,
        shape: StadiumBorder(
            side: BorderSide(
              color: Theme.of(context).accentColor,
              width: 2.0,
            )
        ),
        child: Padding(
          padding: EdgeInsets.all(0.0),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0),
            child: Text(
              text,
              style: TextStyle(
                  fontSize: 30.0,
                  color: Theme.of(context).accentColor,
                  fontFamily: kQuicksand,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
        ),
        onPressed: onPressed,
      ),
    );
  }
}

class DrawerButton extends StatelessWidget{

  DrawerButton({this.onTap,this.text,this.icon});
  final String text;
  final Function onTap;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child:Container(
        padding: EdgeInsets.symmetric(horizontal:20.0,vertical: 15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              text,
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.black,
                fontFamily: kQuicksand,
              ),
            ),
            Icon(icon,color: Theme.of(context).accentColor,),
          ],
        ),
      ),
      onTap: onTap,
    );
  }
}

class DashboardCard extends StatelessWidget{

  DashboardCard({this.header,this.contentMain,this.contentSub});

  final String header;
  final String contentMain;
  final String contentSub;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              header,
              style: TextStyle(
                  fontFamily: kQuicksand,
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
          Divider(color: Theme.of(context).accentColor,height: 1.0,),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  contentMain,
                  style: TextStyle(
                    fontFamily: kQuicksand,
                    fontSize: 70.0,
                    color: Theme.of(context).accentColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 20.0,),
                Text(
                  contentSub,
                  style: TextStyle(
                    fontFamily: kQuicksand,
                    fontWeight: FontWeight.bold,
                    fontSize: 30.0,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

}

class InstituteInfoTile extends StatelessWidget{

  InstituteInfoTile({this.icon,this.text,this.label,this.des=false});

  final String label;
  final String text;
  final IconData icon;
  final bool des;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0,),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Icon(
                icon,
                size: 15.0,
                color: Theme.of(context).accentColor,
              ),
              SizedBox(
                width: 10.0,
              ),
              Text(
                label,
                style: TextStyle(
                  fontFamily: kQuicksand,
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).accentColor,
                ),
              ),
            ],
          ),
          SizedBox(height: 5.0,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:10.0),
            child: Text(
              text,
              style: TextStyle(
                fontFamily: kQuicksand,
                fontSize: des?17.0:25.0,
                fontWeight: des?FontWeight.normal:FontWeight.bold,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class AboutTile extends StatelessWidget{
  AboutTile({this.header,this.icon,this.text});
  final IconData icon;
  final String header;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      height: 80.0,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(
            icon,
            color: Theme.of(context).accentColor,
            size: 30.0,
          ),
          SizedBox(width: 30.0,),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                header,
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.black,
                  fontFamily: kQuicksand,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                text,
                style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.black,
                  fontFamily: kQuicksand,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

}

class CourseCard extends StatelessWidget{

  CourseCard({this.courseName,this.about,this.duration,this.fee,this.minAgg,this.minQual,this.seats});

  final String courseName;
  final String fee;
  final String duration;
  final String minQual;
  final String minAgg;
  final String about;
  final String seats;

  final TextStyle style = TextStyle(
    fontFamily: kQuicksand,
    fontWeight: FontWeight.bold,
    fontSize: 30.0,
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Card(
        elevation: 3.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0,10.0,8.0,0.0),
              child: Text(
                courseName,
                style: style.copyWith(
                  color: Theme.of(context).accentColor,
                )
              ),
            ),
            SizedBox(height: 10.0,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:16.0,vertical: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Fee',
                    style: style.copyWith(
                      fontSize: 20.0,
                    ),
                  ),
                  Text(
                    fee,
                    style: style.copyWith(
                      fontSize: 20.0,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:16.0,vertical: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Duration',
                    style: style.copyWith(
                      fontSize: 20.0,
                    ),
                  ),
                  Text(
                    duration,
                    style: style.copyWith(
                      fontSize: 20.0,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:16.0,vertical: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Seats',
                    style: style.copyWith(
                      fontSize: 20.0,
                    ),
                  ),
                  Text(
                    seats,
                    style: style.copyWith(
                      fontSize: 20.0,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
            ExpansionTile(
              title: Text(
                'See More',
                style: style.copyWith(
                  fontSize: 20.0,
                  fontWeight: FontWeight.normal,
                ),
              ),
              children: <Widget>[
                ExpansionTile(
                  title: Text(
                    'Course Requirement',
                    style: style.copyWith(
                      fontSize: 20.0,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical:4.0,horizontal: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Text(
                            'Minimum Qualification',
                            style: style.copyWith(
                              fontSize: 20.0,
                            ),
                          ),
                          SizedBox(height: 5.0,),
                          Text(
                            minQual,
                            style: style.copyWith(
                              fontSize: 20.0,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical:8.0,horizontal: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Text(
                            'Minimum Aggregate',
                            style: style.copyWith(
                              fontSize: 20.0,
                            ),
                          ),
                          SizedBox(height: 5.0,),
                          Text(
                            minAgg,
                            style: style.copyWith(
                              fontSize: 20.0,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10.0,),
                  ],
                ),
                ExpansionTile(
                  title: Text(
                    'About Course',
                    style: style.copyWith(
                      fontSize: 20.0,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  children: <Widget>[
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(horizontal: 16.0,),
                      child: Text(
                        about,
                        textAlign: TextAlign.left,
                        style: style.copyWith(
                          fontSize: 17.0,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                    SizedBox(height: 10.0,),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: FlatButton(
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Text(
                            'Edit',
                            textAlign: TextAlign.left,
                            style: style.copyWith(
                              fontSize: 22.0,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).accentColor,
                            ),
                          ),
                        ),
                        onPressed: (){
                          //TODO
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget{

  CustomTextField({this.labelText,this.hintText,this.onSubmitted,this.minLines=1});

  final String labelText;
  final String hintText;
  final Function onSubmitted;
  final int minLines;

  @override
  Widget build(BuildContext context) {

    final OutlineInputBorder border = OutlineInputBorder(
        borderSide: BorderSide(
          style: BorderStyle.solid,
          color: Theme.of(context).accentColor,
          width: 1.0,
        )
    );

    return Padding(
      padding: EdgeInsets.symmetric(horizontal:8.0,vertical: 8.0),
      child: TextField(
        maxLines: null,
        minLines: minLines,
        cursorColor: Theme.of(context).accentColor,
        enableInteractiveSelection: true,
        cursorWidth: 1.0,
        style: TextStyle(
          fontFamily: kQuicksand,
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(15.0),
          labelText: labelText,
          hintText: hintText,
          alignLabelWithHint: true,
          labelStyle: TextStyle(
            color: Theme.of(context).accentColor,
          ),
          focusedBorder: border,
          border: border,
          disabledBorder: border,
          enabledBorder: border,
        ),
        onSubmitted: onSubmitted,
      ),
    );
  }
}

class ShowDialog extends StatefulWidget{

  ShowDialog({this.value,this.min,this.max,this.division});

  final double value;
  final double min;
  final double max;
  final int division;

  @override
  _ShowDialogState createState() {
    return _ShowDialogState();
  }

}

class _ShowDialogState extends State<ShowDialog>{

  double value;
  double min;
  double max;
  int division;

  @override
  void initState() {
    super.initState();
    this.division = widget.division;
    this.value = widget.value;
    this.min = widget.min;
    this.max = widget.max;
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 10.0,
      child: Container(
        height: 200,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Drag the slider to select year',
                style: TextStyle(
                  fontFamily: kQuicksand,
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).accentColor,
                ),
              ),
              SizedBox(height: 10.0,),
              Slider(
                value: value,
                min: min,
                max: max,
                label: '${value.round()}',
                divisions: (max-min).toInt(),
                onChanged: (double value){
                  setState(() {
                    this.value = value;
                  });
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  FlatButton(
                    child: Container(
                      width: 70.0,
                      height: 20.0,
                      child: Text(
                        'Discard',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: kQuicksand,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).accentColor,
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                    onPressed: (){
                      Navigator.pop(context,2000);
                    },
                  ),
                  FlatButton(
                    child: Container(
                      width: 70.0,
                      height: 20.0,
                      child: Text(
                        'Confirm',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: kQuicksand,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).accentColor,
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                    onPressed: (){
                      Navigator.pop(context,value);
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AllocationCard extends StatelessWidget{

  AllocationCard({this.courseName,this.count,this.onPressed});

  final String courseName;
  final String count;
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Card(
          elevation: 2.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0,horizontal: 14.0),
                child: Text(
                  courseName,
                  style: TextStyle(
                    fontFamily: kQuicksand,
                    fontSize: 30.0,
                    color: Theme.of(context).accentColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0,horizontal: 14.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        'Total Students',
                        style: TextStyle(
                          fontFamily: kQuicksand,
                          fontSize: 25.0,
                        ),
                      ),
                    ),
                    Text(
                      count,
                      style: TextStyle(
                        fontFamily: kQuicksand,
                        fontSize: 25.0,
                      ),
                    )
                  ],
                ),
              ),
              FlatButton(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15.0,),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          'Show Students',
                          style: TextStyle(
                            fontFamily: kQuicksand,
                            fontSize: 25.0,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                onPressed: onPressed,
              ),
            ],
          ),
        )
      ],
    );
  }
}


class CustomListTile extends StatelessWidget{

  CustomListTile({this.text,this.header,this.icon});

  final String text;
  final String header;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      height: 80.0,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(
            icon,
            color: Theme.of(context).accentColor,
            size: 30.0,
          ),
          SizedBox(width: 30.0,),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                header,
                style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.black,
                  fontFamily: kQuicksand,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                text,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.black,
                  fontFamily: kQuicksand,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CustomFlatButton extends StatelessWidget{

  CustomFlatButton({this.text,this.icon,this.onPressed});

  final String text;
  final IconData icon;
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 50.0),
      child: FlatButton(
        shape: StadiumBorder(
            side: BorderSide(
              color: Theme.of(context).accentColor,
              width: 1.0,
            )
        ),
        onPressed: onPressed,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(icon,color: Theme.of(context).accentColor,),
              SizedBox(width: 20.0,),
              Text(
                text,
                style: TextStyle(
                    fontSize: 20.0,
                    color: Theme.of(context).accentColor
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

}