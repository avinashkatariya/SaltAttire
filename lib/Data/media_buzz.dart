import 'package:saltattire/Models/media_buzz.dart';

class MediaBuzz {
  List<Map<String, String>> mediaBuzzJson = [
    {
      'name': 'The Ecnomics Time',
      'logo':
          'https://saltattire.com/assets/images/media/the-economic-times/logo/economic_times.png',
      'buzz': 'SALT offers tailored clothing to customer measurements'
    },
    {
      'name': 'India Today',
      'logo':
          'https://saltattire.com/assets/images/media/india-today/logo/india_today.png',
      'buzz': 'Power dressing has changed'
    },
    {
      'name': 'LLB',
      'logo': 'https://saltattire.com/assets/images/media/lbb/logo/lbb.png',
      'buzz': 'Bored of your usual corporate looks?'
    },
    {
      'name': 'News 18',
      'logo':
          'https://saltattire.com/assets/images/media/news-18/logo/news_18.png',
      'buzz':
          '...quick and easy way to take your work look from formal to exceptional.'
    },
    {
      'name': 'Yourstory',
      'logo':
          'https://saltattire.com/assets/images/media/yourstory/logo/yourstory.png',
      'buzz': 'Salt, that ingredient so essential for balance'
    },
    {
      'name': 'Buisness Standard',
      'logo':
          'https://saltattire.com/assets/images/media/business-standard/logo/business_standard.png',
      'buzz': 'Turn monotonous office wear into party ready look'
    },
    {
      'name': 'Bloomberg Quint',
      'logo':
          'https://saltattire.com/assets/images/media/bloomberg-quint/logo/bloomberg_quint.png',
      'buzz': 'A ‘9AM-9PM’ Clothing Brand'
    },
    {
      'name': 'The New Indian Express',
      'logo':
          'https://saltattire.com/assets/images/media/the-new-india-express/logo/the_new_india_express.png',
      'buzz': 'One-stop shop for all your clothing needs'
    },
    {
      'name': 'Vogue',
      'logo': 'https://saltattire.com/assets/images/media/vogue/logo/vogue.png',
      'buzz': '...refreshing take on workwear'
    },
    {
      'name': 'Buisness Telegraph',
      'logo':
          'https://saltattire.com/assets/images/media/business-telegraph/logo/business_telegraph.png',
      'buzz': 'SALT Attire has launched its first offline experience store'
    },
    {
      'name': 'Inside Retail Asia',
      'logo':
          'https://saltattire.com/assets/images/media/inside-retail-asia/logo/inside_retail_asia.png',
      'buzz': 'Salt Attire offers bespoke clothing'
    },
    {
      'name': 'Fibre2Fashion',
      'logo':
          'https://saltattire.com/assets/images/media/fibre-2-fashion/logo/fibre_2_fashion.png',
      'buzz': 'on-demand manufacturing allows the customer to get the best fit'
    },
    {
      'name': 'Start Up Success Stories',
      'logo':
          'https://saltattire.com/assets/images/media/start-up-success-stories/logo/start_up_success_stories.png',
      'buzz': 'Variety of designs that are work appropriate'
    },
    {
      'name': 'Silicon India',
      'logo':
          'https://saltattire.com/assets/images/media/silicon-india/logo/silicon_india.png',
      'buzz': 'Best Workwear for Women to Outshine your Co-workers'
    },
    {
      'name': 'India Retailing',
      'logo':
          'https://saltattire.com/assets/images/media/india-retailing/logo/india_retailing.png',
      'buzz': 'Premium collections of workwear apparel'
    },
    {
      'name': 'Apparel Magazine',
      'logo':
          'https://saltattire.com/assets/images/media/apparel-magazine/logo/apparel_magazine.png',
      'buzz': 'Monsoon is a perfect season to wear bold and cheerful colours'
    },
    {
      'name': 'Fashion Network',
      'logo':
          'https://saltattire.com/assets/images/media/fashion-network/logo/fashion_network.png',
      'buzz':
          'Salt Attire enters to offline market with its first physical store in Gurugram'
    },
    {
      'name': 'Retail 4 Growth',
      'logo':
          'https://saltattire.com/assets/images/media/retail-4-growth/logo/retail_4_growth.png',
      'buzz': 'Popular for its ready-to-pick garments'
    },
    {
      'name': 'India Retailing',
      'logo':
          'https://saltattire.com/assets/images/media/india-retailing/logo/india_retailing.png',
      'buzz': 'A trend which is especially seen in metro cities'
    },
    {
      'name': 'LLB',
      'logo': 'https://saltattire.com/assets/images/media/lbb/logo/lbb.png',
      'buzz': 'Up Your Style Game At Work From This Store In G-Town'
    }
  ];

  List<MediaBuzzModel> getMediaBuzz() {
    List<MediaBuzzModel> mBuzz = [];
    mediaBuzzJson.forEach((element) {
      mBuzz.add(MediaBuzzModel(
        element['logo'],
        element['buzz'],
        element['name'],
      ));
    });
    return mBuzz;
  }
}
