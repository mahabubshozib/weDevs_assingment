class Address {
  final String street1;
  final String street2;
  final String city;
  final String zip;
  final String country;
  final String state;

  Address({
    required this.street1,
    required this.street2,
    required this.city,
    required this.zip,
    required this.country,
    required this.state,
  });

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      street1: json['street_1'],
      street2: json['street_2'],
      city: json['city'],
      zip: json['zip'],
      country: json['country'],
      state: json['state'],
    );
  }
}