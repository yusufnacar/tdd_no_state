import 'dart:convert';
import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:tdd_no_statemanagement/core/constants/enums/http_enum.dart';
import 'package:tdd_no_statemanagement/core/base/model/base_model.dart';
import 'package:tdd_no_statemanagement/core/init/network/ICore_dio.dart';
import 'package:tdd_no_statemanagement/core/init/network/IResponse_model.dart';

import '../../extension/network_extension.dart';

class CoreDio with DioMixin implements ICoreDio, Dio {
  @override
  final BaseOptions options;

  CoreDio(this.options) {
    options = options;
    interceptors.add(InterceptorsWrapper());
    httpClientAdapter = DefaultHttpClientAdapter();
  }

  @override
  Future<IResponseModel<R>> send<R, T extends BaseModel>(String path,
      {required HttpTypes type, required T parseModel, data, headers}) async {
    // try {
    final response = await request(path,
        data: data, options: Options(method: type.rawValue));

    switch (response.statusCode) {
      case HttpStatus.ok:
      case HttpStatus.accepted:
        final model = _responseParser<R, T>(parseModel, response.data);
        return ResponseModel<R>(data: model);
      default:
        return ResponseModel(
            error: BaseError(
                "Error , Status Code is: ${response.statusCode} , ${response.statusMessage} "));
    }
    try {} catch (e) {
      return ResponseModel(error: BaseError("Error $e"));
    }
  }
}

extension _CoreDioOperations on CoreDio {
  R? _responseParser<R, T>(BaseModel model, dynamic data) {
    if (data is List) {
      print("object");
      return data.map((e) => model.fromJson(e)).toList().cast<T>() as R;
    } else if (data is Map) {
      return model.fromJson(data as Map<String, dynamic>) as R;
    } else if (data == null) {
      print("object");
    }
    return data as R?;
  }
}
