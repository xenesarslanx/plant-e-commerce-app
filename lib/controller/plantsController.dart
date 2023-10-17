import 'package:plant/model/plantsModel.dart';

class PlantsController {
  List<Plants> plantsList = [
    Plants(
      name: "luck jade plant",
      imageList: ["lib/assets/image1.png", "lib/assets/image2.png"],
      price: 12.99,
      isFav: false,
      description: "this plant is luck jade plant",
      size: "30cm - 40cm",
      id: 0,
    ),
    Plants(
      name: "snake plant",
      imageList: [
        "lib/assets/image2.png",
        "lib/assets/image1.png",
        "lib/assets/image1.png"
      ],
      price: 14.99,
      isFav: true,
      description: "this plant is snake plant",
      size: "50cm - 70cm",
      id: 1,
    ),
    Plants(
      name: "peperomia plant",
      imageList: ["lib/assets/image2.png", "lib/assets/image1.png"],
      price: 10.99,
      isFav: false,
      description: "this plant is snake plant",
      size: "50cm - 70cm",
      id: 2,
    ),
    Plants(
      name: "small plant",
      imageList: ["lib/assets/image2.png", "lib/assets/image1.png"],
      price: 19,
      isFav: true,
      description: "this plant is snake plant",
      size: "50cm - 70cm",
      id: 3,
    ),
    Plants(
      name: "luck jade plant",
      imageList: ["lib/assets/image1.png", "lib/assets/image2.png"],
      price: 12.99,
      isFav: false,
      description: "this plant is snake plant",
      size: "50cm - 70cm",
      id: 4,
    ),
    Plants(
      name: "snake plant",
      imageList: ["lib/assets/image1.png", "lib/assets/image2.png"],
      price: 14.99,
      isFav: true,
      description: "this plant is snake plant",
      size: "50cm - 70cm",
      id: 5,
    ),
    Plants(
      name: "peperomia plant",
      imageList: ["lib/assets/image1.png", "lib/assets/image2.png"],
      price: 10.99,
      isFav: false,
      description: "this plant is snake plant",
      size: "50cm - 70cm",
      id: 6,
    ),
    Plants(
      name: "small plant",
      imageList: ["lib/assets/image1.png", "lib/assets/image2.png"],
      price: 19,
      isFav: true,
      description: "this plant is snake plant",
      size: "50cm - 70cm",
      id: 7,
    ),
  ];
}
