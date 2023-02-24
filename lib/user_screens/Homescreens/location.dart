import 'package:brisk_deals/Packages/Packages.dart';

class askLocation extends StatefulWidget {
  const askLocation({super.key});

  @override
  State<askLocation> createState() => _askLocationState();
}

class _askLocationState extends State<askLocation> {
  late String lat;
  late String lon;
  String currentLocation = "";

  Future<Position> getCurrentLocationUser() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permission are permanently denied, we cannot request');
    }

    return await Geolocator.getCurrentPosition();
  }

  Future<void> getUserAddress(Position position) async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    // ignore: avoid_print
    print(placemarks);

    // ignore: unused_local_variable
    Placemark place = placemarks[0];

    currentLocation = '${place.locality}, ${place.subAdministrativeArea}';
    // "${place.locality}, ${place.subAdministrativeArea},${place.administrativeArea},${place.country},${place.isoCountryCode}";
    setState(() {});
    var box = await Hive.openBox(tokenBox);
    var keybox = box.get("token");
    await addLocation(keybox, currentLocation);
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => btmNavigationBar()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorsOn.backgroundColor,
        body: SingleChildScrollView(
            child: Column(
          children: [
            Container(
              child: Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 100.h),
                  child: Lottie.asset('assets/lottie/location.json',
                      height: 160.h, width: 320.w),
                ),
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BigText(
                    text: "Set Your Location",
                    size: 28,
                  ),
                  NormalText(
                    text:
                        "By sharing your location you can find nearby offers and deals more easily",
                    overFlow: TextOverflow.visible,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  ButtonContainer(
                    butborderColor: ColorsOn.secondaryColor,
                    text: "Use my location",
                    hasIcon: true,
                    butColor: ColorsOn.secondaryColor,
                    onClick: () async {
                      Position position = await getCurrentLocationUser();
                      // locationMessage =
                      //     'Latitude of Place:${position.latitude}, Longitude of Place:${position.longitude}';
                      getUserAddress(position);
                      // ignore: use_build_context_synchronously
                      setState(() {});
                    },
                    icon: Icons.my_location_outlined,
                  ),
                  SizedBox(
                    height: 60.h,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        right: 40,
                        left: 15,
                      ),
                      child: Row(
                        children: [
                          const Flexible(
                            flex: 1,
                            child: Divider(
                              color: ColorsOn.greyColor,
                              thickness: 0.5,
                              height: 0,
                            ),
                          ),
                          Center(
                            child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 5.w),
                                child: NormalText(
                                  text: "or",
                                  size: 17,
                                )),
                          ),
                          const Flexible(
                            flex: 1,
                            child: Divider(
                              color: ColorsOn.greyColor,
                              thickness: 0.5,
                              height: 0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  BigText(
                    text: "Select Popular Places",
                    size: 16,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    children: [
                      Chip(
                        label: SizedBox(
                          width: 70,
                          height: 30,
                          child: Center(
                              child: NormalText(
                            text: "Damak",
                            color: ColorsOn.textColor,
                            size: 14,
                          )),
                        ),
                        backgroundColor: ColorsOn.peach,
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Chip(
                        label: SizedBox(
                          width: 70,
                          height: 30,
                          child: Center(
                              child: NormalText(
                            text: "Itahari",
                            color: ColorsOn.textColor,
                            size: 14,
                          )),
                        ),
                        backgroundColor: ColorsOn.greenColor,
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Chip(
                        label: SizedBox(
                          width: 70,
                          height: 30,
                          child: Center(
                              child: NormalText(
                            text: "Urlabari",
                            color: ColorsOn.textColor,
                            size: 14,
                          )),
                        ),
                        backgroundColor: ColorsOn.yellowColor,
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Chip(
                        label: SizedBox(
                          width: 72,
                          height: 30,
                          child: Center(
                              child: NormalText(
                            text: "Birtamode",
                            color: ColorsOn.textColor,
                            size: 14,
                          )),
                        ),
                        backgroundColor: ColorsOn.blueColor,
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        )));
  }
}
