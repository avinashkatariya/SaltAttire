import 'package:flutter/material.dart';
import 'package:saltattire/Data/looks.dart';
import 'package:saltattire/Models/looks.dart';
import 'package:saltattire/Values/style.dart';

class LookPagerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<LooksModel> _looks = Looks().getLooks();
    List<Widget> children = [];
    for (int i = 0; i < _looks.length; ++i) {
      if (i % 2 == 0) {
        children.add(
          Row(
            children: [
              Expanded(
                child: Image.network(_looks[i].imageUrl),
              ),
              Expanded(
                child: Container(
                  height: MediaQuery.of(context).size.width * 0.5,
                  color: Color(int.parse(_looks[i].backgroundColor)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        _looks[i].title,
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 4),
                        child: Text(
                          _looks[i].subTitle,
                          style: TextStyle(fontSize: 14, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      } else {
        children.add(
          Row(
            children: [
              Expanded(
                child: Container(
                  height: MediaQuery.of(context).size.width * 0.5,
                  color: Color(int.parse(_looks[i].backgroundColor)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        _looks[i].title,
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 4),
                        child: Text(
                          _looks[i].subTitle,
                          style: TextStyle(fontSize: 14, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Image.network(_looks[i].imageUrl),
              ),
            ],
          ),
        );
      }
    }

    children.add(
      Container(
        padding: EdgeInsets.only(top: 8, bottom: 8),
        color: Colors.black,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              ">   TAP FOR MORE   <",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ],
        ),
      ),
    );

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
