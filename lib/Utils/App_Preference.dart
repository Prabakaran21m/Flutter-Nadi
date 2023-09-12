import 'package:get_storage/get_storage.dart';

class AppPreference {
  static const STORAGE_NAME = 'Nadi';
  static const _LOGIN_TOKEN = 'login_token';
  static const _MOBILE_NUMBER = 'mobile_number';
  static const PROFILE_NAME = '_PROFILE_NAME';
  static const USER_UUID = '_USER_UUID';
  static const USER_ID = '_USER_ID';
  static const Profile_Type = '_Profile_Type';
  static const Profile_Type_ID = '_Profile_Type_ID';
  static const Land_ID = '_Land_ID';
  static const PARTICULAR_GET_ID = 'PARTICULAR_GET_ID';
  static const LATITUDE = '_LATITUDE';
  static const LONGTITUDE = '_LONGTITUDE';
  static const CREATIONDATE = '_CREATIONDATE';
  static const PROJECTCOMMENCEDATE = '_PROJECTCOMMENCEDATE';

  static const leadEvaluationStatusLabel = "feature_permission_lead_evaluation";

  final _storage = GetStorage(STORAGE_NAME);

  Future<void> init() async {
    await _storage.initStorage;
  }

  updateMobileNumber(String mobileNumber) {
    _storage.write(_MOBILE_NUMBER, mobileNumber);
  }

  String get mobileNumber {
    try {
      return _storage.read(_MOBILE_NUMBER);
    } catch (e) {
      return "";
    }
  }

  updateLoginToken(String companyCode) {
    _storage.write(_LOGIN_TOKEN, companyCode);
  }

  String get loginToken {
    try {
      return _storage.read(_LOGIN_TOKEN);
    } catch (e) {
      return "";
    }
  }

  void updateProfileName(String name) {
    _storage.write(PROFILE_NAME, name);
  }

  String get ProfileName {
    try {
      return _storage.read(PROFILE_NAME);
    } catch (e) {
      return "";
    }
  }

  updateUserUUidName(String name) {
    _storage.write(USER_UUID, name);
  }

  String get UserUUid {
    try {
      return _storage.read(USER_UUID);
    } catch (e) {
      return "";
    }
  }

  updateUserId(String name) {
    _storage.write(USER_ID, name);
  }

  String get UserId {
    try {
      return _storage.read(USER_ID);
    } catch (e) {
      return "";
    }
  }

  updateProfiletypeId(String name) {
    _storage.write(Profile_Type_ID, name);
  }

  String get UserProfileTypeId {
    try {
      return _storage.read(Profile_Type_ID);
    } catch (e) {
      return "";
    }
  }

  updateLandID(String name) {
    _storage.write(Land_ID, name);
  }

  String get LandId {
    try {
      return _storage.read(Land_ID);
    } catch (e) {
      return "";
    }
  }

  updateProfileType(String name) {
    _storage.write(Profile_Type, name);
  }

  String get ProfileType {
    try {
      return _storage.read(Profile_Type);
    } catch (e) {
      return "";
    }
  }

  updateParticularGetId(String name) {
    _storage.write(PARTICULAR_GET_ID, name);
  }

  String get ParticularGetId {
    try {
      return _storage.read(PARTICULAR_GET_ID);
    } catch (e) {
      return "";
    }
  }

  updatelatitude(String name) {
    _storage.write(LATITUDE, name);
  }

  String get Latitude {
    try {
      return _storage.read(LATITUDE);
    } catch (e) {
      return "";
    }
  }

  updatelongtitude(String name) {
    _storage.write(LONGTITUDE, name);
  }

  String get Longtitude {
    try {
      return _storage.read(LONGTITUDE);
    } catch (e) {
      return "";
    }
  }

  updatecreationdate(String name) {
    _storage.write(CREATIONDATE, name);
  }

  String get creationdate {
    try {
      return _storage.read(CREATIONDATE);
    } catch (e) {
      return "";
    }
  }

  updateprojectcommencedate(String name) {
    _storage.write(PROJECTCOMMENCEDATE, name);
  }

  String get projectcommencedate {
    try {
      return _storage.read(PROJECTCOMMENCEDATE);
    } catch (e) {
      return "";
    }
  }

  clearData() {
    _storage.erase();
  }
}
