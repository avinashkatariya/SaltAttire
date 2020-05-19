import 'package:flutter/material.dart';
import 'package:saltattire/Data/new_arival.dart';
import 'package:saltattire/Models/new_arival.dart';
import 'package:saltattire/Values/style.dart';
import 'package:saltattire/Widget/custom_page_controller.dart';
import 'package:saltattire/Widget/new_arrival_widget.dart';

class NewArrivalPagerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<NewArrivalModel> _newArrivals = NewArrivals().getNewArrivals();
    
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
            color: Color(0xFF9e2526),
            child: Center(
              child: Text(
                "~New Arrivals~",
                 style: uptag,
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 450,
            child: CustomPageView.builder(
              controller: CustomPageController(
                viewportFraction: 0.8,
                keepCustomPage: false,
                initialCustomPage: 0,
              ),
              scrollDirection: Axis.horizontal,
              itemCount: _newArrivals.length + 2,
              itemBuilder: (BuildContext context, int index) {
                if (index == 0 || index == _newArrivals.length + 1) {
                  return Container();
                }
                double mLeft = index == 0 ? 8 : 4;
                double mRight = index == _newArrivals.length ? 8 : 4;
                return Container(
                  margin: EdgeInsets.only(left: mLeft, right: mRight),
                  child: NewArrivalWidget(
                    newArrivalModel: _newArrivals[index - 1],
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
