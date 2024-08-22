class VehicleModel {
  final String modelName;
  final String manufacturer;
  final int year;
  final String color;
  final double price;
  final String engineType;
  final bool isElectric;
  final int capacity;
  final String fuelType;
  final String gearType;
  final String image;

  VehicleModel({
    required this.modelName,
    required this.manufacturer,
    required this.year,
    required this.color,
    required this.price,
    required this.engineType,
    this.isElectric = false,
    required this.capacity,
    required this.fuelType,
    required this.gearType,
    required this.image, required String name,
  });
}
