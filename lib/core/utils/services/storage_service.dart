import 'package:get_storage/get_storage.dart';

class StorageService {
  final GetStorage _box = GetStorage();

  void setData(String key, dynamic value) {
    _box.write(key, value);
  }

  dynamic getData(String key) {
    return _box.read(key);
  }

  void removeData(String key) {
    _box.remove(key);
  }

  void eraseData() {
    _box.erase();
  }
}
