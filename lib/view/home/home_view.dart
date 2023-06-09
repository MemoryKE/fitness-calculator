import 'package:fitness_calculator/core/networking/response/api_status.dart';
import 'package:fitness_calculator/view_model/home/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  static const routeName = '/home';
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late final HomeViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = HomeViewModel(context);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _viewModel.calculateCalorie();
    });
  }

  @override
  Widget build(BuildContext context) {
    
    return ChangeNotifierProvider<HomeViewModel>(
        create: (BuildContext context) => _viewModel,
        child: Scaffold(
          body: Center(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: ElevatedButton(child: Text("get"), onPressed: () {
                      _viewModel.calculateCalorie();
                      },),
                  ),
                  Consumer<HomeViewModel>(
                      builder: (context, viewModel, child) {
                         switch (viewModel.dailyCalorie.status) {
                          case ApiStatus.loading:
                            // overlay.show();
                            return Container();
                          case ApiStatus.success:
                            // overlay.hide();
                            return const Center(child: const Text("success"));
                          case ApiStatus.failure:
                            return Center(child: Text(viewModel.dailyCalorie.message!));
                          case ApiStatus.none:
                            return const Text("data");
                          default:
                            return const Text("data");
                        }
                      }),
                ],
              ),
            ),
          ),
        ));
  }
}
