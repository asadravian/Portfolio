import 'package:flutter_web/cupertino.dart';
import 'package:flutter_web/material.dart';
import 'dart:html' as html;

import '../utils/Contract.dart';

class ContactPage extends StatefulWidget {
  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  Widget _buildTitle() {
    return Container(
      margin: EdgeInsets.only(top: 100.0),
      child: Text(
        "I'm Social !",
        style: TextStyle(
            color: Colors.white, fontSize: 35.0, fontFamily: 'Comfortaa'),
      ),
    );
  }

  Widget _buildLinkCard(String image, String link, String name) {
    return GestureDetector(
      onTap: () {
        html.window.open(link, name);
      },
      child: Column(
        children: <Widget>[
          Material(
            elevation: 5.0,
            shadowColor: Colors.black,
            color: CustomColors.mainBGColor,
            child: Container(
              width: name == 'Email' ? 120.0 : 100.0,
              height: 100.0,
              color: CustomColors.mainBGColor,
              child: Image.asset(image, fit: BoxFit.fill),
            ),
          ),
          SizedBox(height: 5.0),
          Text(name,
              style: TextStyle(
                  color: Colors.white, fontSize: 20.0, fontFamily: 'Exo')),
        ],
      ),
    );
  }

  Widget _buildLinks() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        _buildLinkCard('images/facebook.jpg',
            'https://www.facebook.com/ibtesam.ansari070?ref=br_rs', 'Facebook'),
        SizedBox(width: 50.0),
        _buildLinkCard(
            'images/linkedin.png',
            'https://www.linkedin.com/in/ibtesam-ansari-768886159/',
            'Linkedin'),
        SizedBox(width: 50.0),
        _buildLinkCard(
            'images/gmail.png',
            'https://mail.google.com/mail/u/0/?view=cm&fs=1&to=ibtesamansari070@gmail.com&tf=1',
            'Email'),
        SizedBox(width: 50.0),
        _buildLinkCard(
            'images/github2.png', 'https://github.com/ibtesam123', 'Github'),
        SizedBox(width: 50.0),
        _buildLinkCard('images/quora.jpg',
            'https://www.quora.com/profile/Ibtesam-Ansari-1', 'Quora'),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: CustomColors.mainBGColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          _buildTitle(),
          _buildLinks(),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    'Made with',
                    style: TextStyle(color: Colors.white),
                  ),
                  Container(
                    height: 10.0,
                    width: 10.0,
                    margin: EdgeInsets.symmetric(horizontal: 3.0),
                    child: Image.asset(
                      'images/love.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                  Text(
                    'by Ibtesam Ansari.',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
