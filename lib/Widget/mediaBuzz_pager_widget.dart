import 'dart:async';

import 'package:flutter/material.dart';
import 'package:saltattire/Data/media_buzz.dart';
import 'package:saltattire/Models/media_buzz.dart';
import 'package:saltattire/Values/style.dart';
import 'package:saltattire/Widget/custom_page_controller.dart';
import 'package:saltattire/Widget/mediabuzz_widget.dart';

class MediaBuzzPagerWidget extends StatefulWidget {
  @override
  _MediaBuzzPagerWidgetState createState() => _MediaBuzzPagerWidgetState();
}

class _MediaBuzzPagerWidgetState extends State<MediaBuzzPagerWidget> {
  List<MediaBuzzModel> _mediaBuzz = MediaBuzz().getMediaBuzz();
  int _currentPage = 0;
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
          if (_currentPage < _mediaBuzz.length) {
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
                "~Coverage~",
                style: uptag,
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.width * 0.7,
            child: CustomPageView.builder(
              controller: _customPageController,
              scrollDirection: Axis.horizontal,
              itemCount: _mediaBuzz.length + 2,
              onCustomPageChanged: (val){
                _currentPage = val-1;
              },
              itemBuilder: (BuildContext context, int index) {
                if (index == 0 || index == _mediaBuzz.length + 1) {
                  return Container();
                }
                
                double mLeft = index == 1 ? 8 : 4;
                double mRight = index == _mediaBuzz.length ? 8 : 4;
                return Container(
                  margin: EdgeInsets.only(left: mLeft, right: mRight),
                  child: MediaBuzzWidget(
                    mediaBuzzModel: _mediaBuzz[index - 1],
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
