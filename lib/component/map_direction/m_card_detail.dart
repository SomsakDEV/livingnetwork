import 'package:flutter/material.dart';
import 'package:living_network/constance/LNColor.dart';
import 'package:living_network/constance/LNStyle.dart';
import 'package:living_network/utility/image_utils.dart';
import 'package:url_launcher/url_launcher.dart';

class MapCardDetail extends StatefulWidget {
  const MapCardDetail({super.key});

  @override
  State<MapCardDetail> createState() => _MapCardDetailState();
}

class _MapCardDetailState extends State<MapCardDetail> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,

      // decoration: const BoxDecoration(
      //   color: Colors.transparent,
      // ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      // color: BaseColorsLN.mapIcon,
                      color: Colors.transparent,
                    )),
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: Image.asset(ImageUtils.getImagePath('assets/images/ais_wifi.png')),
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.72,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Rawtruckr',
                          style: LNStyle.header6_1,
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Close',
                            style: LNStyle.mapTextButton,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      'AIS SUPER WIFI (200 m)',
                      style: LNStyle.caption2_1,
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: const Text(
                      '61 ซอย พหลโยธิน 8 Samsen Nai, Phaya Thai, Bangkok 10400',
                      style: LNStyle.caption_1,
                      overflow: TextOverflow.clip,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.6,
                      height: MediaQuery.of(context).size.height / 17.5,
                      child: ElevatedButton(
                        onPressed: () {
                          launchMapsDirection(13.7857215, 100.5812384);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: LNColor.kellyGreen500,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                            side: const BorderSide(
                              width: 1,
                              color: LNColor.kellyGreen500,
                            ),
                          ),
                        ),
                        child: Stack(
                          children: <Widget>[
                            Align(
                              alignment: Alignment.centerRight,
                              child: Transform.rotate(
                                angle: 45,
                                child: const Icon(Icons.navigation_outlined),
                              ),
                            ),
                            const Align(
                              alignment: Alignment.center,
                              child: Text(
                                "Direction",
                                style: LNStyle.mapButtonDirection,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Future<void> launchMapsDirection(double lat, double lng) async {
  // print("called");
  String googleUrl = 'https://www.google.com/maps/search/?api=1&query=$lat,$lng';
  if (await canLaunch(googleUrl)) {
    await launch(googleUrl);
  } else {
    throw 'Could not open the map.';
  }
  // https://www.google.com/maps/search/ari/@13.7857215,100.5812384,12z/data=!3m1!4b1
  // http://www.google.com/maps/search/%3Fapi=1&query=52.337801,4.872066
  // https://www.google.com/maps/place/13°47'08.6%22N+100°34'52.5%22E/@13.7857215,100.5790497,17z/data=!3m1!4b1!4m4!3m3!8m2!3d13.7857215!4d100.5812384

  // final Uri googleUrl = Uri(scheme: 'https', host: 'www.google.com', path: 'maps/search/&query=$lat,$lng');
  // print(googleUrl);
  // if (await canLaunchUrl(googleUrl)) {
  //   await launchUrl(googleUrl);
  // } else {
  //   throw 'Could not open the map.';
  // }
  // late final String url;
  // if (Platform.isAndroid) {
  //   url = 'google.navigation:q=$lat,$lng';
  //   // url = 'https://www.google.com/maps/dir/?api=1&destination=$lat,$lng&travelmode=driving&dir_action=navigate';
  //   // url = 'geo:$lat,$lng';
  //   // url = 'https://www.google.com/maps/search/?api=1&query=$lat,$lng';
  //   // url = 'comgooglemaps://?daddr=$lat,$lng';
  //   // url = 'comgooglemaps://?q=$lat,$lng';
  //   // url = 'https://www.google.com/maps?daddr=$lat,$lng&dir_action=navigate';
  // } else {
  //   url = 'comgooglemaps://?daddr=$lat,$lng';
  // }
  // if (await canLaunchUrl(Uri.parse(url))) {
  //   await launchUrl(Uri.parse(url));
  // } else {
  //   print('cannot launch url');
  // }
}
