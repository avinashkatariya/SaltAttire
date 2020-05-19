import 'package:saltattire/Models/new_arival.dart';

class NewArrivals {
  List<Map<String, dynamic>> newArrivalJson = [
    {
      'img_url':
          'https://saltattire.com/assets/Masks-CottonForChildren-PackFive/new.jpg',
      'item_name': 'COTTON MASKS - Pack of 5',
      'for': 'For Children',
      'price': '₹450'
    },
    {
      'img_url':
          'https://saltattire.com/assets/Masks-CottonElasticatedEarLoops-PackFive/new.jpg',
      'item_name': 'COTTON MASKS - Pack of 5',
      'for': 'Elasticated Ear Loops',
      'price': '₹450'
    },
    {
      'img_url':
          'https://saltattire.com/assets/Masks-CottonStripesChecks-PackFive/new.jpg',
      'item_name': 'COTTON MASKS - Pack of 5',
      'for': 'Stripes & Checks',
      'price': '₹450'
    },
    {
      'img_url':
          'https://saltattire.com/assets/Masks-CottonPastels-PackFive/new.jpg',
      'item_name': 'COTTON MASKS - Pack of 5',
      'for': 'Pastels',
      'price': '₹450'
    },
    {
      'img_url':
          'https://saltattire.com/assets/Dresses-Waffle-Dropshoulderdress/new.jpg',
      'item_name': 'Waffle',
      'for': 'Drop shoulder dress',
      'price': '₹2,650'
    },
    {
      'img_url':
          'https://saltattire.com/assets/Dresses-Cookie-Tuckdetailatthewaistbandsheathdress/new.jpg',
      'item_name': 'Cookie',
      'for': 'Tuck detail at the waistband sheath dress',
      'price': '₹2,795'
    },
    {
      'img_url':
          'https://saltattire.com/assets/Dresses-BlackSwan-Collarsheathdresswithbelt/new.jpg',
      'item_name': 'Black Swan',
      'for': 'Collar sheath dress with belt',
      'price': '₹2,850'
    },
    {
      'img_url':
          'https://saltattire.com/assets/Dresses-Bambi-V-Neckfrontbuttonopeningdetaildress/new.jpg',
      'item_name': 'Bambi',
      'for': 'V-Neck front button opening detail dress',
      'price': '₹2,850'
    },
    {
      'img_url':
          'https://saltattire.com/assets/Tops-Walnut-Flaresleevesv-necktop/new.jpg',
      'item_name': 'Walnut',
      'for': 'Flare sleeves v-neck top',
      'price': '₹1,950'
    },
    {
      'img_url':
          'https://saltattire.com/assets/Tops-Twinkle-Contrastpatchonneckandsleevestop/new.jpg',
      'item_name': 'Twinkle',
      'for': 'Contrast patch on neck and sleeves top',
      'price': '₹1,950'
    },
    {
      'img_url':
          'https://saltattire.com/assets/Tops-Honeycomb-Biasplacementsleevelesstop/new.jpg',
      'item_name': 'Honeycomb',
      'for': 'Bias placement sleeveless top',
      'price': '₹1,750'
    },
    {
      'img_url':
          'https://saltattire.com/assets/Shirts-DustyRose-Notchcollarshirt/new.jpg',
      'item_name': 'Dusty Rose',
      'for': 'Notch collar shirt',
      'price': '₹2,150'
    },
    {
      'img_url':
          'https://saltattire.com/assets/Shirts-Riddle-Raglansleeveshirt/new.jpg',
      'item_name': 'Riddle',
      'for': 'Raglan sleeve shirt',
      'price': '₹2,150'
    },
    {
      'img_url':
          'https://saltattire.com/assets/Tops-Sunflower-Scallopdetailtop/new.jpg',
      'item_name': 'Sunflower',
      'for': 'Scallop detail top',
      'price': '₹1,750'
    },
    {
      'img_url':
          'https://saltattire.com/assets/Dresses-PeachNougat-Fauxwrapdress/new.jpg',
      'item_name': 'Peach Nougat',
      'for': 'Faux wrap dress',
      'price': '₹2,895'
    },
    {
      'img_url':
          'https://saltattire.com/assets/Tops-SpringPeach-Sweetheartnecklinetop/new.jpg',
      'item_name': 'Spring Peach',
      'for': 'Sweetheart neckline top',
      'price': '₹1,850'
    },
    
  ];

  List<NewArrivalModel> getNewArrivals() {
    List<NewArrivalModel> newArrivals = [];
    newArrivalJson.forEach((element) {
      newArrivals.add(NewArrivalModel(element['img_url'], element['price'],
          element['item_name'], element['for']));
    });
    return newArrivals;
  }
}
