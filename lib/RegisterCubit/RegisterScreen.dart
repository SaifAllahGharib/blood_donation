import 'package:flutter/material.dart';

import '../components/components.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final unfocusNode = FocusNode();
  var formKey = GlobalKey<FormState>();
  String dropdownvalue = 'O+';
  String dropdownvalue2 = '20';
  String dropdownvalue3 = 'الإسكندرية';
  String dropdownvalue4 = 'القلب';

  bool showloading = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(unfocusNode),
      child: Scaffold(
        backgroundColor: Colors.grey[300],
        key: scaffoldKey,
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(199, 0, 58, 1),
          title: const Center(
            child: Text(
              'تسجيل البيانات',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        body: Form(
          key: formKey,
          child: ListView(
            children: [
              const Padding(
                padding: EdgeInsetsDirectional.fromSTEB(15.0, 10.0, 15.0, 0.0),
                child: Text(
                  'اسم المُتبرع',
                  style: TextStyle(
                    color: Color.fromRGBO(199, 0, 58, 1),
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.end,
                ),
              ),
              defaultTextFormField(
                  controller: nameController,
                  keyboardType: TextInputType.text,
                  validate: (string) {
                    if (nameController.text.isEmpty) {
                      return "من فضلك ادخل اسم المستخدم";
                    }
                    return null;
                  },
                  label: ""),
              const Padding(
                padding: EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 0.0),
                child: Text(
                  'رقم المُتبرع',
                  style: TextStyle(
                    color: Color.fromRGBO(199, 0, 58, 1),
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.end,
                ),
              ),
              defaultTextFormField(
                  controller: phoneController,
                  keyboardType: TextInputType.phone,
                  validate: (string) {
                    if (phoneController.text.isEmpty) {
                      return "من فضلك ادخل رقم المستخدم";
                    }
                    return null;
                  },
                  label: ""),
              const Padding(
                padding: EdgeInsetsDirectional.fromSTEB(15.0, 10.0, 15.0, 0.0),
                child: Text(
                  'فصيلة الدم',
                  style: TextStyle(
                    color: Color.fromRGBO(199, 0, 58, 1),
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.end,
                ),
              ),
              dropMenu(
                context: context,
                dropdownvalue: dropdownvalue,
                items: bloodType,
                fun: (newValue) {
                  setState(() {
                    dropdownvalue = newValue;
                  });
                },
              ),
              const Padding(
                padding: EdgeInsetsDirectional.fromSTEB(15.0, 10.0, 15.0, 0.0),
                child: Text(
                  'العمر ',
                  style: TextStyle(
                    color: Color.fromRGBO(199, 0, 58, 1),
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.end,
                ),
              ),
              dropMenu(
                context: context,
                dropdownvalue: dropdownvalue2,
                items: age,
                fun: (newValue) {
                  setState(() {
                    dropdownvalue2 = newValue;
                  });
                },
              ),
              const Padding(
                padding: EdgeInsetsDirectional.fromSTEB(15.0, 10.0, 15.0, 0.0),
                child: Text(
                  ' المحافظة',
                  style: TextStyle(
                    color: Color.fromRGBO(199, 0, 58, 1),
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.end,
                ),
              ),
              dropMenu(
                context: context,
                dropdownvalue: dropdownvalue3,
                items: cities,
                fun: (newValue) {
                  setState(() {
                    dropdownvalue3 = newValue;
                  });
                },
              ),
              const Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 15.0, 0.0),
                child: Text(
                  'هل تعاني من امراض مزمنة',
                  style: TextStyle(
                    color: Color.fromRGBO(199, 0, 58, 1),
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.end,
                ),
              ),
              dropMenu(
                context: context,
                dropdownvalue: dropdownvalue4,
                items: disease,
                fun: (newValue) {
                  setState(() {
                    dropdownvalue4 = newValue;
                  });
                },
              ),
              Align(
                alignment: const AlignmentDirectional(0.0, 0.0),
                child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(
                        0.0, 15.0, 0.0, 0.0),
                    // child: Text("data7"),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.deepPurple),
                      child: MaterialButton(
                        onPressed: () async {
                          // if (nameController.text.isNotEmpty &&
                          //     phoneController.text.isNotEmpty) {
                          //   if (phoneController.text.length != 11) {
                          //     showToast(
                          //         text: 'رقم الهاتف غير صحيح',
                          //         state: ToastStates.warning);
                          //   } else {
                          //     showToast(
                          //         text: 'برجاء الانتظار قليلا',
                          //         state: ToastStates.success);
                          //     setState(() {
                          //       showloading = false;
                          //     });
                          //     await FirebaseAuth.instance.verifyPhoneNumber(
                          //       phoneNumber: "+2${phoneController.text}",
                          //       verificationCompleted:
                          //           (PhoneAuthCredential credential) {},
                          //       verificationFailed: (FirebaseAuthException e) {
                          //         showToast(
                          //             text: 'يرجا المحاولة مره اخري',
                          //             state: ToastStates.success);
                          //         setState(() {
                          //           showloading = true;
                          //         });
                          //       },
                          //       codeSent:
                          //           (String verificationId, int? resendToken) {
                          //         var c = RegisterCubit.get(context);
                          //         c.id = verificationId;
                          //         c.name = nameController.text;
                          //         c.phone = phoneController.text;
                          //         c.age = dropdownvalue2;
                          //         c.city = dropdownvalue3;
                          //         c.blood = dropdownvalue;
                          //         c.disease = dropdownvalue4;
                          //         // widget.donor
                          //         //     ? navigateTo(context, const OtpScreen())
                          //         //     : navigateTo(
                          //         //         context, const OtpSecondScreen());
                          //       },
                          //       codeAutoRetrievalTimeout:
                          //           (String verificationId) {},
                          //     );
                          //   }
                          // } else {
                          //   showToast(
                          //       text: 'ادخل كل الحقول',
                          //       state: ToastStates.error);
                          // }
                        },
                        child: const Text(
                          'حفظ البيانات',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 20),
                        ),
                      ),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
