class Image {
  final int id;
  final String dateCreated;
  final String dateCreatedGmt;
  final String dateModified;
  final String dateModifiedGmt;
  final String src;
  final String name;
  final String alt;
  final int position;

  Image({
    required this.id,
    required this.dateCreated,
    required this.dateCreatedGmt,
    required this.dateModified,
    required this.dateModifiedGmt,
    required this.src,
    required this.name,
    required this.alt,
    required this.position,
  });

  factory Image.fromJson(Map<String, dynamic> json) {
    return Image(
      id: json['id'],
      dateCreated: json['date_created'],
      dateCreatedGmt: json['date_created_gmt'],
      dateModified: json['date_modified'],
      dateModifiedGmt: json['date_modified_gmt'],
      src: json['src'],
      name: json['name'],
      alt: json['alt'],
      position: json['position'],
    );
  }
}