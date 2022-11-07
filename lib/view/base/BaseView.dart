import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'BaseViewModel.dart';

abstract class BaseView<ViewModel extends BaseViewModel> extends StatefulWidget {
  BuildContext? context;

  ViewModel? viewModel;

  StateControl? stateControl;

  BaseView({super.key}) {
    viewModel = initViewModel();
    stateControl = StateControl(this, viewModel);
  }

  @override
  State<StatefulWidget> createState() {
    return _BaseState(stateControl);
  }

  Widget createConsumer(Function(BuildContext context, ViewModel value, Widget? child) builder) {
    if (viewModel != null) {
      return Consumer<BaseViewModel?>(builder: (context, model, child) {
        return builder(context, model as ViewModel, child);
      });
    }
    return Container();
  }

  ViewModel? initViewModel();

  void init();

  Widget buildWidget(BuildContext context);

  void destroy();
}

class _BaseState extends State {
  StateControl? stateControl;

  _BaseState(this.stateControl);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(value: stateControl?.baseViewMode, child: Scaffold(body: stateControl?.build(context)));
  }

  @override
  void initState() {
    super.initState();
    stateControl?.initState(context);
  }

  @override
  void dispose() {
    super.dispose();
    stateControl?.dispose();
  }
}

class StateControl {
  BaseView baseView;
  BaseViewModel? baseViewMode;

  StateControl(this.baseView, this.baseViewMode);

  void dispose() {
    baseView.destroy();
    baseViewMode?.destroy();
  }

  void initState(BuildContext context) {
    baseView.context = context;
    baseViewMode?.context = context;
    baseView.init();
    baseViewMode?.init();
  }

  Widget build(BuildContext context) {
    return baseView.buildWidget(context);
  }
}
