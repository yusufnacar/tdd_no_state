import 'package:flutter/material.dart';
import 'package:tdd_no_statemanagement/view/home/service/home_service.dart';

import '../model/user_model.dart';

typedef void UIUpdate(VoidCallback fn);

abstract class IHomeViewModel {
  Color? backgroundColor = Colors.white;
  final UIUpdate viewUpdate;
  IHomeService homeService;
  bool isLoading = false;
  bool isVisible = true;

  IHomeViewModel(
    this.viewUpdate,
    this.homeService,
  );
  void changeBackground();
  void getUsers();
  bool changeVisibility(int index);
  void changeLoading();
  List<UserModel> user = [];
}

class HomeViewModel extends IHomeViewModel {
  HomeViewModel(UIUpdate viewUpdate, IHomeService homeService)
      : super(viewUpdate, homeService);

  @override
  void changeBackground() {
    viewUpdate(() {});
    // updateView() {
    backgroundColor = Colors.blue;
    // }
  }

  @override
  void getUsers() async {
    changeLoading();
    final response = await homeService.getUsers();
    if (response != null) user = response;
    changeLoading();
  }

  @override
  bool changeVisibility(index) {
    viewUpdate(() {});
    // isVisible = !isVisible;

    print(isVisible);

    return false;
  }

  @override
  void changeLoading() {
    viewUpdate(() {});
    isLoading = !isLoading;
  }
}
