import 'package:device_info_plus/device_info_plus.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

Future<void> permissionRequest()async {
  var ans = false.obs;
  if (await Permission.storage.isGranted) {
    ans.value = true;
  } else {
    final plugin = DeviceInfoPlugin();
    final android = await plugin.androidInfo;
    final storageStatus = android.version.sdkInt > 28
        ? await [
        Permission.storage,
        Permission.audio,
      ].request()
        : PermissionStatus.granted;
    if (storageStatus == PermissionStatus.granted) {
      ans.value = true;
    } else {
      openAppSettings();
    }
  }
  
}

