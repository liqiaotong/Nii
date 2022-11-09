import 'dart:collection';

import 'package:nii/view/base/BaseViewModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:nii/view/model/CommonModel.dart';
import 'package:provider/provider.dart';

import '../../widget/CommonView.dart';
import '../base/BaseView.dart';
import '../model/SettingModel.dart';

class Setting extends BaseView<SettingModel> {
  Setting({super.key});

  @override
  Widget buildWidget(BuildContext context) {
    return CommonView.scrollView(
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            currentConsumer((context, model) => Text('Total s price:${model?.i}')),
            createConsumer<CommonModel>((context, model) => Text('Total cs price:${model?.i}')),
            CommonView.button("test", () => {viewModel?.add()}),
            CommonView.button("test common", () => {context?.read<CommonModel>().add()})
          ],
        ),
        isCenter: true);
  }

  @override
  void init() {}

  @override
  void destroy() {}

  @override
  SettingModel? initViewModel() {
    return SettingModel();
  }
}
