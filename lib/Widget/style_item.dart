import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:saltattire/Models/explore.dart';


class StyleItemWidget extends StatelessWidget {
  final ExploreModel item;
  final bool isBig;

  const StyleItemWidget({Key key, this.item, this.isBig = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(int.parse(item.backgroundColor)),
      width: isBig
          ? MediaQuery.of(context).size.width
          : MediaQuery.of(context).size.width / 2,
      height: MediaQuery.of(context).size.width / 2,
      child: Center(
        child: Container(
          width: MediaQuery.of(context).size.width / 4,
          child: Text(
            item.title,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w600, fontSize: 16),
          ),
        ),
      ),
    );
  }
}
