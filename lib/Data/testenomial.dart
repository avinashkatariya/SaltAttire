import 'package:saltattire/Models/testenomial.dart';

class Testinomial {
  List<Map<String, String>> testenomialJson = [
    {
      "post":
          "I loved the quality of the fabric. The customer service is amazing. The top which I got looks amazing on me. Really very happy!!! :)",
      "author": "Sarika Sinha",
      "dateTime": "03/09/2019 09:10",
    },
    {
      "post":
          "Thank you Salt for finally providing dresses that I have been hunting for forever in the Indian market. Cool, polished, professional, and feminine - your dress fit me like a dream! Recommend the sheath dress Deep to anyone looking for the House of Cards Robin Wright look.",
      "author": "Namita Anand",
      "dateTime": "09/08/2018 18:38",
    },
    {
      "post":
          "Elegant designs,fine cut and fabric and over the top is their customer service.You guys have won a customer for life.Added bonanza is their custom made fits",
      "author": "Susheela Panduri",
      "dateTime": "13/07/2019 22:02",
    },
    {
      "post":
          "A friend of mine shared your Insta link last month so I got to know about it. I was not sure how the fitting would come out, at first. But I was so happy with the stitching. Its way better than the readymade dresses from well known brands like Allen Solly, AND, The label life. The dresses are reasonable and not over the top expensive like that of Fable Street.You have earned a lifelong customer. I will look nowhere except SALT attire.",
      "author": "Soumya Suratkal",
      "dateTime": "09/09/2019 09:28",
    },
    {
      "post":
          "I loved the quality of the fabric. The customer service is amazing. The top which I got looks amazing on me. Really very happy!!! :)",
      "author": "Sarika Sinha",
      "dateTime": "03/09/2019 09:10",
    }
  ];

  List<TestinomialModel> getTestinomial() {
    List<TestinomialModel> newArrivals = [];
    testenomialJson.forEach((element) {
      newArrivals.add(TestinomialModel(
          element['post'], element['author'], element['dateTime']));
    });
    return newArrivals;
  }
}
