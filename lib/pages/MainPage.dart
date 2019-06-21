import 'package:flutter_web/material.dart';

import '../utils/Contract.dart';
import './AboutPage.dart';
import './ContactPage.dart';
import './HomePage.dart';
import './WorkPage.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  double height, width;
  PageController _pageController;
  int _currentPage;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
    _currentPage = 0;
  }

  Widget _buildPageButtons(String pageName, int pageNumber) {
    return GestureDetector(
      onTap: () {
        _pageController.animateToPage(
          pageNumber,
          duration: Duration(milliseconds: 600),
          curve: Curves.easeIn,
        );
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        child: Column(
          children: <Widget>[
            Text(
              pageName,
              style: TextStyle(
                  color: Colors.white, fontSize: 20.0, fontFamily: 'Exo'),
            ),
            Container(
              width: 35.0,
              height: 2.0,
              margin: EdgeInsets.only(top: 6.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(1.0),
                color: _currentPage == pageNumber
                    ? Colors.yellow
                    : Colors.transparent,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHomeButton() {
    return GestureDetector(
      onTap: () {
        _pageController.animateToPage(
          0,
          duration: Duration(milliseconds: 400),
          curve: Curves.easeIn,
        );
        this.setState(() => _currentPage = 0);
      },
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Icon(Icons.home, color: Colors.white),
      ),
    );
  }

  Widget _buildTitleBar() {
    return PreferredSize(
      preferredSize: Size.fromHeight(height * 0.11),
      child: Stack(
        children: <Widget>[
          Container(color: CustomColors.mainBGColor),
          Column(
            children: <Widget>[
              SizedBox(
                height: height * 0.025,
                width: width,
              ),
              Row(
                children: <Widget>[
                  SizedBox(width: width * 0.025),
                  Text('Ansari',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontFamily: 'Exo',
                          fontWeight: FontWeight.bold)),
                  Text('.',
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 33,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Exo')),
                  Expanded(
                    child: SizedBox(),
                  ),
                  _buildPageButtons('about', 1),
                  _buildPageButtons('work', 2),
                  _buildPageButtons('contact', 3),
                  _buildHomeButton(),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBody() {
    return PageView(
      controller: _pageController,
      scrollDirection: Axis.vertical,
      onPageChanged: (int currentPage) {
        this.setState(() => _currentPage = currentPage);
      },
      children: <Widget>[
        HomePage(
          height: height,
          width: width,
          pageController: _pageController,
        ),
        AboutPage(
          height: height,
          width: width,
          pageController: _pageController,
        ),
        WorkPage(),
        ContactPage(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: _buildTitleBar(),
      body: _buildBody(),
    );
  }
}
