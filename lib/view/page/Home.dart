import 'package:Nii/widget/CommonView.dart';
import 'package:flutter/cupertino.dart';

import '../base/BaseView.dart';
import '../base/BaseViewModel.dart';

class Home extends BaseView<BaseViewMode> {

  Home({super.key});

  @override
  Widget buildWidget(BuildContext context) {
    return CommonView.scrollView(Text("aaaaaa"),isCenter: true) ;
  }

  @override
  void init(BuildContext context) {
  }
}
