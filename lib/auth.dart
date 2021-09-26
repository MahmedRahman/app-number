import 'package:app_number/app/data/app_const.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

const KuserToken = 'usertoken';

class UserAuth extends GetxService {
  GetStorage storage = GetStorage();

  void setUserToken(String value) {
    storage.write(KuserToken, value);
  }

  String getUserToken() {
    String tokan;
    tokan = storage.read(KuserToken);

    if(tokan != null) {
      isLogin.value = true;
    } else {
      isLogin.value = false;
    }

    return tokan;
  }

  void signout() {
    setUserToken(null);
  }
}
