import 'dart:convert';

import 'package:authentications/services/configs/entity_service.dart';
import 'package:authentications/services/prefs/storage_service.dart';
import 'package:get/get.dart';

import '../../models/user/user_model.dart';

class UserService extends GetxController{

  StorageService get storageService => Get.find<StorageService>();

  Future<UserModel> createUser(UserModel user) async{
    final data = user.toJson();
    await _storeUserToStorage(jsonEncode(user.toJson()));
    return user;
  }

  Future<UserModel?> updateUser(UserModel user, int id) async{
    user.id = id;
    return user;
  }

  _storeUserToStorage(String data) async{
    await storageService.storage.write(key: 'user', value: data);
  }

}