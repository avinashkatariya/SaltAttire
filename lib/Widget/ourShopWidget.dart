import 'package:flutter/material.dart';
import 'package:saltattire/Data/shop_item.dart';
import 'package:saltattire/Models/shop_item.dart';
import 'package:saltattire/Values/style.dart';
import 'package:saltattire/Widget/shop_item.dart';

class ShopItemPagerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<ShopItemModel> _shopItem = ShopItem().getShopItems();
    List<Widget> children = [];
    for (int i = 0; i < _shopItem.length; ++i) {
      if (i == 0) {
        children.add(ShopItemWidget(item: _shopItem[i],isBig: true,));
      } else {
        children.add(
          Row(
            children: [
              Expanded(child: ShopItemWidget(item: _shopItem[i],)),
              Expanded(child: ShopItemWidget(item: _shopItem[i+1],)),
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
                "~Our Shop~",
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
