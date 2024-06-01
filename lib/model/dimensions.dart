

class Dimensions {
  final String length;
  final String width;
  final String height;

  Dimensions({required this.length, required this.width, required this.height});

  factory Dimensions.fromJson(Map<String, dynamic> json) {
    return Dimensions(length: json['length'], width: json['width'], height: json['height']);
  }
}