import 'package:flutter_web/material.dart';
import 'dart:html' as html;
import 'dart:async';

class NewsAppPage extends StatefulWidget {
  @override
  _NewsAppPageState createState() => _NewsAppPageState();
}

class _NewsAppPageState extends State<NewsAppPage> {
  double width, height;
  PageController _pageController = PageController();
  Timer _timer;
  int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = 0;
    _timer = Timer.periodic(
      Duration(seconds: 3),
      (Timer t) {
        if (_currentIndex != 2) {
          _pageController.nextPage(
              duration: Duration(milliseconds: 600), curve: Curves.easeIn);
        } else {
          _pageController.animateToPage(0,
              duration: Duration(milliseconds: 700), curve: Curves.easeIn);
        }
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _timer?.cancel();
  }

  Widget _buildCarousel() {
    return Container(
      color: Colors.transparent,
      height: 400,
      width: width * 0.3,
      margin:
          EdgeInsets.only(top: 50.0, bottom: 50.0, left: 100.0, right: 50.0),
      child: PageView(
        scrollDirection: Axis.horizontal,
        controller: _pageController,
        onPageChanged: (pageNo) {
          this.setState(() => _currentIndex = pageNo);
        },
        children: <Widget>[
          Container(
            width: width * 0.3,
            child: Image.asset(
              'images/newsss1.png',
              fit: BoxFit.contain,
            ),
          ),
          Container(
            width: width * 0.3,
            child: Image.asset(
              'images/newsss2.png',
              fit: BoxFit.contain,
            ),
          ),
          Container(
            width: width * 0.3,
            child: Image.asset(
              'images/newsss3.png',
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDots() {
    return Container(
      margin: EdgeInsets.only(left: 30.0),
      child: Row(
        children: <Widget>[
          CircleAvatar(
            radius: _currentIndex == 0 ? 5.0 : 2.0,
            backgroundColor: Colors.white,
          ),
          SizedBox(width: 10.0),
          CircleAvatar(
            radius: _currentIndex == 1 ? 5.0 : 2.0,
            backgroundColor: Colors.white,
          ),
          SizedBox(width: 10.0),
          CircleAvatar(
            radius: _currentIndex == 2 ? 5.0 : 2.0,
            backgroundColor: Colors.white,
          ),
        ],
      ),
    );
  }

  Widget _buildWorkImages() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        _buildCarousel(),
        _buildDots(),
      ],
    );
  }

  Widget _buildTitle() {
    return Container(
      margin: EdgeInsets.only(top: 90.0),
      child: Text(
        'NewsApp',
        style: TextStyle(
            color: Colors.redAccent, fontSize: 45.0, fontFamily: 'Comfortaa'),
      ),
    );
  }

  Widget _buildDesc() {
    return Container(
      margin: EdgeInsets.only(top: 20.0),
      height: 240.0,
      child: Text(
        'Get all your news at one place.\nTrending news on Business, Science, Entertainment, \nSports, Health & Technology.',
        style: TextStyle(
            fontSize: 20.0,
            color: Colors.white,
            letterSpacing: 2.0,
            fontFamily: 'Exo'),
      ),
    );
  }

  Widget _buildLinks() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        FlatButton(
          onPressed: () {
            html.window.open(
                'https://play.google.com/store/apps/details?id=ibtesam.news&hl=en',
                'news_store');
          },
          child: Container(
            height: 100,
            width: 200,
            color: Colors.transparent,
            padding: EdgeInsets.symmetric(vertical: 10.0),
            child: Image.asset(
              'images/google_play.png',
              fit: BoxFit.cover,
            ),
          ),
        ),
        FlatButton(
          onPressed: () {
            html.window
                .open('https://github.com/ibtesam123/my_news_app', 'news');
          },
          child: Container(
            padding: EdgeInsets.all(7.0),
            decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(7.0),
                border: Border.all(color: Colors.white, width: 1.0)),
            child: Row(
              children: <Widget>[
                CircleAvatar(
                  radius: 20.0,
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage('images/Github.png'),
                ),
                SizedBox(width: 15.0),
                Text('Github\nRepository',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                    )),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildWorkDesc() {
    return Container(
      margin: EdgeInsets.only(left: 30),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildTitle(),
          _buildDesc(),
          _buildLinks(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        _buildWorkImages(),
        _buildWorkDesc(),
      ],
    );
  }
}
