// ignore_for_file: use_build_context_synchronously

import 'package:brisk_deals/Packages/Packages.dart';
import 'package:flutter/cupertino.dart';

class UserLoginPage extends StatefulWidget {
  UserLoginPage({
    super.key,
  });

  @override
  State<UserLoginPage> createState() => _UserLoginPageState();
}

class _UserLoginPageState extends State<UserLoginPage> {
  TextEditingController _UserEmail = new TextEditingController();
  TextEditingController _UserPw = new TextEditingController();

  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  void dispose() {
    _UserEmail.dispose();
    _UserPw.dispose();

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
        resizeToAvoidBottomInset: false,
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
                    padding:
                        EdgeInsets.symmetric(horizontal: 30.w, vertical: 10.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(right: 10.w),
                              child: SvgPicture.asset(
                                "assets/images/logo.svg",
                                height: 90.h,
                                width: 90.w,
                              ),
                            ),
                            Column(
                              children: [
                                BigText(
                                  text: "Log in to",
                                ),
                                Center(
                                    child: Row(
                                  children: [
                                    BigText(
                                      text: "Brisk ",
                                      size: 24,
                                    ),
                                    BigText(
                                      text: "Deals",
                                      color: ColorsOn.secondaryColor,
                                      size: 24,
                                    )
                                  ],
                                )),
                              ],
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
                                  child: ForgetPassword(),
                                );
                              },
                            );
                          },
                        ),
                        SizedBox(height: 20.h),
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
                                showCupertinoDialog(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        CupertinoAlertDialog(
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
                                if (user.is_user == 1) {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(const SnackBar(
                                          backgroundColor: Colors.green,
                                          content: Text(
                                            "Logged in",
                                            textAlign: TextAlign.center,
                                          )));
                                  Navigator.of(context).push(
                                      MaterialPageRoute(builder: (context) {
                                    return askLocation();
                                  }));
                                } else {
                                  print("No");
                                }
                              }
                            }
                          },
                          butColor: ColorsOn.secondaryColor,
                          butborderColor: ColorsOn.secondaryColor,
                        ),
                        SizedBox(
                          height: 60.h,
                          child: Padding(
                            padding: EdgeInsets.only(top: 15.h),
                            child: Row(
                              children: [
                                const Flexible(
                                  flex: 1,
                                  child: Divider(
                                    color: ColorsOn.smallColor,
                                    thickness: 0.5,
                                    height: 0,
                                  ),
                                ),
                                Center(
                                  child: Container(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 16.w),
                                    child: NormalText(
                                      text: 'or',
                                      size: 17.sp,
                                    ),
                                  ),
                                ),
                                const Flexible(
                                  flex: 1,
                                  child: Divider(
                                    color: ColorsOn.smallColor,
                                    thickness: 0.5,
                                    height: 0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        googleLoginButton(
                          image: "assets/images/google.svg",
                          text: 'Login with Google',
                          butColor: ColorsOn.textColor,
                          onClick: signIn,
                        ),
                        SizedBox(
                          height: 50.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            NormalText(
                              text: "Don't have an Account? ",
                            ),
                            GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => UserSignUp()));
                                },
                                child: NormalText(
                                  text: "Register",
                                  color: ColorsOn.borderColor,
                                ))
                          ],
                        ),
                        SizedBox(
                          height: 10.h,
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

  Future signIn() async {
    try {
      final user = await GoogleSignInApi.login();

      if (user == null) {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Sign in Failed')));
      } else {
        // ignore: use_build_context_synchronously
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => askLocation()));
      }
    } on PlatformException catch (e) {
      print("Platform Exception");
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Something went wrong')));
      print("Error is $e");
    }
  }
}
