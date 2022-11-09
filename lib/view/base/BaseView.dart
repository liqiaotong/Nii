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

  Widget currentConsumer(Function(BuildContext context, ViewModel? model) builder) {
    return Consumer<BaseViewModel?>(builder: (context, model, child) {
      return builder(context, model as ViewModel?);
    });
  }

  Widget createConsumer<VM extends BaseViewModel>(Function(BuildContext context, VM? model) builder) {
    return Consumer<VM>(builder: (context, model, child) {
      return builder(context, model);
    });
  }

  ViewModel? initViewModel();

  void init();

  Widget buildWidget(BuildContext context);

  void destroy();
}

class _BaseState extends State {

  final StateControl? _stateControl;

  _BaseState(this._stateControl);

  @override
  Widget build(BuildContext context) {
    var body = Scaffold(body: _stateControl?.build(context));
    if (_stateControl?.baseViewMode != null) {
      return ChangeNotifierProvider.value(value: _stateControl?.baseViewMode, child: body);
    } else {
      return body;
    }
  }

  @override
  void initState() {
    super.initState();
    _stateControl?.initState(context);
  }

  @override
  void dispose() {
    super.dispose();
    _stateControl?.dispose();
  }
}

class StateControl {

  BaseView baseView;
  BaseViewModel? baseViewMode;

  StateControl(this.baseView, this.baseViewMode);

  void dispose() {
    baseView.destroy();
  }

  void initState(BuildContext context) {
    baseView.context = context;
    baseViewMode?.context = context;
    baseView.init();
  }

  Widget build(BuildContext context) {
    return baseView.buildWidget(context);
  }
}
