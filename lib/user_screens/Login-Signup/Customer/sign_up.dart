import 'package:brisk_deals/Packages/Packages.dart';

class UserSignUp extends StatefulWidget {
  const UserSignUp({super.key});

  @override
  State<UserSignUp> createState() => _UserSignUpState();
}

class _UserSignUpState extends State<UserSignUp> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _UserName = TextEditingController();
  TextEditingController _UserEmail = TextEditingController();
  TextEditingController _UserPw = TextEditingController();
  TextEditingController _UserPwConfirm = TextEditingController();

  void dispose() {
    _UserName.dispose();
    _UserEmail.dispose();
    _UserPw.dispose();
    _UserPwConfirm.dispose();
    super.dispose();
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
                                text: "Registration",
                                size: 16,
                                color: ColorsOn.secondaryColor,
                              )
                            ],
                          ),
                        ),
                        Center(
                            child: Column(
                          children: [
                            Lottie.asset('assets/lottie/getDiscount.json',
                                height: 180.h, width: 350.w),
                            NormalText(
                              text: "Be a member and get your best deals here!",
                              size: 14,
                            )
                          ],
                        )),
                        SizedBox(height: 25.h),
                        NtextField(
                            controller: _UserName,
                            name: 'Name',
                            prefix: const Icon(Icons.person_outline),
                            validator: ValidationOfFields.valName),
                        SizedBox(
                          height: 25.h,
                        ),
                        NtextField(
                          controller: _UserEmail,
                          name: 'Email',
                          prefix: const Icon(Icons.mail_outline),
                          validator: ValidationOfFields.valEmail,
                        ),
                        SizedBox(
                          height: 25.h,
                        ),
                        NtextField(
                          controller: _UserPw,
                          name: 'Password',
                          obsecure: true,
                          prefix: const Icon(Icons.lock_outline),
                          isPassword: true,
                          validator: ValidationOfFields.valPassword,
                        ),
                        SizedBox(
                          height: 25.h,
                        ),
                        NtextField(
                          controller: _UserPwConfirm,
                          name: 'Confirm Password',
                          obsecure: true,
                          prefix: const Icon(Icons.lock_outline),
                          isPassword: true,
                          validator: ValidationOfFields.valPassword,
                        ),
                        SizedBox(
                          height: 25.h,
                        ),
                        ButtonContainer(
                          butborderColor: ColorsOn.secondaryColor,
                          text: 'Signup',
                          butColor: ColorsOn.secondaryColor,
                          onClick: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) {
                                return emailConfirmation();
                              }),
                            );
                          },
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Already have an Account? ",
                              style: TextStyle(
                                  color: ColorsOn.greyColor,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'ProximaNova',
                                  decoration: TextDecoration.none),
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Text(
                                "Login",
                                style: TextStyle(
                                    color: ColorsOn.borderColor,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'ProximaNova',
                                    decoration: TextDecoration.none),
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
}
