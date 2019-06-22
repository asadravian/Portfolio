import 'package:flutter_web/material.dart';
import 'dart:html' as html;

import '../utils/Contract.dart';

class HomePage extends StatefulWidget {
  final double height, width;
  final PageController pageController;
  HomePage(
      {@required this.height,
      @required this.width,
      @required this.pageController});
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget _buildHomePicture() {
    return Container(
      width: widget.width * 0.5,
      child: Center(
        child: CircleAvatar(
          radius: 200.0,
          backgroundImage: NetworkImage(
            'https://scontent.fccu2-1.fna.fbcdn.net/v/t1.0-9/59670206_587542545088978_8542166395230617600_n.jpg?_nc_cat=106&_nc_oc=AQm6aeVXkKVdfjEEQsAYMTpWo7SbMcfCVEH0mGXi_Bgeul33rLbOHYcjPV01tSB6gsCT75pLxnZ7H1rSnoZRmVbP&_nc_ht=scontent.fccu2-1.fna&oh=240b7258e7ef0e65488b1555ca2bec1d&oe=5D7D8A54',
          ),
          backgroundColor: CustomColors.mainBGColor,
        ),
      ),
    );
  }

  Widget _buildHomeButtons() {
    return Row(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: 20.0, right: 30),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            color: Colors.redAccent,
          ),
          child: Container(
            margin: EdgeInsets.all(1.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(25)),
              color: Colors.redAccent,
            ),
            child: FlatButton(
              onPressed: () async {
                html.window.open(
                    'https://drive.google.com/open?id=1WtZgVpHNILDY2eZgoklihuXPhj7HFcF_',
                    'resume');
              },
              child: Text('   Résumé   ',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontFamily: 'Comfortaa')),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 20.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            color: Colors.redAccent,
          ),
          child: Container(
            margin: EdgeInsets.all(1.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(25)),
              color: CustomColors.mainBGColor,
            ),
            child: FlatButton(
              onPressed: () {
                widget.pageController.animateToPage(3,
                    duration: Duration(milliseconds: 600),
                    curve: Curves.easeIn);
              },
              child: Text('   Say hi!   ',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontFamily: 'Comfortaa')),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildHomeDescription() {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: 130,
          width: widget.width * 0.5,
        ),
        Container(
          margin: const EdgeInsets.only(top: 20.0),
          child: Text(
            'Hi there! My name is',
            style: TextStyle(
                fontSize: 20, color: Colors.yellow, fontFamily: 'Comfortaa'),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 5.0),
          child: Text(
            'Ibtesam',
            style: TextStyle(
                fontSize: 50, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          child: Text(
            'Shaukat Ansari.',
            style: TextStyle(
                fontSize: 50, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 5.0),
          child: Text(
            'An android developer who is \ncurious about UI design and \nUser Experience.',
            style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontFamily: 'Exo',
                fontStyle: FontStyle.normal),
          ),
        ),
        _buildHomeButtons(),
      ],
    );
  }

  Widget _buildBody() {
    return Row(
      children: <Widget>[
        _buildHomePicture(),
        _buildHomeDescription(),
      ],
    );
  }

  Widget _buildQuickAccess() {
    return Container(
      height: 100,
      margin: EdgeInsets.only(left: (widget.width * 0.2) - 10),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              html.window.open(
                  'https://www.facebook.com/ibtesam.ansari070?ref=br_rs',
                  'Facebook');
            },
            child: Container(
              height: 23.0,
              width: 23.0,
              margin: EdgeInsets.all(5.0),
              child: Image.asset('images/facebookIcon.png'),
            ),
          ),
          SizedBox(width: 10.0),
          GestureDetector(
            onTap: () {
              html.window.open(
                  'https://www.linkedin.com/in/ibtesam-ansari-768886159/',
                  'Linkedin');
            },
            child: Container(
              height: 20.0,
              width: 20.0,
              margin: EdgeInsets.all(5.0),
              child: Image.asset('images/linkedin.png'),
            ),
          ),
          SizedBox(width: 10.0),
          GestureDetector(
            onTap: () {
              html.window.open('https://github.com/ibtesam123', 'Github');
            },
            child: CircleAvatar(
              radius: 13.0,
              backgroundColor: Colors.white,
              child: Container(
                child: Image.asset('images/Github.png'),
              ),
            ),
          ),
          SizedBox(width: 10.0),
          GestureDetector(
            onTap: () {
              html.window.open(
                  'https://www.quora.com/profile/Ibtesam-Ansari-1', 'Quora');
            },
            child: Container(
              height: 20.0,
              width: 20.0,
              margin: EdgeInsets.all(5.0),
              child: Image.asset('images/quora.jpg'),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: CustomColors.mainBGColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(child: _buildBody()),
          _buildQuickAccess(),
        ],
      ),
    );
  }
}
