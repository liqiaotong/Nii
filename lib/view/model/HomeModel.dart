
import '../base/BaseViewModel.dart';

class HomeModel extends BaseViewModel{

  int i = 0;

  @override
  void init() {

  }

  @override
  void destroy() {}

  void add(){
    i = i+1;
    notifyListeners();
  }


}
