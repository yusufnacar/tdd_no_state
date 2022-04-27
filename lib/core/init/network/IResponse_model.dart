// ignore_for_file: file_names

import 'package:tdd_no_statemanagement/core/base/model/base_model.dart';

abstract class IResponseModel<T> {
  T? data;
  IErrorModel? error;
}

abstract class IErrorModel<T> {
  void statusCode() {}
  String? description;
  BaseModel? model;
}

class ResponseModel<T> implements IResponseModel<T> {
  @override
  T? data;

  @override
  IErrorModel? error;

  ResponseModel({this.data, this.error});
}

class BaseError<T> extends IErrorModel {
  final String msg;

  BaseError(this.msg);
}
