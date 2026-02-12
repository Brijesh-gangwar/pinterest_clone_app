import 'package:hive/hive.dart';

part 'user_details_model.g.dart';

@HiveType(typeId: 0)
class UserDetailsModel extends HiveObject {
  @HiveField(0)
  String userId;

  @HiveField(1)
  String age;

  @HiveField(2)
  String gender;

  @HiveField(3)
  String region;

  @HiveField(4)
  List<String> interests;

  UserDetailsModel({
    required this.userId,
    required this.age,
    required this.gender,
    required this.region,
    required this.interests,
  });
}
