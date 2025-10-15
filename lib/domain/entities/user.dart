class User {
  final String id; // login.uuid
  final String name; // first name
  final int age; // dob.age
  final String city; // location.city
  final String imageLarge; // picture.large
  final String imageMedium; // picture.medium
  final String imageSmall;
  // picture.thumbnail
  final String country;

  const User({
    required this.id,
    required this.name,
    required this.age,
    required this.city,
    required this.imageLarge,
    required this.imageMedium,
    required this.imageSmall,
    required this.country,
  });
}
