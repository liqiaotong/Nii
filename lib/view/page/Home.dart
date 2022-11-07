import 'package:Nii/view/base/BaseViewModel.dart';
import 'package:Nii/view/model/HomeModel.dart';
import 'package:Nii/widget/CommonView.dart';
import 'package:flutter/cupertino.dart';

import '../base/BaseView.dart';

class Home extends BaseView<HomeModel> {
  Home({super.key});

  @override
  Widget buildWidget(BuildContext context) {
    return CommonView.scrollView(
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            createConsumer((context, value, child) => Text('Total price:${value.i}')),
            CommonView.button("test", () => {viewModel?.add()})
          ],
        ),
        isCenter: true);
  }

  @override
  void init() {}

  @override
  HomeModel? initViewModel() {
    return HomeModel();
  }

  @override
  void destroy() {}



}
