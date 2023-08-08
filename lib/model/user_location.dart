class UserLocation {
  final String city;
  final String state;
  final String country;
  final String postcode;
  final LocationStreet street;
  final LocationCordinates cordinates;
  final LocationTimeZone timezone;

  UserLocation({
    required this.city,
    required this.state,
    required this.country,
    required this.postcode,
    required this.street,
    required this.cordinates,
    required this.timezone,
  });

  factory UserLocation.fromMap(Map<String, dynamic> json) {
    final street = LocationStreet.fromMap(json['street']);
    final cordinates = LocationCordinates.fromMap(json['coordinates']);
    final timezone = LocationTimeZone.fromMap(json['timezone']);
    return UserLocation(
      city: json['city'],
      state: json['state'],
      country: json['country'],
      postcode: json['postcode'].toString(),
      street: street,
      cordinates: cordinates,
      timezone: timezone,
    );
  }
}

class LocationStreet {
  final int number;
  final String name;
  LocationStreet({
    required this.number,
    required this.name,
  });
  factory LocationStreet.fromMap(Map<String, dynamic> json) {
    return LocationStreet(name: json['name'], number: json['number']);
  }
}

class LocationCordinates {
  final String longitude;
  final String latitude;

  LocationCordinates({
    required this.longitude,
    required this.latitude,
  });
  factory LocationCordinates.fromMap(Map<String, dynamic> json) {
    return LocationCordinates(
        longitude: json['longitude'], latitude: json['latitude']);
  }
}

class LocationTimeZone {
  final String offset;
  final String description;
  LocationTimeZone({
    required this.offset,
    required this.description,
  });
  factory LocationTimeZone.fromMap(Map<String, dynamic> json) {
    return LocationTimeZone(
      offset: json['offset'],
      description: json['description'],
    );
  }
}
