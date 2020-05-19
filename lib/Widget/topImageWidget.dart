import 'dart:async';

import 'package:flutter/material.dart';

class TopImageWidget extends StatefulWidget {
  @override
  _TopImageWidgetState createState() => _TopImageWidgetState();
}

class _TopImageWidgetState extends State<TopImageWidget> {
  int _currentPage = 0;
  PageController _pageController = PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 5), (Timer timer) {
      if (_pageController.hasClients) {
        if (_currentPage < 8) {
          _currentPage++;
          _pageController.animateToPage(
            _currentPage,
            duration: Duration(milliseconds: 350),
            curve: Curves.easeIn,
          );
        } else {
          _currentPage = 0;
          _pageController.animateToPage(
            8,
            duration: Duration(milliseconds: 350),
            curve: Curves.easeIn,
          );
          _pageController.jumpToPage(_currentPage);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.width * 1.78,
        child: PageView(
          controller: _pageController,
          scrollDirection: Axis.horizontal,
          onPageChanged: (v) {
            _currentPage = v;
          },
          children: [
            Image.asset("assets/images/mask.jpg"),
            Image.asset("assets/images/giftcard_v2.jpg"),
            Image.asset("assets/images/moyo_v9.jpg"),
            Image.asset("assets/images/moyo_v8.jpg"),
            Image.asset("assets/images/moyo_v6.jpg"),
            Image.asset("assets/images/moyo_v5.jpg"),
            Image.asset("assets/images/kapaas_v3.jpg"),
            Image.asset("assets/images/poruka_v1.jpg"),
            Image.asset("assets/images/mask.jpg"),
          ],
        ));
  }
}
