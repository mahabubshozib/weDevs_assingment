import 'address.dart';

class Store {
  final int id;
  final String name;
  final String url;
  final String avatar;
  final Address address;

  Store({
    required this.id,
    required this.name,
    required this.url,
    required this.avatar,
    required this.address,
  });

  factory Store.fromJson(Map<String, dynamic> json) {
    return Store(
      id: json['id'],
      name: json['name'],
      url: json['url'],
      avatar: json['avatar'],
      address: Address.fromJson(json['address']),
    );
  }
}
