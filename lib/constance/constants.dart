import 'package:flutter/material.dart';
import 'package:living_network/utility/image_utils.dart';

List title = ['ECO Mode', 'BOOST Mode', 'GAME Mode'];
List subTitle = [
  'Help you to save your internet quota. This Mode is no time out. To use your internet speed package, please turn off ECO Mode.',
  'Help you to download huge file such as Movie faster. To maximize usage, please stay still while using this mode. This mode will be available for 60 minutes. When Mode time out, internet speed will turn to your internet speed package.',
  'Help your internet quality stability for online gaming. To maximize usage, please stay still while using this mode. This mode will be available for 60 minutes. When Mode time out, internet speed will turn to your internet speed package.',
];
List<Image> image = [
  Image.asset(
    ImageUtils.getImagePath('assets/images/mode_eco.png'),
    width: 40,
    height: 40,
    alignment: Alignment.topCenter,
  ),
  Image.asset(
    ImageUtils.getImagePath('assets/images/mode_power.png'),
    width: 40,
    height: 40,
    alignment: Alignment.topCenter,
  ),
  Image.asset(
    ImageUtils.getImagePath('assets/images/mode_game.png'),
    width: 40,
    height: 40,
    alignment: Alignment.topCenter,
  ),
];

List title_preformance = ['Browsing / Social', 'Live', 'Video streaming', 'Music streaming', 'Game'];
List subTitle_preformance = [
  'Detail : At vero eos et accusamus et iusto odio\ne.g. LINE, Facebook, Twitter, Google',
  'Detail : At vero eos et accusamus et iusto odio\ne.g. Tiktok, Facebook Live, Youtube Live',
  'Detail : At vero eos et accusamus et iusto odio\ne.g. Youtube, Netflix, Disney Hostar, HBO Go',
  'Detail : At vero eos et accusamus et iusto odio\ne.g. Joox, Spotify, Youtube Music, Apple Music, Plern',
  'Detail : At vero eos et accusamus et iusto odio\ne.g. ROV, Pub G, Among Us, Candy Crush'
];
List<Image> image_preformance = [
  Image.asset(
    ImageUtils.getImagePath('assets/images/performance_icon_1.png'),
    width: 40,
    height: 40,
    alignment: Alignment.topCenter,
  ),
  Image.asset(
    ImageUtils.getImagePath('assets/images/performance_icon_2.png'),
    width: 40,
    height: 40,
    alignment: Alignment.topCenter,
  ),
  Image.asset(
    ImageUtils.getImagePath('assets/images/performance_icon_3.png'),
    width: 40,
    height: 40,
    alignment: Alignment.topCenter,
  ),
  Image.asset(
    ImageUtils.getImagePath('assets/images/performance_icon_4.png'),
    width: 40,
    height: 40,
    alignment: Alignment.topCenter,
  ),
  Image.asset(
    ImageUtils.getImagePath('assets/images/performance_icon_5.png'),
    width: 40,
    height: 40,
    alignment: Alignment.topCenter,
  )
];

//5G Mode warning
Map warningRepo = <String, String>{
  '1': 'Mode will be available when using 5G Device, Package, and Coverage.',
  '2': 'Your current package is not support Mode.',
  '3': 'Your package is quota met or under FUP. To use Mode, please purchase your 5G MAX On Top Package.',
  '4': 'Your switching Mode is quota met. Please try again tomorrow.',
  '5': 'You cannot switch Mode. The quota for using Mode has been reached. Please try again later.',

  '6': 'You cannot switch Mode. The quota for using Mode has been reached. Please try again later.',
  '7': 'Your internet package is quota met or in FUP status. Please purchase 5G MAX Speed On Top package.',
  '8': 'Your request cannot be proceeded. You shall be use internet speed in the current Mode.',
  '9': 'Your request cannot be proceeded. Your internet speed will turn to your internet speed package.',

  '500': 'Sorry. Service is not available right now. Please try again.',
  '50000': 'Sorry. Service is not available right now. Please try again.',
};

