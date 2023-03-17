import 'package:flutter/material.dart';
import 'package:living_network/utility/image_utils.dart';

List title = ['Max Mode', 'Eco Mode', 'Live Mode', 'Game Mode'];
List subTitle = [
  '5G Max Mode ให้คุณเพลิดเพลินไปกับความเร็วแรงของอินเทอร์เน็ตเต็มแม็กซ์',
  '5G Eco Mode ให้คุณประหยัดแบตเตอรี่ แต่ยังสนุกไปกับความเร็ว แรง ของอินเทอร์เน็ต 5G',
  '5G Live Mode ให้คุณไลฟ์ไปได้ไม่มีสะดุด ไปกับความเร็ว แรง ของอินเทอร์เน็ต 5G',
  '5G Game Mode สนุกเต็มแม็กซ์ ไม่มีกระตุกให้อารมณ์เสียไปกับความเร็วแรงของ 5G ที่เหมือนกับอินเทอร์เน็ตบรอดแบนด์'
];
List<Image> image = [
  Image.asset(ImageUtils.getImagePath('assets/images/mode_max.png'), width: 40, height: 40, alignment: Alignment.topCenter,),
  Image.asset(ImageUtils.getImagePath('assets/images/mode_eco.png'), width: 40, height: 40, alignment: Alignment.topCenter,),
  Image.asset(ImageUtils.getImagePath('assets/images/mode_live.png'), width: 40, height: 40, alignment: Alignment.topCenter,),
  Image.asset(ImageUtils.getImagePath('assets/images/mode_game.png'), width: 40, height: 40, alignment: Alignment.topCenter,)
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
  Image.asset(ImageUtils.getImagePath('assets/images/performance_icon_1.png'), width: 40, height: 40, alignment: Alignment.topCenter,),
  Image.asset(ImageUtils.getImagePath('assets/images/performance_icon_2.png'), width: 40, height: 40, alignment: Alignment.topCenter,),
  Image.asset(ImageUtils.getImagePath('assets/images/performance_icon_3.png'), width: 40, height: 40, alignment: Alignment.topCenter,),
  Image.asset(ImageUtils.getImagePath('assets/images/performance_icon_4.png'), width: 40, height: 40, alignment: Alignment.topCenter,),
  Image.asset(ImageUtils.getImagePath('assets/images/performance_icon_5.png'), width: 40, height: 40, alignment: Alignment.topCenter,)
];



//5G Mode (warning)
String warning1 = 'Unable to use 5G mode because you have\nturned off cellular 5G. Please check your\nsetting menu on your phone';
String warning2 = 'Unable to use 5G mode as your max speed\ninternet has run out.';
String warning3 = 'XXX แพ็กเกจหลักของคุณไม่สามารถใช้ Live\nMode ได้';
String warning3_1 = 'แพ็กเกจของท่านไม่เข้าเงื่อนไข';
String warning4 = 'You are currently using 4G. Because it is\noutside the 5G service area.';
String warning4_1 = 'แพ็กเกจหลักของคุณไม่สามารถใช้ 5G Mode ได้';
String warning6 = 'Unable to use 5G mode as your max speed\ninternet has limited.';
String warning8 = 'ขณะนี้มีผู้ใช้งานเต็มในโหมดนี้แล้ว ขออภัยในความไม่ สะดวก\n(ท่านจะกลับมาใช้งานโหมดนี้ได้ในอีกxxxนาที)';
String warning9 = 'ขณะนี้คุณได้ทำการปรับโหมดเกิน 10 ครั้ง ซึ่งเกิน\nลิมิตของวันนี้ คุณจะกลับมาปรับโหมดได้อีกครั้งหลัง\nเที่ยงคืน';
String warning10 = 'เราไม่สามารถตรวจสอบได้ว่าคุณใช้โทรศัพท์รุ่นที่\nรองรับ 5G หรือไม่';

//5G Mode (default)
String messageDefault = 'Game Mode และ Boost Mode จะใช้งานได้\nประสิทธิภาพสูงสุดขึ้นอยู่ กับเสาสัญญาณที่ท่านอยู่\nณ บริเวณนั้นๆ';

//Notifications
String notificationTitleMode5G = 'โหมดทดลองใช้ 5G กำลังจะหมด! 🔥';
String notificationSubTitleMode5G = 'สนใจเปลี่ยนแพ็กเกจ 5G Max speed หรือดูแพ็กเกจอื่นๆ\nเพิ่มเติมเพื่อความแรงที่มากกว่า คลิก!';
String notificationTitleLiveModeExpired = 'เวลาในการใช้ Live Mode ของคุณกำลังจะหมด!';
String notificationSubTitleLiveModeExpired = 'การเชื่อมต่อ 5G ของคุณจะกลับเข้าสู่  Max Mode โดย\nอัตโนมัติ';
