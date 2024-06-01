class Attribute {
  final int id;
  final String slug;
  final String name;
  final int position;
  final bool visible;
  final bool variation;
  final List<String> options;

  Attribute({
    required this.id,
    required this.slug,
    required this.name,
    required this.position,
    required this.visible,
    required this.variation,
    required this.options,
  });

  factory Attribute.fromJson(Map<String, dynamic> json) {
    return Attribute(
      id: json['id'],
      slug: json['slug'],
      name: json['name'],
      position: json['position'],
      visible: json['visible'],
      variation: json['variation'],
      options: List<String>.from(json['options']),
    );
  }
}