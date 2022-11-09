import '../base/BaseViewModel.dart';

class CommonModel extends BaseViewModel{

  int i = 0;

  void add(){
    i = i+1;
    notifyListeners();
  }

}