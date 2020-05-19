import 'package:flutter/material.dart';
import 'package:saltattire/Models/media_buzz.dart';

class MediaBuzzWidget extends StatelessWidget {
  final MediaBuzzModel mediaBuzzModel;

  const MediaBuzzWidget({Key key, this.mediaBuzzModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      height: MediaQuery.of(context).size.width * 0.7,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(width: 8, color: Color(0xFFc89e72)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 1,
            child: Center(
              child: Container(
                  margin: EdgeInsets.only(top: 8, left: 16, right: 16),
                  child: Text(
                    "\"${mediaBuzzModel.buzz}\"",
                    textScaleFactor: 1.2,
                    textAlign: TextAlign.center,
                  )),
            ),
          ),
          Expanded(
            flex: 4,
            child: Image.network(
              mediaBuzzModel.logoUrl,
              width: MediaQuery.of(context).size.width * 0.5,
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 8, bottom: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "- ${mediaBuzzModel.name}",
                  textScaleFactor: 1.2,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
