import 'package:flutter_web/material.dart';

import '../utils/Contract.dart';

class AboutPage extends StatefulWidget {
  final double height, width;
  final PageController pageController;

  AboutPage(
      {@required this.height,
      @required this.width,
      @required this.pageController});
  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  Widget _buildAboutRows(String category, String text) {
    return Container(
      padding: EdgeInsets.only(left: 30.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text(
            category + '\t\t',
            style: TextStyle(
                color: Colors.blueGrey,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'Exo'),
          ),
          Text(
            text,
            style: TextStyle(
                color: Colors.white, fontSize: 18.0, fontFamily: 'Exo'),
          )
        ],
      ),
    );
  }

  Widget _buildAboutSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'ABOUT',
          style: TextStyle(
              fontSize: 50.0,
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontFamily: 'Exo'),
        ),
        Container(
          height: 2.0,
          width: (widget.width * 0.5) - 40.0,
          color: Colors.white,
          margin: EdgeInsets.symmetric(vertical: 10.0),
        ),
        _buildAboutRows('WHO', 'IBTESAM SHAUKAT ANSARI'),
        SizedBox(height: 10.0),
        _buildAboutRows('WHAT', 'Full Stack Mobile App Developer'),
        SizedBox(height: 10.0),
        _buildAboutRows('WHERE', 'Kolkata, West Bengal'),
        SizedBox(height: 10.0),
        _buildAboutRows('WHEN', '2017 - Present'),
        SizedBox(height: 10.0),
        _buildAboutRows('WHY', 'Passion'),
        SizedBox(height: 10.0),
        Container(
          height: 3.0,
          width: (widget.width * 0.5) - 40.0,
          color: Colors.white,
          margin: EdgeInsets.symmetric(vertical: 10.0),
        ),
      ],
    );
  }

  Widget _buildAboutImage() {
    return Container(
      width: 400.0,
      height: 250.0,
      margin: EdgeInsets.only(top: 50.0),
      decoration: BoxDecoration(
        border: Border.all(
          width: 4.0,
          color: Colors.white,
        ),
      ),
      child: Image.network(
          'https://scontent.fccu2-1.fna.fbcdn.net/v/t1.0-9/59670206_587542545088978_8542166395230617600_n.jpg?_nc_cat=106&_nc_oc=AQm6aeVXkKVdfjEEQsAYMTpWo7SbMcfCVEH0mGXi_Bgeul33rLbOHYcjPV01tSB6gsCT75pLxnZ7H1rSnoZRmVbP&_nc_ht=scontent.fccu2-1.fna&oh=240b7258e7ef0e65488b1555ca2bec1d&oe=5D7D8A54',
          fit: BoxFit.cover),
    );
  }

  Widget _buildTopSection() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        _buildAboutSection(),
        _buildAboutImage(),
      ],
    );
  }

  Widget _buildExperienceBar(String text, String duration) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(5.0),
          color: Color.fromRGBO(15, 15, 15, 1),
          child: Icon(
            Icons.add,
            color: Colors.lightGreenAccent,
            size: 40.0,
          ),
        ),
        SizedBox(width: 5.0),
        Container(
          width: widget.width * 0.3,
          color: Color.fromRGBO(15, 15, 15, 1),
          padding: EdgeInsets.all(3.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                text,
                style: TextStyle(color: Colors.lightGreen, fontFamily: 'Exo'),
              ),
              SizedBox(height: 8.0),
              Text(
                duration,
                style: TextStyle(color: Colors.white, fontFamily: 'Exo'),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget _buildExperienceSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(bottom: 15.0, top: 40.0),
          child: Text(
            'EXPERIENCE',
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 30.0,
                fontFamily: 'Exo'),
          ),
        ),
        SizedBox(height: 10.0),
        _buildExperienceBar(
          'Magnum Solutions  //  Android App Developer',
          'Mar, 2019 - Apr, 2019',
        ),
        SizedBox(height: 10.0),
        _buildExperienceBar(
          'VIBASU Career Accelerators Pvt. Ltd.  //  Mobile App Developer',
          'Mar, 2019 - Apr, 2019',
        ),
      ],
    );
  }

  Widget _buildSkillItems(String itemName, String itemImage) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        AnimatedContainer(
          height: 130,
          width: 130,
          duration: Duration(milliseconds: 400),
          curve: Curves.easeOut,
          padding: EdgeInsets.all(20.0),
          child: Image.asset(
            itemImage,
            fit: BoxFit.contain,
          ),
        ),
        SizedBox(height: 10.0),
        Text(
          itemName,
          style: TextStyle(
              color: Colors.white, fontSize: 18.0, fontFamily: 'Comfortaa'),
        )
      ],
    );
  }

  Widget _buildSkillsSection() {
    return Padding(
      padding: const EdgeInsets.only(left: 100.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 15.0, top: 37.0),
            child: Text(
              'SKILLS',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30.0,
                  fontFamily: 'Exo'),
            ),
          ),
          Container(
            height: 200,
            width: widget.width * 0.5,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                _buildSkillItems(
                    'Flutter',
                    // 'https://avatars1.githubusercontent.com/u/14101776?s=200&v=4',
                    'images/Flutter.png'),
                _buildSkillItems(
                    'Android',
                    // 'http://icons.iconarchive.com/icons/papirus-team/papirus-apps/256/android-sdk-icon.png',
                    'images/Android.png'),
                _buildSkillItems(
                    'Java',
                    // 'http://icons.iconarchive.com/icons/papirus-team/papirus-apps/256/java-icon.png',
                    'images/Java.png'),
                _buildSkillItems(
                    'Dart',
                    // 'https://upload.wikimedia.org/wikipedia/commons/7/7e/Dart-logo.png',
                    'images/Dart.png'),
                _buildSkillItems(
                    'Firebase',
                    // 'https://img.icons8.com/color/180/firebase.png',
                    'images/firebase.png'),
                _buildSkillItems(
                    'C/C++',
                    // 'https://user-images.githubusercontent.com/42747200/46140125-da084900-c26d-11e8-8ea7-c45ae6306309.png',
                    'images/C++.png'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomSection() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _buildExperienceSection(),
        Expanded(child: _buildSkillsSection()),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: CustomColors.mainBGColor,
      padding: EdgeInsets.only(left: 60.0),
      child: Column(
        children: <Widget>[
          _buildTopSection(),
          _buildBottomSection(),
        ],
      ),
    );
  }
}
