import 'package:brisk_deals/Packages/Packages.dart';
import 'package:khalti_flutter/khalti_flutter.dart';

class PaymentPage extends StatefulWidget {
  String VendorBusinessName;
  String Business_location;
  String Business_Phone;
  // String Business_photo;
  String Deals_Title;
  // String Deals_Photo;
  String Deals_Desc;
  String Deals_category;
  String Deals_condition;

  int Deals_Discount;
  int Deals_Price;
  String Deals_applicable_time;
  String Deals_applicable_day;
  String Deals_expiry_date;
  int Customer_User;
  int Vendor_User;
  PaymentPage({
    super.key,
    required this.VendorBusinessName,
    // required this.Business_photo,
    required this.Business_location,
    required this.Business_Phone,
    required this.Deals_Title,
    required this.Deals_Price,
    // required this.Deals_Photo,
    required this.Deals_Desc,
    required this.Deals_category,
    required this.Deals_condition,
    required this.Deals_Discount,
    required this.Deals_applicable_time,
    required this.Deals_applicable_day,
    required this.Deals_expiry_date,
    required this.Customer_User,
    required this.Vendor_User,
  });

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  late int user_id;
  late int total_coupon_charge;
  late String user_name;
  late String user_email;
  late String user_location;
  late String user_phone;
  late User user;
  @override
  Widget build(BuildContext context) {
    user = context.read<UserCubit>().state;
    user_id = user.id!;
    user_name = user.name.toString();
    user_email = user.email.toString();
    user_location = user.location.toString();
    user_phone = user.phonenumber.toString();
    total_coupon_charge = 0;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.h),
      child: Column(
        children: [
          BigText(text: "Coupon Purchase Details"),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 40.w,
              vertical: 10.h,
            ),
            child: Row(
              children: [
                NormalText(
                  text: "Deal title: ",
                  color: ColorsOn.textColor,
                ),
                Expanded(
                  child: NormalText(
                    text: widget.Deals_Title,
                    color: ColorsOn.textColor,
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              bottom: 10.h,
              left: 40.h,
              right: 40.h,
            ),
            child: Row(
              children: [
                NormalText(
                  text: "Vendor Name: ",
                  color: ColorsOn.textColor,
                ),
                NormalText(
                  text: widget.VendorBusinessName,
                  color: ColorsOn.textColor,
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              bottom: 10.h,
              left: 40.h,
              right: 40.h,
            ),
            child: Row(
              children: [
                NormalText(
                  text: "Deal applicable day: ",
                  color: ColorsOn.textColor,
                ),
                NormalText(
                  text: widget.Deals_applicable_day,
                  color: ColorsOn.textColor,
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              bottom: 10.h,
              left: 40.h,
              right: 40.h,
            ),
            child: Row(
              children: [
                NormalText(
                  text: "Deal applicable time: ",
                  color: ColorsOn.textColor,
                ),
                NormalText(
                  text: widget.Deals_applicable_time,
                  color: ColorsOn.textColor,
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              bottom: 10.h,
              left: 40.h,
              right: 40.h,
            ),
            child: Row(
              children: [
                NormalText(
                  text: "Deal expiry date: ",
                  color: ColorsOn.textColor,
                ),
                NormalText(
                  text: widget.Deals_expiry_date,
                  color: ColorsOn.textColor,
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              bottom: 10.h,
              left: 40.h,
              right: 40.h,
            ),
            child: Row(
              children: [
                NormalText(
                  text: "Coupon rate: ",
                  color: ColorsOn.textColor,
                ),
                NormalText(
                  text: "5%",
                  color: ColorsOn.textColor,
                )
              ],
            ),
          ),
          const Divider(
            height: 1,
            thickness: 1.1,
            indent: 40,
            endIndent: 40,
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 10.h,
              bottom: 20.h,
              left: 40.h,
              right: 40.h,
            ),
            child: FutureBuilder<Charges?>(
              future: ChargesData(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return const Center(
                    child: Text("Something went wrong"),
                  );
                } else {
                  if (snapshot.hasData) {
                    if (snapshot.hasData && snapshot.data == null) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          NormalText(
                            text: "Coupon Price: Rs0",
                            color: ColorsOn.textColor,
                          ),
                        ],
                      );
                    } else {
                      int? charge = snapshot.data!.coupon_rate;
                      int? total = (widget.Deals_Price *
                              (1 - widget.Deals_Discount / 100) *
                              (charge / 100))
                          .toInt();
                      total_coupon_charge = total;
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          NormalText(
                            text: "Coupon Price: Rs",
                            color: ColorsOn.textColor,
                          ),
                          NormalText(
                            text: "$total",
                            color: ColorsOn.textColor,
                          )
                        ],
                      );
                    }
                  } else {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        NormalText(
                          text: "Coupon Price: Rs0",
                          color: ColorsOn.textColor,
                        ),
                      ],
                    );
                  }
                }
              },
            ),
          ),
          ButtonContainer(
              butborderColor: Colors.purple,
              text: "Payment via Khalti",
              butColor: Colors.purple,
              onClick: () {
                sendtoKhalti();
              })
        ],
      ),
    );
  }

  sendtoKhalti() {
    KhaltiScope.of(context).pay(
      config: PaymentConfig(
          amount: 1000,
          productIdentity: "Product ID",
          productName: "ProductName"),
      preferences: [
        PaymentPreference.khalti,
        PaymentPreference.eBanking,
        PaymentPreference.connectIPS,
        PaymentPreference.mobileBanking,
        PaymentPreference.sct
      ],
      onSuccess: (su) async {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: BigText(text: "Payment successful"),
              content: NormalText(
                text: "Your payment for " +
                    "${widget.Deals_Title}" +
                    " was successful.",
                maxline: 2,
              ),
              actions: [
                SimpleDialogOption(
                  child: const Text("Close"),
                  onPressed: () {
                    Navigator.pop(context);
                    setState(() {
                      //referenceID = success.idx;
                    });
                  },
                )
              ],
            );
          },
        );
        await postCouponDetails(
          widget.Deals_Title,
          // widget.Deals_Photo,
          widget.Deals_Discount,
          widget.Deals_applicable_time,
          widget.Deals_applicable_day,
          widget.Deals_expiry_date,
          user_id,
          widget.Vendor_User,
          widget.VendorBusinessName,
          widget.Business_location,
          widget.Business_Phone,
          total_coupon_charge,
          user_name,
          user_location,
          user_phone,
          user_email,
          true,
        );
        sendPurchaseEmail(
            "Your Purchase for " +
                "${widget.Deals_Title}" +
                "is completed. Enjoy!",
            user.email!);
        setState(() {});
      },
      onFailure: (fa) {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: BigText(text: "Payment failed"),
              content: NormalText(
                text:
                    "Your payment for " + "${widget.Deals_Title}" + " failed.",
                maxline: 2,
              ),
              actions: [
                SimpleDialogOption(
                  child: const Text("Close"),
                  onPressed: () {
                    Navigator.pop(context);
                    setState(() {
                      //referenceID = success.idx;
                    });
                  },
                )
              ],
            );
          },
        );
      },
      onCancel: () {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: BigText(text: "Payment cancelled"),
              content: NormalText(text: "Your payment was cancelled."),
              actions: [
                SimpleDialogOption(
                  child: const Text("Close"),
                  onPressed: () {
                    Navigator.pop(context);
                    setState(() {
                      //referenceID = success.idx;
                    });
                  },
                )
              ],
            );
          },
        );
      },
    );
  }

  // void onSuccess(PaymentSuccessModel success) {
  //   showDialog(
  //     context: context,
  //     builder: (context) {
  //       return AlertDialog(
  //         title: const Text("Payment successfull"),
  //         actions: [
  //           SimpleDialogOption(
  //             child: const Text("Ok"),
  //             onPressed: () {
  //               Navigator.pop(context);
  //               setState(() {
  //                 //referenceID = success.idx;
  //               });
  //             },
  //           )
  //         ],
  //       );
  //     },
  //   );
  // }

  // void onFailure(PaymentFailureModel failure) {
  //   debugPrint(failure.toString());
  // }

  // void onCancel() {
  //   debugPrint("cancelled");
  // }
}
