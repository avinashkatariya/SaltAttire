import 'package:saltattire/Models/looks.dart';

class Looks {
  List<Map<String, String>> looksJson = [
    {
      'img': 'https://saltattire.com/assets/look-429/Full.v1.jpg',
      'background-color': '0xFF0c172f',
      'heading': 'Waffel',
      'subtitle': 'Waffel'
    },
    {
      'img': 'https://saltattire.com/assets/look-427/Full.v1.jpg',
      'background-color': '0xFF38255d',
      'heading': 'Black Swan',
      'subtitle': 'Black Swan'
    },
    {
      'img': 'https://saltattire.com/assets/look-426/Full.v1.jpg',
      'background-color': '0xFF1f5f61',
      'heading': 'Bambi',
      'subtitle': 'Bambi'
    },
    {
      'img': 'https://saltattire.com/assets/look-425/Full.v1.jpg',
      'background-color': '0xFF4d2323',
      'heading': 'Twinkle',
      'subtitle': 'Twinkle,Generous-Black'
    },
    {
      'img': 'https://saltattire.com/assets/look-424/Full.v1.jpg',
      'background-color': '0xFF3f3934',
      'heading': 'Walnut',
      'subtitle': 'Walnut,Refiend'
    },
    {
      'img': 'https://saltattire.com/assets/look-423/Full.v1.jpg',
      'background-color': '0xFF884808',
      'heading': 'Dusty Rose',
      'subtitle': 'Dusty Rose,Refiend'
    },
    {
      'img': 'https://saltattire.com/assets/look-422/Full.v1.jpg',
      'background-color': '0xFF583714',
      'heading': 'Riddle',
      'subtitle': 'Riddle,Generous-Black'
    },
    {
      'img': 'https://saltattire.com/assets/look-421/Full.v1.jpg',
      'background-color': '0xFF100d2d',
      'heading': 'Honeycomb',
      'subtitle': 'Honeycomb,Generous-Black'
    },
  ];
  List<LooksModel> getLooks() {
    List<LooksModel> newArrivals = [];
    looksJson.forEach((element) {
      newArrivals.add(LooksModel(
        element['img'],
        element['background-color'],
        element['heading'],
        element['subtitle'],
      ));
    });
    return newArrivals;
  }
}
