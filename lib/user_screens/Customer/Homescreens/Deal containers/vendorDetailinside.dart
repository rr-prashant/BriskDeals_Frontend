import 'package:brisk_deals/Packages/Packages.dart';

class SpecificVendorDetail extends StatefulWidget {
  String? VendorBusiness_Name;
  String? VendorBusiness_Email;
  String? VendorBusiness_PhoneNumber;
  String? VendorBusiness_Location;
  String? VendorBusiness_about;
  String? VendorBusiness_opening_time;
  String? VendorBusiness_opening_days;

  SpecificVendorDetail({
    super.key,
    this.VendorBusiness_Name,
    this.VendorBusiness_Email,
    this.VendorBusiness_PhoneNumber,
    this.VendorBusiness_Location,
    this.VendorBusiness_about,
    this.VendorBusiness_opening_time,
    this.VendorBusiness_opening_days,
  });

  @override
  State<SpecificVendorDetail> createState() => _SpecificVendorDetailState();
}

class _SpecificVendorDetailState extends State<SpecificVendorDetail> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 80.h),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        decoration: BoxDecoration(
          color: ColorsOn.backgroundColor,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1.8,
                blurRadius: 2,
                offset: Offset(0, 2) // changes position of shadow
                ),
          ],
        ),
        child: Column(
          children: [
            BigText(text: "${widget.VendorBusiness_Name}"),
            BigText(text: "${widget.VendorBusiness_Email}"),
            BigText(text: "${widget.VendorBusiness_Location}"),
            BigText(text: "${widget.VendorBusiness_PhoneNumber}"),
            BigText(text: "${widget.VendorBusiness_about}"),
            BigText(text: "${widget.VendorBusiness_opening_time}"),
            BigText(text: "${widget.VendorBusiness_opening_days}"),
          ],
        ),
      ),
    );
  }
}
