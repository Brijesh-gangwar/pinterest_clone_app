import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/user_details_model.dart';

class HiveService {
  static const String _boxName = 'userBox';

  /// Initialize Hive (call this in main)
  static Future<void> init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(UserDetailsModelAdapter());
    await Hive.openBox<UserDetailsModel>(_boxName);
  }

  static Box<UserDetailsModel> get _box =>
      Hive.box<UserDetailsModel>(_boxName);

  /// Get Clerk userId from SharedPreferences
  static Future<String?> _getUserId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString("userId");
  }

  /// Get full user model
  static Future<UserDetailsModel?> getUser() async {
    final userId = await _getUserId();
    if (userId == null) return null;
    return _box.get(userId);
  }

  /// Save or update Age
  static Future<void> saveAge(String dob) async {
    final userId = await _getUserId();
    if (userId == null) return;

    final existingUser = _box.get(userId);

    final updatedUser = UserDetailsModel(
      userId: userId,
      age: dob,
      gender: existingUser?.gender ?? "",
      region: existingUser?.region ?? "",
      interests: existingUser?.interests ?? [],
    );

    await _box.put(userId, updatedUser);
  }

  /// Save or update Gender
  static Future<void> saveGender(String gender) async {
    final userId = await _getUserId();
    if (userId == null) return;

    final existingUser = _box.get(userId);

    final updatedUser = UserDetailsModel(
      userId: userId,
      age: existingUser?.age ?? "",
      gender: gender,
      region: existingUser?.region ?? "",
      interests: existingUser?.interests ?? [],
    );

    await _box.put(userId, updatedUser);
  }

  /// Save or update Region
  static Future<void> saveRegion(String region) async {
    final userId = await _getUserId();
    if (userId == null) return;

    final existingUser = _box.get(userId);

    final updatedUser = UserDetailsModel(
      userId: userId,
      age: existingUser?.age ?? "",
      gender: existingUser?.gender ?? "",
      region: region,
      interests: existingUser?.interests ?? [],
    );

    await _box.put(userId, updatedUser);
  }

  /// Save or update Interests
  static Future<void> saveInterests(List<String> interests) async {
    final userId = await _getUserId();
    if (userId == null) return;

    final existingUser = _box.get(userId);

    final updatedUser = UserDetailsModel(
      userId: userId,
      age: existingUser?.age ?? "",
      gender: existingUser?.gender ?? "",
      region: existingUser?.region ?? "",
      interests: interests,
    );

    await _box.put(userId, updatedUser);
  }

  /// Delete user completely
  static Future<void> deleteUser() async {
    final userId = await _getUserId();
    if (userId == null) return;
    await _box.delete(userId);
  }

  /// Check if profile exists
  static Future<bool> userExists() async {
    final userId = await _getUserId();
    if (userId == null) return false;
    return _box.containsKey(userId);
  }
}
