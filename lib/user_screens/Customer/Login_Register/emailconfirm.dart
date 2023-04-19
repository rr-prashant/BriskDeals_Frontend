import 'dart:ffi';

import 'package:brisk_deals/Packages/Packages.dart';
import 'package:http/http.dart' as http;

class emailConfirmation extends StatefulWidget {
  emailConfirmation({
    super.key,
  });

  @override
  State<emailConfirmation> createState() => _emailConfirmationState();
}

class _emailConfirmationState extends State<emailConfirmation> {
  @override
  Widget build(BuildContext context) {
    Future<dynamic> confirmEmail(String key) async {
      Map<String, String> body = {"key": key};
      var url = Uri.parse("$baseUrl/accounts/auth/confirm-email/");
      var res = await http.post(url, body: body);

      if (res.statusCode == 200 || res.statusCode == 201) {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            duration: Duration(milliseconds: 1000),
            backgroundColor: Colors.green,
            content: Text(
              "Registration Successful",
              textAlign: TextAlign.center,
            )));
        // ignore: use_build_context_synchronously
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => UserLoginPage()));
      } else {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            duration: Duration(milliseconds: 1000),
            backgroundColor: Colors.red,
            content: Text(
              "Key error",
              textAlign: TextAlign.center,
            )));
      }
    }

    GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    TextEditingController _UserKey = new TextEditingController();
    return Scaffold(
      body: Center(
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  BigText(
                    text: "Confirm Your Email",
                    color: ColorsOn.secondaryColor,
                  ),
                  Center(
                    child: Lottie.asset('assets/lottie/mail.json',
                        height: 280.h, width: 290.w),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 30.w,
                      right: 30.w,
                      bottom: 5.h,
                    ),
                    child: NtextField(
                        controller: _UserKey,
                        name: "Token",
                        validator: ValidationOfFields.valToken),
                  ),
                  Center(
                    child: NormalText(
                      text: "Please enter the token sent to you via email",
                      overFlow: TextOverflow.visible,
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  ButtonContainer(
                      butborderColor: ColorsOn.secondaryColor,
                      text: "Confirm",
                      butColor: ColorsOn.secondaryColor,
                      onClick: () async {
                        final isValidForm = _formKey.currentState!.validate();
                        if (isValidForm) {
                          var authResponse = await confirmEmail(_UserKey.text);
                          // if (authResponse.runtimeType == int) {
                          //   // ignore: use_build_context_synchronously
                          //   ScaffoldMessenger.of(context)
                          //       .showSnackBar(const SnackBar(
                          //           duration: Duration(milliseconds: 1000),
                          //           backgroundColor: Colors.red,
                          //           content: Text(
                          //             "Key error",
                          //             textAlign: TextAlign.center,
                          //           )));
                          // } else if (authResponse.runtimeType == String) {
                          //   // ignore: use_build_context_synchronously
                          //   showDialog(
                          //     context: context,
                          //     builder: (context) {
                          //       return Dialog(
                          //         child: Container(
                          //           alignment: Alignment.center,
                          //           height: 200.h,
                          //           width: 250.w,
                          //           decoration: const BoxDecoration(),
                          //           child: const Text(
                          //             "Registration Successful",
                          //           ),
                          //         ),
                          //       );
                          //     },
                          //   );
                          //   // ignore: use_build_context_synchronously
                          //   Navigator.of(context).push(
                          //     MaterialPageRoute(builder: (context) {
                          //       return UserLoginPage();
                          //     }),
                          //   );
                          // }
                        }
                      })
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
