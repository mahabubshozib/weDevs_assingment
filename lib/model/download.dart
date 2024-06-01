class Download {
  final String id;
  final String name;
  final String file;

  Download({required this.id, required this.name, required this.file});

  factory Download.fromJson(Map<String, dynamic> json) {
    return Download(id: json['id'], name: json['name'], file: json['file']);
  }
}