//5G Mode (default)
String msgDefault = 'Your Current Speed depend on your package, package status, and current network status.';
String msgAvailableUse = 'To maximize usage, please stay still while using this mode. This mode will be available for 60 minutes. When Mode time out, internet speed will turn to your internet speed package.'; //game or boost mode
String msgNoTimeout = 'This Mode is no time out. To use your internet speed package, please turn off ECO Mode.'; //eco mode
String msgInternetPack = 'Your internet speed will turn to your internet speed package.'; //max mode

String textSubmitBtn = 'Confirm';
String textCancelBtn = 'Close';
String textSubmitEco = 'Switch to ECO Mode';
String textSubmitBoost = 'Switch to BOOST Mode';
String textSubmitGame = 'Switch to GAME Mode';

//Mode Widget
String modeWidgetTitle = 'Mode';
String powerTitle = 'BOOST Mode';
String powerDesc = 'Optimized for Speed';
String gameTitle = 'GAME Mode';
String gameDesc = 'Optimized for Stability';
String ecoTitle = 'ECO Mode';
String ecoDesc = 'Optimized for Data Saving';

//SnackBar
String snackBarSuccess = 'Switching Mode Success';
String snackBarUnsuccessful = 'Switching Mode Unsuccess';

//Switching Mode
String switchBoost = 'Are you switching to BOOST Mode?';
String switchGame = 'Are you switching to GAME Mode?';
String switchEco = 'Are you switching to ECO Mode?';

String switchBoostExitTitle = 'Will you stop using BOOST Mode?';
String switchBoostExitDesc = 'Your BOOST Mode time quota will be stopped immediately.';
String switchGameExitTitle = 'Will you stop using GAME Mode?';
String switchGameExitDesc = 'Your GAME Mode time quota will be stopped immediately.';
String switchEcoExit = 'Are you turning off ECO Mode?';




//------- don't use
//Notifications
String notificationTitleMode5G = 'โหมดทดลองใช้ 5G กำลังจะหมด! 🔥';
String notificationSubTitleMode5G = 'สนใจเปลี่ยนแพ็กเกจ 5G Max speed หรือดูแพ็กเกจอื่นๆ\nเพิ่มเติมเพื่อความแรงที่มากกว่า คลิก!';
String notificationTitleLiveModeExpired = 'เวลาในการใช้ Live Mode ของคุณกำลังจะหมด!';
String notificationSubTitleLiveModeExpired = 'การเชื่อมต่อ 5G ของคุณจะกลับเข้าสู่  Max Mode โดย\nอัตโนมัติ';
//-------

//switch mode payment
String btmSheetTitlePower = 'Exit From Power/Boost mode?';
String btmSheetDescPower = 'Detail: exit from power/boost mode';
String btmSheetTitleGame = 'Exit From Game mode?';
String btmSheetDescGame = 'Detail: exit from game mode';
String exitModeTitle = 'ต้องการออกจากโหมดนี้ใช่ไหม?';
String exitModeDesc = 'โหมดที่คุณใช้งานอยู่ยังไม่หมดเวลา ระบบจะทำการตัดรอบโหมดนี้ทิ้ง โดยที่ไม่สามารถเก็บเวลาที่เหลือไว้ใช้้ต่อภายหลังได้';
String exitEcoMode = 'คุณต้องการออกจาก Eco Mode ใช่หรือไม่ ?';
String switchBoostTitle = 'ต้องการสลับไปโหมด Boost Mode?';
String switchGameTitle = 'ต้องการสลับไปโหมด Game Mode?';
String switchEcoTitle = 'ต้องการสลับไปโหมด Eco Mode?';
String switchDesc = 'โหมดที่คุณใช้งานอยู่ยังไม่หมดเวลา ระบบจะทำการตัดรอบโหมดนี้ทิ้ง โดยที่ไม่สามารถเก็บเวลาที่เหลือไว้ใช้้ต่อภายหลังได้';

