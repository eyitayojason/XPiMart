class ThumbsNailModel {
  ThumbsNailModel(
      {this.productDescription,
      this.subtitle,
      this.productThumbnails,
      this.price});
  final String subtitle;
  final String productThumbnails;
  final String productDescription;
  final String price;
}

List productThumbsNailsModel = [
  ThumbsNailModel(
    productThumbnails: "assets/images/cars3.jpg",
    subtitle: "Range Rover Sport S 2017",
    productDescription:
        "Luxurious and Highly Elegant Range Rover Sports 2017 Edition",
    price: "N5,000,000",
  ),
  ThumbsNailModel(
      productThumbnails: "assets/images/85.jpg",
      subtitle: "Citroen Cabrio 4WD",
      productDescription: "Beautiful 2 Door Citroen Cabrio Coupe with 4WD",
      price: "N1,200,000"),
  ThumbsNailModel(
    productThumbnails:
        "assets/images/2012-Honda-Accord-SE-sedan-front-three-quarter.jpg",
    subtitle: "2012 Honda Accord SE",
    productDescription:
        "Neat 2012 Honda Accord Sedan for Family trips and great road jorneys",
    price: "N1,000,000",
  ),
  ThumbsNailModel(
    productThumbnails:
        "assets/images/CR-Cars-InlineHero-2020-Toyota-Prius-AWD-f-11-19.jpg",
    subtitle: "Toyota Prius 2020 AWD",
    productDescription:
        "Latest New model Toyota Prius, an hybrid monster ride to rule the roads",
    price: "N2,770,000",
  ),
  ThumbsNailModel(
    productThumbnails: "assets/images/hero-1-1920.jpg",
    subtitle: "Mercedes CLK GT 2016",
    productDescription:
        "Strong Bullet proof Mercedes Benz CLK, Can withstand maximum impact hit",
    price: "N15,000,000",
  ),
  ThumbsNailModel(
    productThumbnails: "assets/images/cars4.jpg",
    subtitle: "Mercedes Benz GLK 2021",
    productDescription:
        "Probably the best car of 2020, TEsted with 98.2 percent fuel efficeincy and also hybrid electric vehicle",
    price: "N45,000,000",
  )
];

Map<String, String> produces = {
  "productThumbnails": "assets/images/cars3.jpg",
  "subtitle": "Range Rover Sport S 2017",
  "productDescription":
      "Luxurious and Highly Elegant Range Rover Sports 2017 Edition",
  "price": "N5,000,000",
};

//   productThumbnails: "assets/images/85.jpg",
//   subtitle: "Citroen Cabrio 4WD",
//   productDescription: "Beautiful 2 Door Citroen Cabrio Coupe with 4WD",
//   price: "N1,200,000"

// productThumbnails:
//     "assets/images/2012-Honda-Accord-SE-sedan-front-three-quarter.jpg",
// subtitle: "2012 Honda Accord SE",
// productDescription:
//     "Neat 2012 Honda Accord Sedan for Family trips and great road jorneys",
// price: "N1,000,000",

// productThumbnails:
//     "assets/images/CR-Cars-InlineHero-2020-Toyota-Prius-AWD-f-11-19.jpg",
// subtitle: "Toyota Prius 2020 AWD",
// productDescription:
//     "Latest New model Toyota Prius, an hybrid monster ride to rule the roads",
// price: "N2,770,000",

// productThumbnails: "assets/images/hero-1-1920.jpg",
// subtitle: "Mercedes CLK GT 2016",
// productDescription:
//     "Strong Bullet proof Mercedes Benz CLK, Can withstand maximum impact hit",
// price: "N15,000,000",

// productThumbnails: "assets/images/cars4.jpg",
// subtitle: "Mercedes Benz GLK 2021",
// productDescription:
//     "Probably the best car of 2020, TEsted with 98.2 percent fuel efficeincy and also hybrid electric vehicle",
// price: "N45,000,000",
