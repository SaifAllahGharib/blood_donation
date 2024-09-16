import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/BlocStates.dart';
import '../../bloc/MainBloc.dart';
import '../../components/components.dart';

class SettingPage2 extends StatefulWidget {
  const SettingPage2({super.key});

  @override
  State<SettingPage2> createState() => _SettingPage2State();
}

class _SettingPage2State extends State<SettingPage2> {
  var nameController = TextEditingController();

  var phoneController = TextEditingController();

  String dropdownvalue = 'B+';

  String dropdownvalue2 = '20';

  String dropdownvalue3 = 'الإسكندرية';

  String dropdownvalue4 = 'القلب';

  bool showloading = true;

  @override
  Widget build(BuildContext context) {
    var user = MainCubit.get(context).donorToHimUser;
    nameController.text = user!.name!;
    phoneController.text = user.phone!;
    dropdownvalue = user.blood!;
    dropdownvalue2 = user.age!;
    dropdownvalue3 = user.city!;

    return BlocConsumer<MainCubit, MainStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return ListView(
            children: [
              const Padding(
                padding: EdgeInsetsDirectional.fromSTEB(15.0, 10.0, 15.0, 0.0),
                child: Text(
                  'اسم المستخدم',
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
                  'رقم المستخدم',
                  style: TextStyle(
                    color: Color.fromRGBO(199, 0, 58, 1),
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.end,
                ),
              ),
              defaultReadOnlyTextFormField(
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
                  MainCubit.get(context).em();
                  dropdownvalue = newValue;
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
                  MainCubit.get(context).em();
                  dropdownvalue2 = newValue;
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
                  MainCubit.get(context).em();
                  dropdownvalue3 = newValue;
                },
              ),
              Align(
                alignment: const AlignmentDirectional(0.0, 0.0),
                child: Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                  child: Text("data5"),
                  // child: ConditionalBuilder(
                  //   condition: showloading,
                  //   builder: (context) => Container(
                  //     decoration: BoxDecoration(
                  //         borderRadius: BorderRadius.circular(20),
                  //         color: Colors.deepPurple),
                  //     child: MaterialButton(
                  //       onPressed: () async {
                  //         if (nameController.text.isNotEmpty &&
                  //             phoneController.text.isNotEmpty) {
                  //           if (phoneController.text.length != 11) {
                  //             showToast(
                  //                 text: 'رقم الهاتف غير صحيح',
                  //                 state: ToastStates.warning);
                  //           } else {
                  //             MainCubit.get(context).updateDonorToHim(
                  //               phone: phoneController.text,
                  //               name: nameController.text,
                  //               age: dropdownvalue2,
                  //               city: dropdownvalue3,
                  //               blood: dropdownvalue,
                  //             );
                  //           }
                  //           MainCubit.get(context).changeIndex2(0);
                  //         } else {
                  //           showToast(
                  //               text: 'ادخل كل الحقول',
                  //               state: ToastStates.error);
                  //         }
                  //       },
                  //       child: const Text(
                  //         'حفظ البيانات',
                  //         style: TextStyle(
                  //             fontWeight: FontWeight.bold,
                  //             color: Colors.white,
                  //             fontSize: 20),
                  //       ),
                  //     ),
                  //   ),
                  //   fallback: (context) =>
                  //       const Center(child: CircularProgressIndicator()),
                  // ),
                ),
              )
            ],
          );
        });
  }
}
