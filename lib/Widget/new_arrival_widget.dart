import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:saltattire/Models/new_arival.dart';

class NewArrivalWidget extends StatelessWidget {
  final NewArrivalModel newArrivalModel;

  const NewArrivalWidget({Key key, this.newArrivalModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.network(newArrivalModel.imageUrl,width: MediaQuery.of(context).size.width*0.8,),
        Container(

          width: MediaQuery.of(context).size.width*0.6,
          padding: EdgeInsets.only(top:4),
          child: Text(
            newArrivalModel.name??"null",
            textAlign: TextAlign.center,
            textScaleFactor: 1.6,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.only(top:4),
          child: Text(
            newArrivalModel.usefor??"null",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.only(top:4),
          child: Text(
            newArrivalModel.price??"null",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }
}
