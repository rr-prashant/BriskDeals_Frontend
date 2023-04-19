import 'package:brisk_deals/Packages/Packages.dart';

class scrollDealdetail extends StatefulWidget {
  String VendorBusinessName;
  String VendorBusinessLocation;
  String Business_Phone;
  // String VendorBusinessPhoto;
  String Deals_Title;
  int Deals_Price;
  // String Deals_Photo;
  String Deals_Desc;
  String Deals_category;
  String Deals_condition;
  int Deals_Discount;
  String Deals_applicable_time;
  String Deals_applicable_day;
  String Deals_expiry_date;
  int Deal_user;
  scrollDealdetail({
    super.key,
    required this.VendorBusinessLocation,
    // required this.VendorBusinessPhoto,
    required this.Business_Phone,
    required this.VendorBusinessName,
    required this.Deals_Title,
    // required this.Deals_Photo,
    required this.Deals_Price,
    required this.Deals_Desc,
    required this.Deals_category,
    required this.Deals_condition,
    required this.Deals_Discount,
    required this.Deals_applicable_time,
    required this.Deals_applicable_day,
    required this.Deals_expiry_date,
    required this.Deal_user,
  });

  @override
  State<scrollDealdetail> createState() => _scrollDealdetailState();
}

class _scrollDealdetailState extends State<scrollDealdetail> {
  late Future<VendorBusiness> _vendorFuture;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _vendorFuture = getVendor(widget.Deal_user);
  }

  @override
  Widget build(BuildContext context) {
    User user = context.read<UserCubit>().state;
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            mainDetailedDeals(
                VendorBusinessName: widget.VendorBusinessName,
                Business_location: widget.VendorBusinessLocation,
                // Business_photo: widget.VendorBusinessPhoto,
                Business_Phone: widget.Business_Phone,
                Deals_Title: widget.Deals_Title,
                Deals_Price: widget.Deals_Price,
                // Deals_Photo: widget.Deals_Photo,
                Deals_Desc: widget.Deals_Desc,
                Deals_category: widget.Deals_category,
                Deals_condition: widget.Deals_condition,
                Deals_Discount: widget.Deals_Discount,
                Deals_applicable_time: widget.Deals_applicable_time,
                Deals_applicable_day: widget.Deals_applicable_day,
                Deals_expiry_date: widget.Deals_expiry_date,
                Deal_user: widget.Deal_user),
            FutureBuilder(
              future: _vendorFuture,
              builder: (BuildContext context,
                  AsyncSnapshot<VendorBusiness> snapshot) {
                if (snapshot.hasData) {
                  VendorBusiness? vendor = snapshot.data;

                  return SpecificVendorDetail(
                    VendorBusiness_Name: vendor!.VendorBusiness_Name,
                    VendorBusiness_Email: vendor.VendorBusiness_Email,
                    VendorBusiness_PhoneNumber:
                        vendor.VendorBusiness_Phonenumber,
                    VendorBusiness_Location: vendor.VendorBusiness_Location,
                    VendorBusiness_about: vendor.VendorBusiness_about,
                    VendorBusiness_opening_days:
                        vendor.VendorBusiness_opening_days,
                    VendorBusiness_opening_time:
                        vendor.VendorBusiness_opening_time,
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text("Something went wrong"),
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
