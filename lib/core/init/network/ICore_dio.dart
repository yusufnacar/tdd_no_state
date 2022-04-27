// ignore_for_file: file_names

import 'package:tdd_no_statemanagement/core/constants/enums/http_enum.dart';
import 'package:tdd_no_statemanagement/core/init/network/IResponse_model.dart';

import '../../base/model/base_model.dart';

abstract class ICoreDio {
  Future<IResponseModel<R>> send<R, T extends BaseModel>(String path,
      {required HttpTypes type,
      required T parseModel,
      dynamic data,
      dynamic headers});
}
