class CampModel {
  final String name, image, location;

  CampModel({required this.name, required this.image, required this.location});
}

List<CampModel> demoCampData = [
  CampModel(
    name: "Camp One",
    image: "campOne.jpeg",
    location: "Myanmar",
  ),
  CampModel(
    name: "Camp Two",
    image: "campTwo.jpeg",
    location: "Thailand",
  ),
  CampModel(
    name: "Camp Three",
    image: "campThree.jpeg",
    location: "Indonesia",
  ),
];
