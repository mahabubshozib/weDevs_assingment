class MetaData {
  final int id;
  final String key;
  final dynamic value;

  MetaData({required this.id, required this.key, required this.value});

  factory MetaData.fromJson(Map<String, dynamic> json) {
    return MetaData(id: json['id'], key: json['key'], value: json['value']);
  }
}