import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../components/cache_helper.dart';
import '../../components/components.dart';
import '../bloc/MainBloc.dart';
import '../pages/DonorToHimScreens/DonorToHimLayout.dart';
import 'cubit.dart';

class OtpSecondScreen extends StatefulWidget {
  const OtpSecondScreen({super.key});

  @override
  State<OtpSecondScreen> createState() => _OtpSecondScreenState();
}

class _OtpSecondScreenState extends State<OtpSecondScreen> {
  var formKey = GlobalKey<FormState>();

  final FirebaseAuth auth = FirebaseAuth.instance;

  var emailController = TextEditingController();
  var controller1 = TextEditingController();
  var controller2 = TextEditingController();
  var controller3 = TextEditingController();
  var controller4 = TextEditingController();
  var controller5 = TextEditingController();
  var controller6 = TextEditingController();
  bool showloading = true;

  @override
  Widget build(BuildContext context) {
    var c = RegisterCubit.get(context);
    return Scaffold(
      backgroundColor: const Color.fromRGBO(6, 30, 69, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(6, 30, 69, 1),
      ),
      body: showloading
          ? Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text('رمز التحقق',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.08,
                            )),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(' نحن قمنا بإرسال كود التحقق إلي',
                            style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.04,
                            )),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(c.phone,
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.04,
                                )),
                            Text(' : رقم الهاتف',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.04,
                                )),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.width * 0.13,
                              width: MediaQuery.of(context).size.width * 0.13,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                      color: Colors.deepPurple, width: 3)),
                              child: TextFormField(
                                controller: controller1,
                                validator: (string) {
                                  if (controller1.text.isEmpty) {
                                    return 'برجاء إدخال الكود';
                                  }
                                  return null;
                                },
                                onChanged: (value) {
                                  if (value.length == 1) {
                                    FocusScope.of(context).nextFocus();
                                  }
                                },
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.08,
                                ),
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(1),
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                              ),
                            ),
                            Container(
                              height: MediaQuery.of(context).size.width * 0.13,
                              width: MediaQuery.of(context).size.width * 0.13,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                      color: Colors.deepPurple, width: 3)),
                              child: TextFormField(
                                controller: controller2,
                                validator: (string) {
                                  if (controller2.text.isEmpty) {
                                    return 'برجاء إدخال الكود';
                                  }
                                  return null;
                                },
                                onChanged: (value) {
                                  if (value.length == 1) {
                                    FocusScope.of(context).nextFocus();
                                  }
                                },
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.08,
                                ),
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(1),
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                              ),
                            ),
                            Container(
                              height: MediaQuery.of(context).size.width * 0.13,
                              width: MediaQuery.of(context).size.width * 0.13,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                      color: Colors.deepPurple, width: 3)),
                              child: TextFormField(
                                controller: controller3,
                                validator: (string) {
                                  if (controller3.text.isEmpty) {
                                    return 'برجاء إدخال الكود';
                                  }
                                  return null;
                                },
                                onChanged: (value) {
                                  if (value.length == 1) {
                                    FocusScope.of(context).nextFocus();
                                  }
                                },
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.08,
                                ),
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(1),
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                              ),
                            ),
                            Container(
                              height: MediaQuery.of(context).size.width * 0.13,
                              width: MediaQuery.of(context).size.width * 0.13,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                      color: Colors.deepPurple, width: 3)),
                              child: TextFormField(
                                controller: controller4,
                                validator: (string) {
                                  if (controller4.text.isEmpty) {
                                    return 'برجاء إدخال الكود';
                                  }
                                  return null;
                                },
                                onChanged: (value) {
                                  if (value.length == 1) {
                                    FocusScope.of(context).nextFocus();
                                  }
                                },
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.08,
                                ),
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(1),
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                              ),
                            ),
                            Container(
                              height: MediaQuery.of(context).size.width * 0.13,
                              width: MediaQuery.of(context).size.width * 0.13,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                      color: Colors.deepPurple, width: 3)),
                              child: TextFormField(
                                controller: controller5,
                                validator: (string) {
                                  if (controller5.text.isEmpty) {
                                    return 'برجاء إدخال الكود';
                                  }
                                  return null;
                                },
                                onChanged: (value) {
                                  if (value.length == 1) {
                                    FocusScope.of(context).nextFocus();
                                  }
                                },
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.08,
                                ),
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(1),
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                              ),
                            ),
                            Container(
                              height: MediaQuery.of(context).size.width * 0.13,
                              width: MediaQuery.of(context).size.width * 0.13,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                      color: Colors.deepPurple, width: 3)),
                              child: TextFormField(
                                controller: controller6,
                                validator: (string) {
                                  if (controller6.text.isEmpty) {
                                    return 'برجاء إدخال الكود';
                                  }
                                  return null;
                                },
                                onChanged: (value) {
                                  if (value.length == 1) {
                                    FocusScope.of(context).nextFocus();
                                  }
                                },
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.08,
                                ),
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(1),
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text('.برجاء الإنتظار قليلا قبل إعادة الارسال ',
                            style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.04,
                            )),
                      ],
                    ),
                    const SizedBox(
                      height: 35,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.deepPurple, width: 2),
                              borderRadius: BorderRadius.circular(10)),
                          child: defaultMaterialButton(
                              width: MediaQuery.of(context).size.width * 0.4,
                              height: MediaQuery.of(context).size.height * 0.07,
                              radius: 10,
                              color: const Color.fromRGBO(6, 30, 69, 1),
                              function: () async {
                                await FirebaseAuth.instance.verifyPhoneNumber(
                                  phoneNumber: "+2${c.phone}",
                                  verificationCompleted:
                                      (PhoneAuthCredential credential) {},
                                  verificationFailed:
                                      (FirebaseAuthException e) {},
                                  codeSent: (String verificationId,
                                      int? resendToken) {
                                    // navigateTo(context,otpScreen( id: verificationId, name: widget.name.text, phone: widget.phone,));
                                  },
                                  codeAutoRetrievalTimeout:
                                      (String verificationId) {},
                                );
                              },
                              text: 'اعادة ارسال'),
                        ),
                        defaultMaterialButton(
                          width: MediaQuery.of(context).size.width * 0.4,
                          height: MediaQuery.of(context).size.height * 0.07,
                          color: Colors.deepPurple,
                          function: () async {
                            var code = controller1.text +
                                controller2.text +
                                controller3.text +
                                controller4.text +
                                controller5.text +
                                controller6.text;

                            if (formKey.currentState!.validate()) {
                              setState(() {
                                showloading = false;
                              });

                              PhoneAuthCredential credential =
                                  PhoneAuthProvider.credential(
                                      verificationId: c.id, smsCode: code);

// Sign the user in (or link) with the credential
                              getCredential(auth, credential, context);
                            } else {
                              setState(() {
                                showloading = true;
                              });
                              showToast(
                                  text: 'حاول مجددا',
                                  state: ToastStates.warning);
                            }
                          },
                          text: 'تاكيد',
                          radius: 10,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          : CircularProgressIndicator(),
      // const Center(child: SpinKitThreeBounce(color: Colors.white,),),
    );
  }

  Future<void> getCredential(
      FirebaseAuth auth, PhoneAuthCredential credential, context) async {
    await auth.signInWithCredential(credential);
    if (auth.currentUser != null) {
      createUser(context, auth);
    }
  }

  void createUser(
    BuildContext context,
    FirebaseAuth auth,
  ) {
    RegisterCubit.get(context).createDonorUser(
        uId: auth.currentUser!.uid,
        name: RegisterCubit.get(context).name,
        phone: RegisterCubit.get(context).phone,
        city: RegisterCubit.get(context).city,
        blood: RegisterCubit.get(context).blood,
        age: RegisterCubit.get(context).age);
    CacheHelper.saveData(key: 'uId2', value: auth.currentUser!.uid);
    MainCubit.get(context).getMyorders();
    MainCubit.get(context).getToHimDonor();
    navigateAndFinish(context, const DonorToHimLayout());
  }
}
