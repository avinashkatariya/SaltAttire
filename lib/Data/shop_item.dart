import 'package:saltattire/Models/shop_item.dart';

class ShopItem {
  List<Map<String, String>> shopItemJson = [
    {
      "heading": "Dresses",
      "img": "https://saltattire.com/assets/images/mob/home-category/dresses.jpg",
    },
    {
      "heading": "Tops",
      "img": "https://saltattire.com/assets/images/mob/home-category/tops.jpg",
    },
    {
      "heading": "Shirts",
      "img": "https://saltattire.com/assets/images/mob/home-category/shirts.jpg",
    },
    {
      "heading": "Tunics",
      "img": "https://saltattire.com/assets/images/mob/home-category/tunics.jpg",
    },
    {
      "heading": "Tailored Pants",
      "img": "https://saltattire.com/assets/images/mob/home-category/pants.jpg",
    },
    {
      "heading": "Tailored Skirts",
      "img": "https://saltattire.com/assets/images/mob/home-category/skirts.jpg",
    },
    {
      "heading": "Jackets",
      "img":
          "https://saltattire.com/assets/images/mob/home-category/outerwear.jpg",
    },
    {
      "heading": "Jumpsuits",
      "img":
          "https://saltattire.com/assets/images/mob/home-category/jumpsuits.jpg",
    },
    {
      "heading": "Scarves",
      "img":
          "https://saltattire.com/assets/images/mob/home-category/scarves.jpg",
    },
    {
      "heading": "Belts",
      "img": "https://saltattire.com/assets/images/mob/home-category/belts.jpg",
    },
    {
      "heading": "Jewellery",
      "img":
          "https://saltattire.com/assets/images/mob/home-category/jewellery_v1.jpg",
    },
    {
      "heading": "Masks",
      "img": "https://saltattire.com/assets/images/mob/home-category/masks.jpg",
    },
    {
      "heading": "Giftcards",
      "img":
          "https://saltattire.com/assets/images/mob/home-category/giftcards_v1.jpg",
    },
  ];

  List<ShopItemModel> getShopItems() {
    List<ShopItemModel> newArrivals = [];
    shopItemJson.forEach((element) {
      newArrivals.add(ShopItemModel(element['img'], element['heading']));
    });

    return newArrivals;
  }

}
