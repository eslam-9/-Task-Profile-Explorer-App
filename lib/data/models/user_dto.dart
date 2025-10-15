import '../../domain/entities/user.dart';

class UserDto {
  final String id;
  final String firstName;
  final int age;
  final String city;
  final String imageLarge;
  final String imageMedium;
  final String imageSmall;
  final String country;

  UserDto({
    required this.id,
    required this.firstName,
    required this.age,
    required this.city,
    required this.imageLarge,
    required this.imageMedium,
    required this.imageSmall,
    required this.country,
  });

  factory UserDto.fromJson(Map<String, dynamic> json) {
    return UserDto(
      id: json['login']?['uuid'] as String,
      firstName: json['name']?['first'] as String,
      age: (json['dob']?['age'] as num).toInt(),
      city: json['location']?['city'] as String,
      country: json['location']?['country'] as String,
      imageLarge: json['picture']?['large'] as String,
      imageMedium: json['picture']?['medium'] as String,
      imageSmall: json['picture']?['thumbnail'] as String,
    );
  }

  User toEntity() => User(
    id: id,
    name: firstName,
    age: age,
    city: city,
    imageLarge: imageLarge,
    imageMedium: imageMedium,
    imageSmall: imageSmall,
    country: country,
  );
}
