import 'package:brisk_deals/Packages/Packages.dart';

class VendorSignUp extends StatefulWidget {
  const VendorSignUp({super.key});

  @override
  State<VendorSignUp> createState() => _VendorSignUpState();
}

class _VendorSignUpState extends State<VendorSignUp> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _VendorName = TextEditingController();
  TextEditingController _VendorEmail = TextEditingController();
  TextEditingController _VendorPhone = TextEditingController();
  TextEditingController _VendorLocation = TextEditingController();
  TextEditingController _VendorAbout = TextEditingController();
  TextEditingController _VendorOpeningDays = TextEditingController();
  TextEditingController _VendorOpeningTime = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    _VendorName;
    _VendorEmail;
    _VendorPhone;
    _VendorLocation;
    _VendorAbout;
    _VendorOpeningDays;
    _VendorOpeningTime;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: ColorsOn.backgroundColor,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 10.h),
                    child: Row(
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
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30.w),
                    child: Column(
                      children: [
                        Center(
                          child: Column(
                            children: [
                              RichText(
                                  text: TextSpan(
                                      style: const TextStyle(
                                          color:
                                              Colors.blue), //apply style to all
                                      children: [
                                    TextSpan(
                                      text: 'Brisk',
                                      style: GoogleFonts.poppins(
                                        color: ColorsOn.textColor,
                                        fontSize: 40.sp,
                                        fontWeight: FontWeight.w700,
                                        decoration: TextDecoration.none,
                                      ),
                                    ),
                                    TextSpan(
                                        text: 'Deals',
                                        style: GoogleFonts.poppins(
                                          color: ColorsOn.secondaryColor,
                                          fontSize: 40.sp,
                                          fontWeight: FontWeight.w700,
                                          decoration: TextDecoration.none,
                                        )),
                                  ])),
                              NormalText(
                                text: "Register Your Business",
                                size: 16,
                                color: ColorsOn.secondaryColor,
                              )
                            ],
                          ),
                        ),
                        Center(
                            child: Column(
                          children: [
                            Lottie.asset('assets/lottie/growBusiness2.json',
                                height: 190.h, width: 350.w),
                            SizedBox(height: 10.h),
                            NormalText(
                              text:
                                  "BriskDeals helps your business to connect with",
                              size: 13,
                            ),
                            NormalText(
                              text:
                                  "customers with great discounts, REGISTER NOW!",
                              size: 13,
                            )
                          ],
                        )),
                        SizedBox(height: 20.h),
                        NtextField(
                            controller: _VendorName,
                            name: 'Name',
                            prefix: const Icon(Icons.person_outline),
                            validator: ValidationOfFields.valName),
                        SizedBox(
                          height: 25.h,
                        ),
                        NtextField(
                          controller: _VendorEmail,
                          name: 'Email',
                          prefix: const Icon(Icons.mail_outline),
                          validator: ValidationOfFields.valEmail,
                        ),
                        SizedBox(
                          height: 25.h,
                        ),
                        NtextField(
                          controller: _VendorPhone,
                          name: 'Phone No.',
                          prefix: const Icon(Icons.phone_outlined),
                          validator: ValidationOfFields.valPhone,
                        ),
                        SizedBox(
                          height: 25.h,
                        ),
                        NtextField(
                          controller: _VendorLocation,
                          name: 'Location',
                          prefix: const Icon(Icons.location_city),
                          validator: ValidationOfFields.valField,
                        ),
                        SizedBox(
                          height: 25.h,
                        ),
                        NtextField(
                          controller: _VendorAbout,
                          name: 'About Business',
                          prefix: const Icon(Icons.business_center_outlined),
                          validator: ValidationOfFields.valField,
                        ),
                        SizedBox(
                          height: 25.h,
                        ),
                        NtextField(
                          controller: _VendorOpeningDays,
                          name: 'Opening days',
                          prefix: const Icon(Icons.calendar_month_outlined),
                          validator: ValidationOfFields.valField,
                        ),
                        SizedBox(
                          height: 25.h,
                        ),
                        NtextField(
                          controller: _VendorOpeningTime,
                          name: 'Opening Time',
                          prefix: const Icon(Icons.watch_later_outlined),
                          validator: ValidationOfFields.valField,
                        ),
                        SizedBox(
                          height: 25.h,
                        ),
                        ButtonContainer(
                          butborderColor: ColorsOn.secondaryColor,
                          text: 'Signup',
                          butColor: ColorsOn.secondaryColor,
                          onClick: () async {
                            final isValidForm =
                                _formKey.currentState!.validate();
                            if (isValidForm) {
                              var authResponse = await VendorRequestRegister(
                                _VendorName.text,
                                _VendorEmail.text,
                                _VendorPhone.text,
                                _VendorLocation.text,
                                _VendorAbout.text,
                                _VendorOpeningDays.text,
                                _VendorOpeningTime.text,
                              );
                              // ignore: use_build_context_synchronously
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      AlertDialog(
                                        title: BigText(
                                            text: 'Registration Submitted'),
                                        content: const Text(
                                          "Your Business data has successfully submitted in BriskDeals. We will be in contact with you in few days for further registration process. Please don't lose your contact information that you have just submitted!",
                                        ),
                                        actions: [
                                          TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: const Text('Close'))
                                        ],
                                      ));
                              setState(() {
                                _VendorName.clear();
                                _VendorEmail.clear();
                                _VendorPhone.clear();
                                _VendorLocation.clear();
                                _VendorAbout.clear();
                                _VendorOpeningDays.clear();
                                _VendorOpeningTime.clear();
                              });
                            }
                          },
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            NormalText(text: "Already have an Account? "),
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            VendorLoginPage()));
                              },
                              child: NormalText(
                                text: "Login",
                                color: ColorsOn.borderColor,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _VendorEmail.dispose();
    _VendorName.dispose();
    _VendorPhone.dispose();
    _VendorLocation.dispose();
    super.dispose();
  }
}
