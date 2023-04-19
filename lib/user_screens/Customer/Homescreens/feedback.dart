import 'package:brisk_deals/Packages/Packages.dart';

class SendFeedback extends StatefulWidget {
  const SendFeedback({super.key});

  @override
  State<SendFeedback> createState() => _SendFeedbackState();
}

class _SendFeedbackState extends State<SendFeedback> {
  TextEditingController userMessage = TextEditingController();

  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    User user = context.read<UserCubit>().state;
    int id = user.id!;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 20.h),
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
                          child: const Icon(Icons.arrow_back_ios),
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                  ),
                  Center(
                      child: BigText(
                    text: "SEND FEEDBACK",
                    size: 25,
                    color: ColorsOn.secondaryColor,
                  )),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 30.w, vertical: 20.h),
                    child: Column(
                      children: [
                        NtextField(
                            controller: userMessage,
                            name: "Write your feedback",
                            needArea: true,
                            validator: ValidationOfFields.valField),
                        SizedBox(
                          height: 20.h,
                        ),
                        ButtonContainer(
                          butborderColor: ColorsOn.secondaryColor,
                          text: "Send feedback",
                          butColor: ColorsOn.secondaryColor,
                          onClick: () async {
                            final isValidForm =
                                _formKey.currentState!.validate();
                            if (isValidForm) {
                              await sendFeedback(id, id, userMessage.text,
                                  "${user.email}", "${user.name}");
                              // ignore: use_build_context_synchronously
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: BigText(
                                      text: "Send Feedback",
                                      color: ColorsOn.secondaryColor,
                                    ),
                                    content: NormalText(
                                      text:
                                          "Your feedback was recorded successfully.",
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
                                userMessage.clear();
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
        ),
      ),
    );
  }
}
