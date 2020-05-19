import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:saltattire/Models/shop_item.dart';

class ShopItemWidget extends StatelessWidget {
  final ShopItemModel item;
  final bool isBig;

  const ShopItemWidget({Key key, this.item, this.isBig = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: isBig
          ? MediaQuery.of(context).size.width
          : MediaQuery.of(context).size.width / 2,
      height: MediaQuery.of(context).size.width / 2,
      child: Stack(
        children: [
          Image.network(item.imageUrl,
            fit: BoxFit.fill,
          ),
          Container(
            color: Color(0x66000000),
            width: isBig
                ? MediaQuery.of(context).size.width
                : MediaQuery.of(context).size.width / 2,
            height: MediaQuery.of(context).size.width / 2,
          ),
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width / 4,
              child: Text(
                item.title,
                textAlign: TextAlign.center,

                style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 16),
              ),
            ),
          )
        ],
      ),
    );
  }
}
