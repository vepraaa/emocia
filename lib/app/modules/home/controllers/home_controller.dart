import 'package:emocia/app/model/emojiicon/emojiicon.dart';
import 'package:get/get.dart';
import 'package:emocia/app/services/user_service.dart';
import 'package:emocia/app/data/emoji_data.dart';

class HomeController extends GetxController {
  var _userService = Get.find<UserService>();

  var activeIndex = 0.obs;
  var emojiList = EmojiData.emojiList.obs;


  Emojiicon get getActiveEmoji {
    return Emojiicon(data:emojiList[activeIndex.value]);
  }

  changeActiveIndex() {
    if(activeIndex.value + 1 < emojiList.length) {
      activeIndex.value++;
    } else {
      activeIndex.value = 0;
    }
    _userService.saveData(getActiveEmoji);
    print(activeIndex.value);
  }

  initializeIndex() {
    var storedData = _userService.userData;
    print("INIT $storedData");
    activeIndex.value = emojiList.indexOf(storedData?.data);
  }

  @override
  void onInit() {
    super.onInit();
    initializeIndex();
  }
}
