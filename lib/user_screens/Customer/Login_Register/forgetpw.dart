import 'package:brisk_deals/Packages/Packages.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  TextEditingController _UserEmail = new TextEditingController();

  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  void dispose() {
    _UserEmail.dispose();

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
        body: Padding(
          padding: const EdgeInsets.all(19.0),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 10.h,
                  ),
                  BigText(
                    text: "Forget Password",
                    size: 25,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Center(
                    child: Lottie.asset('assets/lottie/forgetpwMail.json',
                        height: 100.h, width: 180.w),
                  ),
                  NtextField(
                    controller: _UserEmail,
                    name: 'Email',
                    prefix: const Icon(Icons.person_outline),
                    autofocus: true,
                    validator: ValidationOfFields.valEmail,
                  ),
                  ListTile(
                    title: Align(
                      alignment: Alignment.center,
                      child: NormalText(
                        text: "A reset link will be sent to the above email!",
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    child: Padding(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom),
                      child: ButtonContainer(
                        text: 'Send link',
                        onClick: () {
                          final isValidForm = _formKey.currentState!.validate();
                          if (isValidForm) {
                            Navigator.pop(context);
                          }
                        },
                        butColor: ColorsOn.secondaryColor,
                        butborderColor: ColorsOn.secondaryColor,
                      ),
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
