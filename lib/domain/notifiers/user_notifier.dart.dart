import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import '../models/user_details_model.dart';
import '../services/hive_service.dart';
import '../services/session_service.dart';


class UserNotifier extends StateNotifier<UserDetailsModel?> {
  UserNotifier() : super(null) {
    loadUser();
  }


  Future<void> loadUser() async {
    final userId = await SessionService.getUserId();
    if (userId != null) {
      final user = await HiveService.getUser();
      state = user;
    } else {
      state = null;
    }
  }


  Future<void> refreshUser() async {
    await loadUser();
  }


  Future<void> updateUser(UserDetailsModel updatedUser) async {
    await HiveService.saveAge(updatedUser.age);
    await HiveService.saveGender(updatedUser.gender);
    await HiveService.saveRegion(updatedUser.region);
    await HiveService.saveInterests(updatedUser.interests);
    state = updatedUser;
  }


  Future<void> deleteUser() async {
    await HiveService.deleteUser();
    state = null;
  }
}


final userProvider =
    StateNotifierProvider<UserNotifier, UserDetailsModel?>((ref) {
  return UserNotifier();
});
