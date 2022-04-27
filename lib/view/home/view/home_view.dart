import 'package:flutter/material.dart';
import 'package:tdd_no_statemanagement/core/init/network/network_manager.dart';
import 'package:tdd_no_statemanagement/view/home/service/home_service.dart';
import 'package:tdd_no_statemanagement/view/home/view_model/home_view_model.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late final IHomeViewModel homeViewModel;

  @override
  void initState() {
    super.initState();
    final manager = HomeService(NetworkManager.instance!.dio);
    homeViewModel = HomeViewModel(setState, manager);
    homeViewModel.getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: homeViewModel.backgroundColor,
        appBar: AppBar(
          actions: [
            ElevatedButton(
                onPressed: () {
                  homeViewModel.changeBackground();
                },
                child: Text("Change Colors"))
          ],
        ),
        body: sHowCirCularProgress());
  }

  Widget sHowCirCularProgress() => homeViewModel.isLoading
      ? CircularProgressIndicator.adaptive()
      : buildListView();

  Widget buildListView() {
    print(homeViewModel.user.length);
    return ListView.builder(
      itemCount: homeViewModel.user.length,
      itemBuilder: (context, index) {
        return Visibility(
          visible: homeViewModel.user[index].isVisible ?? false,
          child: ListTile(
            title: Text(homeViewModel.user[index].title ?? "Boş"),
            onTap: (() {
              homeViewModel.user[index].isVisible =
                  homeViewModel.changeVisibility(index);
            }),
          ),
        );
      },
    );
  }
}
