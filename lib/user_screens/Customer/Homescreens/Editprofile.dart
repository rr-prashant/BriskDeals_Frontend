import 'package:brisk_deals/Packages/Packages.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  TextEditingController fName = TextEditingController();
  TextEditingController lName = TextEditingController();
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 40.h),
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
              Center(
                  child: BigText(
                text: "EDIT PROFILE",
                size: 25,
                color: ColorsOn.secondaryColor,
              )),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 20.h),
                child: Column(
                  children: [
                    NtextField(
                        controller: fName,
                        name: "First Name",
                        validator: ValidationOfFields.valName),
                    SizedBox(
                      height: 20.h,
                    ),
                    NtextField(
                        controller: lName,
                        name: "Last Name",
                        validator: ValidationOfFields.valName),
                    SizedBox(
                      height: 20.h,
                    ),
                    ButtonContainer(
                      butborderColor: ColorsOn.secondaryColor,
                      text: "Update profile",
                      butColor: ColorsOn.secondaryColor,
                      onClick: () async {
                        final isValidForm = _formKey.currentState!.validate();
                        if (isValidForm) {
                          // ignore: use_build_context_synchronously
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: BigText(
                                  text: "Edit profile",
                                  color: ColorsOn.secondaryColor,
                                ),
                                content: NormalText(
                                  text:
                                      "Your profile has been updated successfully.",
                                  maxline: 2,
                                ),
                                actions: [
                                  SimpleDialogOption(
                                    child: const Text("Close"),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                  )
                                ],
                              );
                            },
                          );
                          setState(() {
                            fName.clear();
                            lName.clear();
                          });
                        }
                      },
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
