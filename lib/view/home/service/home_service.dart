import 'dart:convert';

import 'package:tdd_no_statemanagement/core/constants/enums/http_enum.dart';
import 'package:tdd_no_statemanagement/core/init/network/ICore_dio.dart';
import 'package:tdd_no_statemanagement/view/home/model/user_model.dart';

abstract class IHomeService {
  final ICoreDio? manager;
  Future<List<UserModel>?> getUsers();
  Future<UserModel?> getUser(int id);

  IHomeService(this.manager);
}

class HomeService extends IHomeService {
  HomeService(ICoreDio? manager) : super(manager);

  @override
  Future<List<UserModel>?> getUsers() async {
    final response = await manager!.send<List<UserModel>, UserModel>("/posts",
        type: HttpTypes.GET, parseModel: UserModel());

    if (response.data != null) return response.data;
  }

  @override
  Future<UserModel?> getUser(int id) async {
    final response = await manager!.send<UserModel, UserModel>('/posts/$id',
        type: HttpTypes.GET, parseModel: UserModel());

    if (response.data != null) return response.data!;
  }
}
