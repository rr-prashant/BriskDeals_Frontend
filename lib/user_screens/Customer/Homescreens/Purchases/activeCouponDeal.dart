import 'dart:io';

import 'package:brisk_deals/Packages/Packages.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';

class activeCouponDeal extends StatefulWidget {
  int couponID;
  String DealTitle;
  String DealTime;
  String DealDay;
  String DealExpire;
  int DealDiscount;
  int CouponPrice;
  String CustomerName;
  String CustomerEmail;
  String CustomerPhone;
  String CustomerAddress;
  String BusinessName;
  String BusinessLocation;
  String BusinessContact;
  bool isActiveisCustomer;
  activeCouponDeal({
    super.key,
    required this.couponID,
    required this.DealTitle,
    required this.DealTime,
    required this.DealDay,
    required this.DealExpire,
    required this.DealDiscount,
    required this.CouponPrice,
    required this.CustomerName,
    required this.CustomerEmail,
    required this.CustomerPhone,
    required this.CustomerAddress,
    required this.BusinessName,
    required this.BusinessLocation,
    required this.BusinessContact,
    this.isActiveisCustomer = false,
  });

  @override
  State<activeCouponDeal> createState() => _activeCouponDealState();
}

class _activeCouponDealState extends State<activeCouponDeal> {
  final _screenshotController = ScreenshotController();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height * 1;
    double width = MediaQuery.of(context).size.width * 1;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 20.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 10.w,
                    ),
                    GestureDetector(
                      child: Icon(Icons.arrow_back_ios),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                    BigText(
                      text: "Coupon Details",
                      color: ColorsOn.secondaryColor,
                      size: 25,
                    ),
                  ],
                ),
                Screenshot(
                  controller: _screenshotController,
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
                    child: Container(
                      width: width,
                      decoration: BoxDecoration(
                        color: ColorsOn.backgroundColor,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1.1,
                            blurRadius: 1.1,
                            // changes position of shadow
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 30.h, horizontal: 10.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    BigText(
                                      text: "Coupon ID: ${widget.couponID}",
                                      color: ColorsOn.secondaryColor,
                                    ),
                                    widget.isActiveisCustomer
                                        ? GestureDetector(
                                            onTap: _takeScreenshot,
                                            child: const Icon(
                                              Icons.share_outlined,
                                              color: ColorsOn.greenColor,
                                            ))
                                        : const Text(""),
                                  ],
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                BigText(text: "Deal Details"),
                                const Divider(
                                  height: 1,
                                  thickness: 1,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        NormalText(text: "Deal Title: "),
                                        NormalText(text: "${widget.DealTitle}")
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        NormalText(
                                            text: "Deal Applicable Time: "),
                                        NormalText(text: "${widget.DealTime}")
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        NormalText(
                                            text: "Deal Applicable Day: "),
                                        NormalText(text: "${widget.DealDay}")
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        NormalText(text: "Deal Expiry Date: "),
                                        NormalText(text: "${widget.DealExpire}")
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        NormalText(text: "Deal Discount: "),
                                        NormalText(
                                            text: "${widget.DealDiscount}%")
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        NormalText(text: "Coupon Price: "),
                                        NormalText(
                                            text: "Rs${widget.CouponPrice}")
                                      ],
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 20.h,
                                ),
                                BigText(text: "Customer Details"),
                                const Divider(
                                  height: 1,
                                  thickness: 1,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        NormalText(text: "Customer Name:"),
                                        NormalText(
                                            text: "${widget.CustomerName}")
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        NormalText(text: "Customer Email:"),
                                        NormalText(
                                            text: "${widget.CustomerEmail}")
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        NormalText(text: "Customer Phone:"),
                                        NormalText(
                                            text: "${widget.CustomerPhone}")
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        NormalText(text: "Customer Address:"),
                                        NormalText(
                                            text: "${widget.CustomerAddress}")
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 20.h,
                                ),
                                BigText(text: "Vendor Details"),
                                const Divider(
                                  height: 1,
                                  thickness: 1,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        NormalText(text: "Business Name:"),
                                        NormalText(
                                            text: "${widget.BusinessName}")
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        NormalText(text: "Business Location:"),
                                        NormalText(
                                            text: "${widget.BusinessLocation}")
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        NormalText(text: "Contact:"),
                                        NormalText(
                                            text: "${widget.BusinessContact}")
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _takeScreenshot() async {
    final uint8List = await _screenshotController.capture();
    String tempPath = (await getTemporaryDirectory()).path;
    File file = File('$tempPath/image.png');
    await file.writeAsBytes(uint8List!);
    XFile xFile = XFile(file.path, name: 'image.png', mimeType: 'image/png');
    // XFile.fromData(file.readAsBytesSync(), name: 'image.png');
    try {
      await Share.shareXFiles([xFile]);
    } catch (e) {
      print("Sharing failed: $e");
    }
  }
}
