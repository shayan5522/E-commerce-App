
import 'package:get/get.dart';

class PasswordController extends GetxController{
  RxBool obsecure = true.obs;

  togglePasswordVisibility(){
    obsecure.toggle();
  }
}