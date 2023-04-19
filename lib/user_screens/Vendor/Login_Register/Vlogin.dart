import 'package:brisk_deals/Packages/Packages.dart';

class VendorLoginPage extends StatefulWidget {
  VendorLoginPage({
    super.key,
  });

  @override
  State<VendorLoginPage> createState() => _VendorLoginPageState();
}

class _VendorLoginPageState extends State<VendorLoginPage> {
  TextEditingController _UserEmail = new TextEditingController();
  TextEditingController _UserPw = new TextEditingController();

  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    _UserEmail;
    _UserPw;
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
        resizeToAvoidBottomInset: false,
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
                    padding:
                        EdgeInsets.symmetric(horizontal: 30.w, vertical: 5.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                                text: "Login into your Business Account",
                                size: 16,
                                color: ColorsOn.secondaryColor,
                              )
                            ],
                          ),
                        ),
                        Column(
                          children: [
                            Lottie.asset('assets/lottie/growBusiness.json',
                                height: 180.h, width: 350.w),
                            NormalText(
                              text:
                                  "Grow And Reach Out To Your Beloved Customers!",
                              size: 13,
                            )
                          ],
                        ),
                        SizedBox(height: 20.h),
                        NtextField(
                          controller: _UserEmail,
                          name: 'Email',
                          prefix: const Icon(Icons.person_outline),
                          validator: ValidationOfFields.valEmail,
                        ),
                        SizedBox(
                          height: 25.h,
                        ),
                        NtextField(
                          controller: _UserPw,
                          name: 'Password',
                          obsecure: true,
                          isPassword: true,
                          prefix: const Icon(Icons.lock_outline),
                          validator: ValidationOfFields.valPassword,
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        GestureDetector(
                          child: NormalText(
                            text: "Forget Password?",
                            decoration: TextDecoration.underline,
                          ),
                          onTap: () {
                            showModalBottomSheet(
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(50.0),
                                ),
                              ),
                              context: context,
                              isScrollControlled: true,
                              builder: (context) {
                                return SizedBox(
                                  height: 400.h,
                                  child: VendorForgetPw(),
                                );
                              },
                            );
                          },
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        ButtonContainer(
                          text: 'Login',
                          onClick: () async {
                            final isValidForm =
                                _formKey.currentState!.validate();
                            if (isValidForm) {
                              var authResponse =
                                  await userAuth(_UserEmail.text, _UserPw.text);
                              if (authResponse.runtimeType == String) {
                                // ignore: use_build_context_synchronously
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        AlertDialog(
                                          title: const Text('Invalid Input'),
                                          content: Text(
                                            authResponse,
                                          ),
                                          actions: [
                                            TextButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                child: const Text('Close'))
                                          ],
                                        ));
                              } else if (authResponse.runtimeType == User) {
                                User user = authResponse;
                                // ignore: use_build_context_synchronously
                                context.read<UserCubit>().emit(user);
                                if (user.is_user == 2) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          duration:
                                              Duration(milliseconds: 1000),
                                          backgroundColor: Colors.green,
                                          content: Text(
                                            "Logged in",
                                            textAlign: TextAlign.center,
                                          )));
                                  Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              VendorHomePage()));
                                } else {
                                  await logOutUser(user.token!);
                                  // ignore: use_build_context_synchronously
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) =>
                                          AlertDialog(
                                            title: const Text('Invalid Input'),
                                            content: const Text(
                                                'Unable to log in with provided credentials.'),
                                            actions: [
                                              TextButton(
                                                  onPressed: () async {
                                                    Navigator.pop(context);
                                                  },
                                                  child: const Text('Close')),
                                            ],
                                          ));
                                }
                              }
                            }
                          },
                          butColor: ColorsOn.secondaryColor,
                          butborderColor: ColorsOn.secondaryColor,
                        ),
                        SizedBox(
                          height: 40.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            NormalText(
                              text: "Have Your Own Business? ",
                            ),
                            GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              VendorSignUp()));
                                },
                                child: NormalText(
                                  text: "Register",
                                  color: ColorsOn.borderColor,
                                ))
                          ],
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
    _UserEmail.dispose();
    _UserPw.dispose();

    super.dispose();
  }
}
