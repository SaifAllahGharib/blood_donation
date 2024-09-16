import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

import '../bloc/BlocStates.dart';
import '../bloc/MainBloc.dart';

final Uri _url = Uri.parse(
    'https://www.freeprivacypolicy.com/live/898de489-8184-4af4-b07a-5fa7cb43489e');

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  var nameController = TextEditingController();

  var phoneController = TextEditingController();

  String dropdownvalue = 'B+';

  String dropdownvalue2 = '20';

  String dropdownvalue3 = 'الإسكندرية';

  String dropdownvalue4 = 'القلب';

  bool showloading2 = true;

  @override
  Widget build(BuildContext context) {
    var user = MainCubit.get(context).donorModel;
    nameController.text = user!.name!;
    phoneController.text = user.phone!;
    dropdownvalue = user.blood!;
    dropdownvalue2 = user.age!;
    dropdownvalue3 = user.city!;
    dropdownvalue4 = user.disease!;
    return BlocConsumer<MainCubit, MainStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Text("data6");
          // return  ConditionalBuilder(
          //   condition: state is! GetDonorLoadingState,
          //   builder: (context) {
          //     return Form(
          //
          //         child: ListView(
          //           children: [
          //             const Padding(
          //               padding:
          //               EdgeInsetsDirectional.fromSTEB(15.0, 10.0, 15.0, 0.0),
          //               child: Text(
          //                 'اسم المُتبرع',
          //                 style: TextStyle(color: Color.fromRGBO(199, 0, 58,1),fontWeight: FontWeight.bold,),
          //                 textAlign: TextAlign.end,
          //               ),
          //             ),
          //             defaultTextFormField(
          //                 controller: nameController,
          //                 keyboardType: TextInputType.text,
          //                 validate: (string){
          //                   if(nameController.text.isEmpty){
          //                     return "من فضلك ادخل اسم المستخدم";
          //                   }
          //                   return null;},
          //                 label: ""),
          //             const Padding(
          //               padding:
          //               EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 0.0),
          //               child: Text(
          //                 'رقم المُتبرع',
          //                 style: TextStyle(color: Color.fromRGBO(199, 0, 58,1),fontWeight: FontWeight.bold,),
          //                 textAlign: TextAlign.end,
          //               ),
          //             ),
          //             defaultReadOnlyTextFormField(
          //                 controller: phoneController,
          //                 keyboardType: TextInputType.phone,
          //                 validate: (string){
          //                   if(phoneController.text.isEmpty){
          //                     return "من فضلك ادخل رقم المستخدم";
          //                   }
          //                   return null;},
          //                 label: ""),
          //             const Padding(
          //               padding:
          //               EdgeInsetsDirectional.fromSTEB(15.0, 10.0, 15.0, 0.0),
          //               child: Text(
          //                 'فصيلة الدم',
          //                 style: TextStyle(color: Color.fromRGBO(199, 0, 58,1),fontWeight: FontWeight.bold,),
          //                 textAlign: TextAlign.end,
          //               ),
          //             ),
          //             dropMenu(
          //               context: context,
          //               dropdownvalue: dropdownvalue,
          //               items: bloodType,
          //               fun:(newValue) {
          //                 MainCubit.get(context).em();
          //                   dropdownvalue = newValue;
          //
          //               }, ),
          //             const Padding(
          //               padding:
          //               EdgeInsetsDirectional.fromSTEB(15.0, 10.0, 15.0, 0.0),
          //               child: Text(
          //                 'العمر ',
          //                 style: TextStyle(color: Color.fromRGBO(199, 0, 58,1),fontWeight: FontWeight.bold,),
          //                 textAlign: TextAlign.end,
          //               ),
          //             ),
          //             dropMenu(
          //               context: context,
          //               dropdownvalue: dropdownvalue2,
          //               items: age,
          //               fun:(newValue) {
          //                 MainCubit.get(context).em();
          //                   dropdownvalue2= newValue;
          //
          //               }, ),
          //             const Padding(
          //               padding:
          //               EdgeInsetsDirectional.fromSTEB(15.0, 10.0, 15.0, 0.0),
          //               child: Text(
          //                 ' المحافظة',
          //                 style: TextStyle(color: Color.fromRGBO(199, 0, 58,1),fontWeight: FontWeight.bold,),
          //                 textAlign: TextAlign.end,
          //               ),
          //             ),
          //             dropMenu(
          //               context: context,
          //               dropdownvalue: dropdownvalue3,
          //               items: cities,
          //               fun:(newValue) {
          //                 MainCubit.get(context).em();
          //                   dropdownvalue3= newValue;
          //
          //               }, ),
          //             const Padding(
          //               padding:
          //               EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 15.0, 0.0),
          //               child: Text(
          //                 'هل تعاني من امراض مزمنة',
          //                 style: TextStyle(color: Color.fromRGBO(199, 0, 58,1),fontWeight: FontWeight.bold,),
          //                 textAlign: TextAlign.end,
          //               ),
          //             ),
          //             dropMenu(
          //               context: context,
          //               dropdownvalue: dropdownvalue4,
          //               items: disease,
          //               fun:(newValue) {
          //                 MainCubit.get(context).em();
          //                   dropdownvalue4= newValue;
          //
          //               }, ),
          //             Align(
          //               alignment: const AlignmentDirectional(0.0, 0.0),
          //               child: Padding(
          //                 padding:
          //                 const EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
          //                 child: ConditionalBuilder(
          //                   condition: showloading2,
          //                   builder: ( context)=>
          //                       Container(
          //
          //                         decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color:Colors.deepPurple ),
          //                         child: MaterialButton(
          //                           onPressed: () async {
          //
          //                             if (nameController.text.isNotEmpty
          //                                 &&phoneController.text.isNotEmpty
          //
          //                             ){
          //
          //                               if(phoneController.text.length!=11)
          //                               {
          //                                 showToast(text: 'رقم الهاتف غير صحيح', state: ToastStates.warning);
          //                               }else{
          //
          //
          //
          //
          //
          //
          //
          //
          //                                   MainCubit.get(context).updateDonor(
          //                                       phone: phoneController.text,
          //                                       name: nameController.text,
          //                                       age: dropdownvalue2,
          //                                       city: dropdownvalue3,
          //                                       blood: dropdownvalue,
          //                                       disease: dropdownvalue4);
          //                               }
          //                                 MainCubit.get(context).changeIndex(0);
          //                             }
          //                             else{
          //                               showToast(text: 'ادخل كل الحقول', state: ToastStates.error);
          //                             }
          //                           },
          //                           child: const Text('حفظ البيانات',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 20),),
          //
          //                         ),
          //                       ), fallback:  (context) =>
          //                 const Center(child: CircularProgressIndicator()) ,
          //                 ),
          //
          //
          //
          //               ),),
          //     const SizedBox(height:15,),
          //             TextButton(onPressed: (){
          //               _launchUrl();
          //             }, child: const Text('Privacy',style: TextStyle(color: Colors.grey),))
          //           ],
          //         ),
          //       );
          //   },
          //   fallback: (context){return const Center(child: CircularProgressIndicator());},
          // );
        });
  }

  Future<void> _launchUrl() async {
    if (!await launchUrl(_url, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $_url');
    }
  }
}
