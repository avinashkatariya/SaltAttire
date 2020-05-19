import 'dart:async';

import 'package:flutter/material.dart';
import 'package:saltattire/Data/testenomial.dart';
import 'package:saltattire/Models/testenomial.dart';
import 'package:saltattire/Widget/custom_page_controller.dart';
import 'package:saltattire/Widget/testimonial_item.dart';

class TestinomialsPagerWidget extends StatefulWidget {
  @override
  _TestinomialsPagerWidgetState createState() =>
      _TestinomialsPagerWidgetState();
}

class _TestinomialsPagerWidgetState extends State<TestinomialsPagerWidget> {
  int _currentPage = 0;
  List<TestinomialModel> _testinomials = Testinomial().getTestinomial();
  CustomPageController _customPageController;

  @override
  void initState() {
    _customPageController = CustomPageController(
      viewportFraction: 0.8,
      keepCustomPage: false,
      initialCustomPage: _currentPage,
    );
    super.initState();
    Timer.periodic(
      Duration(seconds: 3),
      (Timer timer) {
        if (_customPageController.hasClients) {
          if (_currentPage < _testinomials.length) {
            _currentPage++;
            _customPageController.animateToCustomPage(
              _currentPage,
              duration: Duration(milliseconds: 350),
              curve: Curves.easeIn,
            );
          } else {
            _currentPage = 0;
            _customPageController.jumpToCustomPage(_currentPage);
          }
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 32),
            width: MediaQuery.of(context).size.width * 0.5,
            padding: EdgeInsets.only(
              top: 16,
              bottom: 16,
            ),
            color: Color(0xFF333333),
            child: Center(
              child: Text(
                "~Reviews~",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 300,
            child: CustomPageView.builder(
              controller: _customPageController,
              scrollDirection: Axis.horizontal,
              onCustomPageChanged: (val){
                _currentPage = val-1;
              },
              itemCount: _testinomials.length + 2,
              itemBuilder: (BuildContext context, int index) {
                if (index == 0 || index == _testinomials.length + 1) {
                  return Container();
                }
                double mLeft = index == 0 ? 8 : 4;
                double mRight = index == _testinomials.length ? 8 : 4;
                return Container(
                  margin: EdgeInsets.only(left: mLeft, right: mRight),
                  child: TestimonialItem(
                    item: _testinomials[index - 1],
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
