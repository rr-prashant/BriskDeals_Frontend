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
                    ],
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
                          obsecure: true,
                          prefix: const Icon(Icons.location_city),
                          isPassword: true,
                          validator: ValidationOfFields.valName,
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
                                  _VendorLocation.text);
                              print("Submitted");
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
                                Navigator.of(context).push(
                                  MaterialPageRoute(builder: (context) {
                                    return VendorLoginPage();
                                  }),
                                );
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
    _VendorName.dispose();
    _VendorEmail.dispose();
    _VendorLocation.dispose();
    super.dispose();
  }
}
