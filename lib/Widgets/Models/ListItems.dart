import 'package:flutter/material.dart';

class ProductsModel {
  ProductsModel({this.productIcons, this.productSubtitle, this.onTap});
  final String productIcons;
  final String productSubtitle;
  final Function onTap;
}

final List productsicon = [
  ProductsModel(
    productIcons: "assets/images/icons8-costume-100.png",
    productSubtitle: "Fashion",
  ),
  ProductsModel(
    productIcons: "assets/images/acura_PNG129.png",
    productSubtitle: "Vehicles",
  ),
  ProductsModel(
    productIcons: "assets/images/bag.png",
    productSubtitle: "Jobs",
  ),
  ProductsModel(
      productIcons: "assets/images/icons8-cherry-100.png",
      productSubtitle: "Agriculture and Foods"),
  ProductsModel(
      productIcons: "assets/images/icons8-sofa-80.png",
      productSubtitle: "Home and Garden"),
  ProductsModel(
      productIcons: "assets/images/icons8-cv-80.png",
      productSubtitle: "Seeking Work - CV's"),
  ProductsModel(
      productIcons: "assets/images/petss.png",
      productSubtitle: "Animals and Pets"),
  ProductsModel(
      productIcons: "assets/images/icons8-teddy-bear-80.png",
      productSubtitle: "Babies & Kids"),
  ProductsModel(
    productIcons: "assets/images/icons8-monitor-80.png",
    productSubtitle: "Electronics",
  ),
  ProductsModel(
      productIcons: "assets/images/icons8-fire-extinguisher-80.png",
      productSubtitle: "Equipment and Tools"),
  ProductsModel(
      productIcons: "assets/images/business-handshake.png",
      productSubtitle: "Services"),
  ProductsModel(
      productIcons: "assets/images/tooools.png",
      productSubtitle: "Repair & Construction"),
  ProductsModel(
      productIcons: "assets/images/phonee.png",
      productSubtitle: "Phones & Tablets"),
  ProductsModel(
      productIcons: "assets/images/sports-ball-png-2.png",
      productSubtitle: "Sports and Hobbies"),
  ProductsModel(
      productIcons: "assets/images/lipss.png",
      productSubtitle: "Health and Beauty"),
  ProductsModel(
      productIcons: "assets/images/6_real-estate-logo-clipart_1100-791.png",
      productSubtitle: "Real Estate")
];

class CategoryListThumbnails {
  CategoryListThumbnails(
      {this.productIcons, this.productTitle, this.productSubtitle, this.arrow});

  final IconData arrow;
  final String productIcons;
  final String productSubtitle;
  final String productTitle;
}

final List vehiclescategorythumb = [
  CategoryListThumbnails(
      productIcons: "assets/images/car-png-images-1.png",
      productTitle: "Cars",
      productSubtitle: "55436 ads",
      arrow: Icons.arrow_forward_ios),
  CategoryListThumbnails(
      productIcons:
          "assets/images/car-jeep-tire-motor-vehicle-service-png-favpng-sDyfNRXAcyJ0KU6UntbEqP9c4.png",
      productTitle: "Vehicle Parts & Accessories",
      productSubtitle: "17095 ads",
      arrow: Icons.arrow_forward_ios),
  CategoryListThumbnails(
      productIcons: "assets/images/c7aea143f5bde830845eea627c27627c.png",
      productTitle: "Trucks & Trailers",
      productSubtitle: "2482 ads",
      arrow: Icons.arrow_forward_ios),
  CategoryListThumbnails(
      productIcons: "assets/images/yellow-and-black-bus-png-clip-art.png",
      productTitle: "Buses & Microbuses",
      productSubtitle: "2005 ads",
      arrow: Icons.arrow_forward_ios),
  CategoryListThumbnails(
      productIcons:
          "assets/images/kisspng-excavator-plant-heavy-machinery-jcb-excavator-5abd34d29dc1e7.7073078715223492666462.png",
      productTitle: "Heavy Equipment",
      productSubtitle: "1214 ads",
      arrow: Icons.arrow_forward_ios),
  CategoryListThumbnails(
      productIcons:
          "assets/images/kisspng-suzuki-hayabusa-motorcycle-orange-mountain-bikes-s-suzuki-hayabusa-sport-motorcycle-bike-5a7415220c2f81.5658031715175570260499.png",
      productTitle: "Motorcycles & Scooters",
      productSubtitle: "752 ads",
      arrow: Icons.arrow_forward_ios),
  CategoryListThumbnails(
      productIcons: "assets/images/download.png",
      productTitle: "Watercraft & Boats",
      productSubtitle: "235 ads",
      arrow: Icons.arrow_forward_ios),
];

class Company {
  int id;
  String name;

  Company(this.id, this.name);

  static List<Company> getCompanies() {
    return <Company>[
      Company(1, 'All Messages'),
      Company(2, 'Archived'),
      Company(3, 'Spam'),
    ];
  }
}
