import 'package:flutter_web/material.dart';

import '../utils/Contract.dart';
import './WorkPages/NewsAppPage.dart';
import './WorkPages/EmpressMusicPage.dart';
import './WorkPages/HPL_AOTPage.dart';

class WorkPage extends StatefulWidget {
  @override
  _WorkPageState createState() => _WorkPageState();
}

class _WorkPageState extends State<WorkPage> {
  PageController _pageController = PageController();
  int _currentPage;

  @override
  void initState() {
    super.initState();
    _currentPage = 0;
  }

  Widget _buildPageView() {
    return PageView(
      controller: _pageController,
      children: <Widget>[
        NewsAppPage(),
        HPL_AOTPage(),
        EmpressMusicPage(),
      ],
      onPageChanged: (currentPage) {
        this.setState(() => _currentPage = currentPage);
      },
    );
  }

  Widget _buildNavigation() {
    return Center(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10.0),
            child: _currentPage != 0
                ? IconButton(
                    icon: Icon(Icons.arrow_left),
                    iconSize: 100.0,
                    color: Colors.white.withOpacity(0.5),
                    onPressed: () => _pageController.previousPage(
                        curve: Curves.easeIn,
                        duration: Duration(milliseconds: 400)),
                  )
                : Container(),
          ),
          Container(
            padding: EdgeInsets.all(10.0),
            child: _currentPage != 2
                ? IconButton(
                    icon: Icon(Icons.arrow_right),
                    iconSize: 100.0,
                    color: Colors.white.withOpacity(0.5),
                    onPressed: () => _pageController.nextPage(
                        curve: Curves.easeIn,
                        duration: Duration(milliseconds: 400)),
                  )
                : Container(),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: CustomColors.mainBGColor,
      child: Stack(
        children: <Widget>[
          _buildPageView(),
          _buildNavigation(),
        ],
      ),
    );
  }
}
