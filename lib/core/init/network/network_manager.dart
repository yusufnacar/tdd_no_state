import 'package:dio/dio.dart';
import 'package:tdd_no_statemanagement/core/constants/app/app_constant.dart';
import 'package:tdd_no_statemanagement/core/init/network/core_dio.dart';

import 'ICore_dio.dart';

class NetworkManager {
  static NetworkManager? _instance;
  static NetworkManager? get instance {
    _instance ??= NetworkManager._init();
    return _instance;
  }

  ICoreDio? dio;

  NetworkManager._init() {
    var baseOptions = BaseOptions(baseUrl: ApplicationConstants.baseUrl);
    dio = CoreDio(baseOptions);
  }
}
