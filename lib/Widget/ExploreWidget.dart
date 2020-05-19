import 'package:flutter/material.dart';
import 'package:saltattire/Data/explore.dart';
import 'package:saltattire/Models/explore.dart';
import 'package:saltattire/Values/style.dart';
import 'package:saltattire/Widget/style_item.dart';

class ExplorePagerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<ExploreModel> _shopItem = Explore().getExplore();
    List<Widget> children = [];
    for (int i = 0; i < _shopItem.length; ++i) {
      if (i == 0) {
        children.add(StyleItemWidget(
          item: _shopItem[i],
          isBig: true,
        ));
      } else {
        children.add(
          Row(
            children: [
              Expanded(
                  child: StyleItemWidget(
                item: _shopItem[i],
              )),
              Expanded(
                  child: StyleItemWidget(
                item: _shopItem[i + 1],
              )),
            ],
          ),
        );
        i++;
      }
    }

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
                "~Explore~",
                style: uptag,
              ),
            ),
          ),
          Container(
              child: Wrap(
            children: children,
          ))
        ],
      ),
    );
  }
}
