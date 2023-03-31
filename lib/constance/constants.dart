import 'package:flutter/material.dart';
import 'package:living_network/utility/image_utils.dart';

List title = ['Boost mode', 'Eco mode', 'Game mode'];
List subTitle = [
  '5G Max Mode ให้คุณเพลิดเพลินไปกับความเร็วแรงของ อินเทอร์เน็ตเต็มแม็กซ์',
  '5G Eco Mode ให้คุณประหยัดแบตเตอรี่ แต่ยังสนุกไปกับความ เร็ว แรง ของอินเทอร์เน็ต 5G',
  '5G Game Mode สนุกเต็มแม็กซ์ ไม่มีกระตุกให้อารมณ์เสีย ไปกับความเร็วแรงของ 5G ที่เหมือนกับอินเทอร์เน็ตบรอดแบนด์'
];
List<Image> image = [
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
  Image.asset(
    ImageUtils.getImagePath('assets/images/mode_eco.png'),
    width: 40,
    height: 40,
    alignment: Alignment.topCenter,
  ),
];

List title_preformance = [
  'Browsing / Social',
  'Live',
  'Video streaming',
  'Music streaming',
  'Game'
];
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

//5G Mode (warning)
String warning1 =
    'Unable to use 5G mode because you haveturned off cellular 5G. Please check yoursetting menu on your phone';
String warning2 =
    'Unable to use 5G mode as your max speedinternet has run out.';
String warning3 = 'XXX แพ็กเกจหลักของคุณไม่สามารถใช้ LiveMode ได้';
String warning3_1 = 'แพ็กเกจของท่านไม่เข้าเงื่อนไข';
String warning4 =
    'You are currently using 4G. Because it is outside the 5G service area.';
String warning4_1 = 'แพ็กเกจหลักของคุณไม่สามารถใช้ 5G Mode ได้';
String warning6 =
    'Unable to use 5G mode as your max speedinternet has limited.';
String warning8 =
    'ขณะนี้มีผู้ใช้งานเต็มในโหมดนี้แล้ว ขออภัยในความไม่ สะดวก(ท่านจะกลับมาใช้งานโหมดนี้ได้ในอีกxxxนาที)';
String warning9 =
    'ขณะนี้คุณได้ทำการปรับโหมดเกิน 10 ครั้ง ซึ่งเกินลิมิตของวันนี้ คุณจะกลับมาปรับโหมดได้อีกครั้งหลังเที่ยงคืน';
String warning10 =
    'เราไม่สามารถตรวจสอบได้ว่าคุณใช้โทรศัพท์รุ่นที่รองรับ 5G หรือไม่';

String warningTimeout = 'เปลี่ยนโหมดไม่สำเร็จ เนื่องจาก Session Timeout\nกรุณาลองใหม่อีกครั้ง'; //16
String not5GMode = 'ขณะนี้คุณลูกค้าใช้งาน 4G / wifi อยู่ กรุณาลองใหม่อีกครั้ง'; //13
String warningCheck5GError = 'ระบบขัดข้อง จะกลับมาใช้งานได้ใหม่เร็วๆนี้';  //14

//5G Mode (default)
String messageDefault =
    'Game Mode และ Boost Mode จะใช้งานได้ ประสิทธิภาพสูงสุดขึ้นอยู่ กับเสาสัญญาณที่ท่านอยู่ ณ บริเวณนั้นๆ';

//Notifications
String notificationTitleMode5G = 'โหมดทดลองใช้ 5G กำลังจะหมด! 🔥';
String notificationSubTitleMode5G =
    'สนใจเปลี่ยนแพ็กเกจ 5G Max speed หรือดูแพ็กเกจอื่นๆ\nเพิ่มเติมเพื่อความแรงที่มากกว่า คลิก!';
String notificationTitleLiveModeExpired =
    'เวลาในการใช้ Live Mode ของคุณกำลังจะหมด!';
String notificationSubTitleLiveModeExpired =
    'การเชื่อมต่อ 5G ของคุณจะกลับเข้าสู่  Max Mode โดย\nอัตโนมัติ';