String descEco = 'Detail : Eco Mode (Waiting detail from marketing)';
String descBoost = 'Deatil : Boost Mode (Waiting detail from marketing)';
String descGame = 'Deatil : Game Mode (Waiting detail from marketing)';
String titleEco = 'สลับเป็น Eco Mode!';
String titlePaymentL = 'สลับเป็น Boost Mode!';
String titlePaymentG = 'สลับเป็น Game Mode!';
String descPayment = '*เรียกเก็บค่าบริการพร้อมกับแพ็กเกจรายเดือนลงบิล';
String priceNotHigh = '10 บาท';
String priceHigh = '0 บาท';
String separate = " | ";
String time = "1 ชั่วโมง";
String vat = 'VAT Included';
String termsConditionsTitle = 'Terms & Conditions';
var termsConditionsDesc = {
  "1": "The exceas unago ratea are 1.50 Baht minute for voice and video calis to anry retwork (Secande are rounded up to the next minutel, 2.50 Baht/Sh/S and 4 Baht/MMS. AISsupor WIFi: The Wifi sorvice systom will gend a Wifi userrame and password autoraticaly via SMS. For more information, please go to www aie.co.towiti Exiating custorers can aubacribe to this package with an initial subscription fee of 30 Baht per subscription. limited to 3 subecriotion per month.",
  "2": "The allowance and servico ratea aro for domestic use anly. Commercial utization and other appications tnat may affect the service of other clentr are prohibited. The ucage allowance ia valid for each biling cycle. The remaining alowance carinot be accurulated for use in the next biling cycles. The unage allawance wil be torminated immediately whan the pack is changed or tranaferred. Al senvice rotes sre 79 VAT exclucive.",
  "3":
      "This package is valid for 12 bill cyctes cansacutivaly Free unlimited Movies and TV for 3 month - The Promotion period is 30 days after activatod package. - Promiar FULL HD : dial \"889*3# to roceive promofion, after that will be charged 290 Bant month on a normal basis. - AIS Play: ready to enioy Immociatoly - Froa unlimitod 4G Intomnet for AIS PLAY and Premier FULL HD apolications will be sutomaticaly added after actrated this package witth ShS confirmation. - Thia promotion ie apply to subocribors who receive special offer from each content application for first time onty and cannot be uced in canjunction with othe cromotions. if sulbocribers cancel/change main package, thia promotion will be ciacentinued immediately.Tne Company rezervea the right to change tha torme and canaitiona without prior notice.",
  "4": "AIS Play: ready to enioy Immociatoly",
  "5": "Froa unlimitod 4G Intomnet for AIS PLAY and Premier FULL HD apolications will be sutomaticaly added after actrated this package witth ShS confirmation.",
  "6": "Thia promotion ie apply to subocribors who receive special offer from each content application for first time onty and cannot be uced in canjunction with othe cromotions. if sulbocribers cancel/change main package, thia promotion will be ciacentinued immediately.Tne Company rezervea the right to change tha torme and canaitiona without prior notice.",
};

//Performance
// List<PerformanceModel> contentList = [
//   PerformanceModel(
//     text: const Text(
//       'Browsing/Social',
//       style: LNStyle.header6_1B,
//     ),
//     iconImage: ImageUtils.getImagePath('assets/images/performance_icon_1.png'),
//     qualityImage: ImageUtils.getImagePath('assets/images/signal_excellent.png'),
//   ),
//   PerformanceModel(
//     text: const Text(
//       'Live',
//       style: LNStyle.header6_1B,
//     ),
//     iconImage: ImageUtils.getImagePath('assets/images/performance_icon_2.png'),
//     qualityImage: ImageUtils.getImagePath('assets/images/signal_excellent.png'),
//   ),
//   PerformanceModel(
//     text: const Text(
//       'Video streaming',
//       style: LNStyle.header6_1B,
//     ),
//     iconImage: ImageUtils.getImagePath('assets/images/performance_icon_3.png'),
//     qualityImage: ImageUtils.getImagePath('assets/images/signal_excellent.png'),
//   ),
//   PerformanceModel(
//     text: const Text(
//       'Music streaming',
//       style: LNStyle.header6_1B,
//     ),
//     iconImage: ImageUtils.getImagePath('assets/images/performance_icon_4.png'),
//     qualityImage: ImageUtils.getImagePath('assets/images/signal_good.png'),
//   ),
//   PerformanceModel(
//     text: const Text(
//       'Game',
//       style: LNStyle.header6_1B,
//     ),
//     iconImage: ImageUtils.getImagePath('assets/images/performance_icon_5.png'),
//     qualityImage: ImageUtils.getImagePath('assets/images/signal_fair.png'),
//   ),
// ];
