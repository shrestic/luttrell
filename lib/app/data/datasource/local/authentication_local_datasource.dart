import 'package:luttrell/app/settings/keys.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';

import '../../models/models.dart';

abstract class AuthenticationLocalDatasource {
  Future<void> saveUser(User user);

  Future<User?> getUser();

  Future<void> saveAccessToken(String accessToken);

  Future<void> saveRefreshToken(String refreshToken);

  Future<String> getAccessToken();

  Future<String> getRefreshToken();

  Future<void> clearAuthSession();
}

@Injectable(as: AuthenticationLocalDatasource)
class AuthenticationLocalDatasourceDefault
    extends AuthenticationLocalDatasource {
  @override
  Future<void> saveUser(User user) async {
    final box = Hive.box(AppStorageKey.BOX);
    await box.put(AppStorageKey.USER, user.toJson());
  }

  @override
  Future<User?> getUser() async {
    final box = Hive.box(AppStorageKey.BOX);
    var data = box.get(AppStorageKey.USER);

    return data != null ? User.fromJson(Map<String, dynamic>.from(data)) : null;
  }

  @override
  Future<void> saveAccessToken(String accessToken) async {
    final box = Hive.box(AppStorageKey.BOX);
    await box.put(AppStorageKey.ACCESS_TOKEN, accessToken);
  }

  @override
  Future<void> saveRefreshToken(String refreshToken) async {
    final box = Hive.box(AppStorageKey.BOX);
    await box.put(AppStorageKey.REFRESH_TOKEN, refreshToken);
  }

  @override
  Future<String> getAccessToken() async {
    final box = Hive.box(AppStorageKey.BOX);
    final accessToken = box.get(AppStorageKey.ACCESS_TOKEN);

    return accessToken ?? '';
  }

  @override
  Future<String> getRefreshToken() async {
    final box = Hive.box(AppStorageKey.BOX);
    final accessToken = box.get(AppStorageKey.REFRESH_TOKEN);

    return accessToken ?? '';
  }

  @override
  Future<void> clearAuthSession() async {
    final box = Hive.box(AppStorageKey.BOX);
    box.delete(AppStorageKey.ACCESS_TOKEN);
    box.delete(AppStorageKey.REFRESH_TOKEN);
    box.delete(AppStorageKey.USER);
  }
}
