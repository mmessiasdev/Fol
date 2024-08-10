import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LocalAuthService {
  final _storage = FlutterSecureStorage();

  Future<void> storeToken(String token) async {
    await _storage.write(key: "token", value: token);
  }

  Future<String?> getSecureToken(String token) async {
    return await _storage.read(key: "token");
  }

  Future storeAccount({
    required String email,
    required String lname,
    required int id,
    required int chunk,
  }) async {
    await _storage.write(key: "id", value: id.toString());
    await _storage.write(key: "email", value: email);
    await _storage.write(key: "lname", value: lname);
    await _storage.write(key: "chunkId", value: chunk.toString());
  }

  Future<String?> getEmail(String unicKey) async {
    return await _storage.read(key: "email");
  }

  Future<String?> getId(String unicKey) async {
    return await _storage.read(key: "id");
  }

  Future<String?> getChunkId(String unicKey) async {
    return await _storage.read(key: "chunkId");
  }

  Future<String?> getLname(String unicKey) async {
    return await _storage.read(key: "lname");
  }

  Future<void> clear() async {
    await _storage.deleteAll();
  }
}
