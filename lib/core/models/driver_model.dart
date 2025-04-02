class Driver {
  String name;
  String vehicle;
  List<String> categories;

  Driver({required this.name, required this.vehicle, required this.categories});

  factory Driver.fromJson(Map<String, dynamic> json) {
    return Driver(
      name: json['name'],
      vehicle: json['vehicle'],
      categories: List<String>.from(json['categories']),
    );
  }
}
