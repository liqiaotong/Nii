
import 'package:nii/utils/PageRouter.dart';
import 'package:nii/view/model/CommonModel.dart';
import 'package:nii/view/model/HomeModel.dart';
import 'package:nii/view/page/Setting.dart';
import 'package:nii/widget/CommonView.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

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
            currentConsumer((context, model) => Text('Total price:${model?.i}')),
            createConsumer<CommonModel>((context, model) => Text('Total cs price:${model?.i}')),
            CommonView.button("test", () => {viewModel?.add()}),
            CommonView.button("test common", () => {context.read<CommonModel>().add()}),
            CommonView.button("turn", () => {Navigator.of(context).push(PageRouter.createRoute(Setting()))})
          ],
        ),
        isCenter: true);
  }

  @override
  void init() {}

  @override
  void destroy() {}

  @override
  HomeModel? initViewModel() {
    return HomeModel();
  }
}
