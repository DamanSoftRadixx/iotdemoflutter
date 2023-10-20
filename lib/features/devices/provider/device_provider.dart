
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:iotdemoflutter/Core/Firebase/firebase.dart';

class DeviceProvider {

  Future<DocumentReference?> addDeviceList(
      {required String devicename, required String deviceid}) async {
    final DocumentReference? result = await AuthenticationHelper()
        .addDevices(devicename: devicename, deviceid: deviceid);
    return result;
  }

  updateDevice(
      {required String devicename,
      required String deviceid,
      required String deviceUid}) async {
    final DocumentReference? result = await AuthenticationHelper()
        .updateDevices(
            devicename: devicename, deviceid: deviceid, deviceuid: deviceUid);
    return result;
  }

  updateDeviceStatus(
      {required bool status,
        required String deviceUid}) async {
    final DocumentReference? result = await AuthenticationHelper()
        .updateDevicesStatus(
         deviceuid: deviceUid, status: status);
    return result;
  }

  Future<QuerySnapshot?> getAllDevices() async {
    final QuerySnapshot? response  = await AuthenticationHelper().getAllDeviceDocumentData();
    return response;
  }

}
