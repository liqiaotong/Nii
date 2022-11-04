import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'BaseViewModel.dart';

abstract class BaseView<ViewModel extends BaseViewMode> extends StatefulWidget {

  BuildContext? context;

  final ViewModel? viewModel;

  BaseView({super.key, this.viewModel});

  @override
  State<StatefulWidget> createState() {
    return _BaseState(_StateImpl(this, viewModel));
  }

  void init(BuildContext context);

  Widget buildWidget(BuildContext context);
}

class _StateImpl extends StateImpl {
  final BaseView _baseView;
  final BaseViewMode? _baseViewMode;

  _StateImpl(this._baseView, this._baseViewMode);

  @override
  void dispose() {
    _baseViewMode?.dispose();
  }

  @override
  void initState(BuildContext context) {
    _baseView.context = context;
    _baseView.init(context);
    _baseViewMode?.init();
  }

  @override
  Widget build(BuildContext context) {
    return _baseView.buildWidget(context);
  }
}

class _BaseState extends State {
  final StateImpl _stateImpl;

  _BaseState(this._stateImpl);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _stateImpl.build(context));
  }

  @override
  void initState() {
    super.initState();
    _stateImpl.initState(context);
  }

  @override
  void dispose() {
    super.dispose();
    _stateImpl.dispose();
  }
}

abstract class StateImpl {
  void initState(BuildContext context);

  Widget build(BuildContext context);

  void dispose();
}
