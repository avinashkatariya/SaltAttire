import 'package:saltattire/Models/explore.dart';

class Explore{
  List<Map<String,String>> exploreJson = [
    {
      "background_color": "0xFFbdb1a2",
      "title":"Our Picks For Winter",
    },
     {
      "background_color": "0xFF0c172f",
      "title":"Polka Dots",
    },
     {
      "background_color": "0xFFa43941",
      "title":"Stripes",
    },
    {
      "background_color": "0xFF38255d",
      "title":"Boardroom Dresses",
    },
     {
      "background_color": "0xFF1f5f61",
      "title":"Crisp Formal",
    },
     {
      "background_color": "0xFF4d2323",
      "title":"Work To Wine Dresses",
    },
    {
      "background_color": "0xFF5b4d46",
      "title":"Comfort Blouses",
    },
     {
      "background_color": "0xFF101f2f",
      "title":"Pastels Hues",
    },
     {
      "background_color": "0xFFbdb1a2",
      "title":"Deep Colors",
    },
    
  ];

  List<ExploreModel> getExplore() {                                               
    List<ExploreModel> newArrivals = [];
    exploreJson.forEach((element) {
      newArrivals.add(ExploreModel(
        element['background_color'],
        element['title'],
      ));
    });
    return newArrivals;
  }
}