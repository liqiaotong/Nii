
import '../base/BaseViewModel.dart';

class HomeModel extends BaseViewModel{

  int i = 0;
  int s = 0;

  void add(){
    i = i+1;
    notifyListeners();
  }

  void adds(){
    s = s+1;
    print("adds:$s");
    notifyListeners();
  }


}
