import 'package:pikup_app/common/common_import.dart';
import 'package:pikup_app/modules/register/models/food_item_model.dart';

class RegisterController extends GetxController {
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();

  FocusNode weightFocusNode = FocusNode();
  FocusNode heightFocusNode = FocusNode();

  Rx<String?> weightErrorText = Rx<String?>(null);
  Rx<String?> heightErrorText = Rx<String?>(null);

  RxInt weightType = 1.obs;
  RxInt heightType = 1.obs;

  RxInt age = 25.obs;
  RxBool isRegularDiet = true.obs;
  RxString doYouEat = "Veg".obs;
  // late AppLocalization localizations;

  @override
  void onInit() {
    // localizations = getAppLocalizations(Get.context!)!;
    super.onInit();
  }

  RxList<FoodItemModel> foodItems = RxList();
}