String textSubmitBtn = 'ยืนยัน';
String textCancelBtn = 'Close';
String textSubmitEco = 'Switch to Eco Mode';

//Mode Widget
String modeWidgetTitle = 'Mode';
String powerTitle = 'Power / Boost Mode';
String powerDesc = 'Fast Downloading';
String gameTitle = 'Game Mode';
String gameDesc = 'Latency Stability';
String ecoTitle = 'Eco Mode';
String ecoDesc = 'Data Battery';

String ecoSuccess = 'Switched to Eco mode!';
String boostSuccess = 'Switched to Power / Boost mode!';
String gameSuccess = 'Switched to Game mode!';
String unsuccessful = 'Unsuccessful Switching !';

//switch mode payment
String btmSheetTitlePower = 'Exit From Power/Boost mode?';
String btmSheetDescPower = 'Detail: exit from power/boost mode';
String btmSheetTitleGame = 'Exit From Game mode?';
String btmSheetDescGame = 'Detail: exit from game mode';
String exitModeTitle = 'ต้องการออกจากโหมดนี้ใช่ไหม?';
String exitModeDesc = 'โหมดที่คุณใช้งานอยู่ยังไม่หมดเวลา ระบบจะทำการตัดรอบโหมดนี้ทิ้ง โดยที่ไม่สามารถเก็บเวลาที่เหลือไว้ใช้้ต่อภายหลังได้';
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
String descPayment =
    '*เรียกเก็บค่าบริการพร้อมกับแพ็กเกจรายเดือนลงบิล';
String priceNotHigh = '10 บาท';
String priceHigh = '0 บาท';
String separate = " | ";
String time = "1 ชั่วโมง";
String vat = 'VAT Included';
String termsConditionsTitle = 'Terms & Conditions';
var termsConditionsDesc = {
  "1":
      "The exceas unago ratea are 1.50 Baht minute for voice and video calis to anry retwork (Secande are rounded up to the next minutel, 2.50 Baht/Sh/S and 4 Baht/MMS. AISsupor WIFi: The Wifi sorvice systom will gend a Wifi userrame and password autoraticaly via SMS. For more information, please go to www aie.co.towiti Exiating custorers can aubacribe to this package with an initial subscription fee of 30 Baht per subscription. limited to 3 subecriotion per month.",
  "2":
      "The allowance and servico ratea aro for domestic use anly. Commercial utization and other appications tnat may affect the service of other clentr are prohibited. The ucage allowance ia valid for each biling cycle. The remaining alowance carinot be accurulated for use in the next biling cycles. The unage allawance wil be torminated immediately whan the pack is changed or tranaferred. Al senvice rotes sre 79 VAT exclucive.",
  "3":
      "This package is valid for 12 bill cyctes cansacutivaly Free unlimited Movies and TV for 3 month - The Promotion period is 30 days after activatod package. - Promiar FULL HD : dial \"889*3# to roceive promofion, after that will be charged 290 Bant month on a normal basis. - AIS Play: ready to enioy Immociatoly - Froa unlimitod 4G Intomnet for AIS PLAY and Premier FULL HD apolications will be sutomaticaly added after actrated this package witth ShS confirmation. - Thia promotion ie apply to subocribors who receive special offer from each content application for first time onty and cannot be uced in canjunction with othe cromotions. if sulbocribers cancel/change main package, thia promotion will be ciacentinued immediately.Tne Company rezervea the right to change tha torme and canaitiona without prior notice.",
  "4": "AIS Play: ready to enioy Immociatoly",
  "5":
      "Froa unlimitod 4G Intomnet for AIS PLAY and Premier FULL HD apolications will be sutomaticaly added after actrated this package witth ShS confirmation.",
  "6":
      "Thia promotion ie apply to subocribors who receive special offer from each content application for first time onty and cannot be uced in canjunction with othe cromotions. if sulbocribers cancel/change main package, thia promotion will be ciacentinued immediately.Tne Company rezervea the right to change tha torme and canaitiona without prior notice.",
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
