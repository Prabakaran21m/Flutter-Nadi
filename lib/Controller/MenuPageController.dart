import 'package:code/Pojo/JobUpdatesResponse.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../../Provider/Dataprovider.dart';

class MenuPageController extends GetxController {
  late DataProvider userDataProvider;
  RxString jobNum = RxString("");
  RxString fanModel = RxString("");
  RxString customerName = RxString("");
  RxString orderQty = RxString("");

  List<Data> data = [];
  List<Planned> planned = [];
  RxBool isLoading = RxBool(false);

  @override
  void onInit() async {
    super.onInit();
  }
}
