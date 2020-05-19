import 'package:flutter/material.dart';
import 'package:saltattire/Models/testenomial.dart';

class TestimonialItem extends StatelessWidget {
  final TestinomialModel item;

  const TestimonialItem({Key key, this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.7,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border(
                left: BorderSide(
                  color: Colors.white24,
                  width: 4,
                ),
                right: BorderSide(
                  color: Colors.white24,
                  width: 4,
                ),
                top: BorderSide(
                  color: Colors.white24,
                  width: 4,
                ),
              ),
            ),
            padding: EdgeInsets.only(top: 16, left: 16, right: 16),
            child: Text(
              item.post,
              style: TextStyle(color: Colors.white),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border(
                left: BorderSide(
                  color: Colors.white24,
                  width: 4,
                ),
                right: BorderSide(
                  color: Colors.white24,
                  width: 4,
                ),
                bottom: BorderSide(
                  color: Colors.white24,
                  width: 4,
                ),
              ),
            ),
            padding: EdgeInsets.only(top: 16, left: 16, right: 16,bottom: 16),
            child: Row(
              children: [
                IconButton(onPressed: (){},
                icon: Image.asset("assets/images/fb-icon-color.png"),),
                Expanded(
                  child: Container(),
                ),
                Wrap(
                  direction: Axis.vertical,
                  children: [
                    Text(
                      "- ${item.author}",
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      item.dateTime,
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
