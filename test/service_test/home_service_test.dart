import 'package:flutter_test/flutter_test.dart';
import 'package:tdd_no_statemanagement/core/constants/enums/http_enum.dart';
import 'package:tdd_no_statemanagement/core/init/network/network_manager.dart';
import 'package:tdd_no_statemanagement/view/home/model/user_model.dart';
import 'package:tdd_no_statemanagement/view/home/service/home_service.dart';

void main() {
  late IHomeService homeService;

  setUp(() {
    homeService = HomeService(NetworkManager.instance!.dio);
  });

  test('Single Test', () async {
    final response = await NetworkManager.instance!.dio!
        .send<UserModel, UserModel>("/posts/1",
            type: HttpTypes.GET, parseModel: UserModel());

    expect(response.data, isNotNull);
  });

  test('Service Test', () async {
    final response = await NetworkManager.instance!.dio!
        .send<List<UserModel>, UserModel>("/posts",
            type: HttpTypes.GET, parseModel: UserModel());

    expect(response.data, isNotNull);
  });

  test('Home Service Test', () async {
    final response = await homeService.getUsers();

    expect(response, isNotNull);
  });

  test('Home Service Single Test', () async {
    final response = await homeService.getUser(1);

    expect(response?.isVisible, true);
  });
}
