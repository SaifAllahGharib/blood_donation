
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/BlocStates.dart';
import '../../bloc/MainBloc.dart';
import '../../components/components.dart';
import 'DonorToHimLayout.dart';

class AddOrderScreen extends StatefulWidget {
   const AddOrderScreen({super.key,required this.hot});
  final bool hot;

  @override
  State<AddOrderScreen> createState() => _AddOrderScreenState();
   }

class _AddOrderScreenState extends State<AddOrderScreen> {
  var nameController=TextEditingController();

  var phoneController=TextEditingController();

  var placeController=TextEditingController();

  var formKey = GlobalKey<FormState>();

  String blood =  'O+';

   String agee =  '20';

   String city =  'الإسكندرية';

   String dia =  'القلب';

   String amount =  '1';

  @override
  Widget build(BuildContext context) {

    return  BlocConsumer<MainCubit,MainStates>(
        listener:  (context,state){
          if(state is CreateOrderSuccessState){
            navigateAndFinish(context, const DonorToHimLayout());
          }
        },
        builder: (context,state){
          return Scaffold(

            appBar: AppBar(
              backgroundColor: Colors.deepPurple,
              title: const Center(child: Text('إنشاء طلب',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),),
              iconTheme: const IconThemeData(color: Colors.white),
            ),
            body: SafeArea(
              child: Form(
                key:formKey ,
              child: ListView(children: [
                const Padding(
                  padding:
                  EdgeInsetsDirectional.fromSTEB(15.0, 10.0, 15.0, 0.0),
                  child: Text(
                    'اسم الحالة',
                    style: TextStyle(color: Color.fromRGBO(199, 0, 58,1),fontWeight: FontWeight.bold,),
                    textAlign: TextAlign.end,
                  ),
                ),
                defaultTextFormField(
                    controller: nameController,
                    keyboardType: TextInputType.text,
                    validate: (string){
                      if(nameController.text.isEmpty){
                        return "من فضلك ادخل اسم الحالة";
                      }
                      return null;},
                    label: ""),
                const Padding(
                  padding:
                  EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 0.0),
                  child: Text(
                    'رقم الحالة',
                    style: TextStyle(color: Color.fromRGBO(199, 0, 58,1),fontWeight: FontWeight.bold,),
                    textAlign: TextAlign.end,
                  ),
                ),
                defaultTextFormField(
                    controller: phoneController,
                    keyboardType: TextInputType.phone,
                    validate: (string){
                      if(phoneController.text.isEmpty){
                        return "من فضلك ادخل رقم الحالة";
                      }
                      return null;},
                    label: ""),
                const Padding(
                  padding:
                  EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 0.0),
                  child: Text(
                    'اسم المستشفي',
                    style: TextStyle(color: Color.fromRGBO(199, 0, 58,1),fontWeight: FontWeight.bold,),
                    textAlign: TextAlign.end,
                  ),
                ),
                defaultTextFormField(
                    controller: placeController,
                    keyboardType: TextInputType.text,
                    validate: (string){
                      if(placeController.text.isEmpty){
                        return "من فضلك ادخل اسم المستشفي";
                      }
                      return null;},
                    label: ""),
                widget.hot?
               const Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(15.0, 10.0, 15.0, 0.0), child: Text(
                    'فصيلة الدم',
                    style: TextStyle(color: Color.fromRGBO(199, 0, 58,1),fontWeight: FontWeight.bold,),
                    textAlign: TextAlign.end,
                  ),):const SizedBox(),
                widget.hot?  dropMenu(
                  context: context,
                  dropdownvalue: blood,
                  items: bloodType,
                  fun:(newValue) {
                      setState(() {
                        blood = newValue;
                      });


                  }, ):const SizedBox(),
                const Padding(
                  padding:
                  EdgeInsetsDirectional.fromSTEB(15.0, 10.0, 15.0, 0.0),
                  child: Text(
                    'العمر ',
                    style: TextStyle(color: Color.fromRGBO(199, 0, 58,1),fontWeight: FontWeight.bold,),
                    textAlign: TextAlign.end,
                  ),
                ),
                dropMenu(
                  context: context,
                  dropdownvalue: agee,
                  items: age,
                  fun:(newValue) {
                    setState(() {
                      agee= newValue;
                    });


                  }, ),


                const Padding(
                  padding:
                  EdgeInsetsDirectional.fromSTEB(15.0, 10.0, 15.0, 0.0),
                  child: Text(
                    'عدد الاكياس المطلوبه ',
                    style: TextStyle(color: Color.fromRGBO(199, 0, 58,1),fontWeight: FontWeight.bold,),
                    textAlign: TextAlign.end,
                  ),
                ),
                dropMenu(
                  context: context,
                  dropdownvalue: amount,
                  items: amounts,
                  fun:(newValue) {
                    setState(() {
                      amount = newValue;
                    });

                  }, ),
                widget.hot?     const Padding(
                  padding:
                  EdgeInsetsDirectional.fromSTEB(15.0, 10.0, 15.0, 0.0),
                  child: Text(
                    'المحافظة ',
                    style: TextStyle(color: Color.fromRGBO(199, 0, 58,1),fontWeight: FontWeight.bold,),
                    textAlign: TextAlign.end,
                  ),
                ):const SizedBox(),
                widget.hot?  dropMenu(
                  context: context,
                  dropdownvalue: city,
                  items: cities,
                  fun:(newValue) {
                    setState(() {
                      city = newValue;
                    });

                  }, ):const SizedBox(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal:40,vertical: 10 ),
                      child: Container(
                        width: MediaQuery.of(context).size.width*0.3,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.deepPurple ),
                        child: MaterialButton(child: const Text('نشر',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 20),), onPressed: () {
                        if(formKey.currentState!.validate()) {
                          widget.hot?MainCubit.get(context).createHotOrder(
                              blood: blood,
                              city: city,
                              name: nameController.text,
                              phone: phoneController.text,
                              age: agee,
                              state: 'حالة خطرة',
                              amount: amount,
                              place: placeController.text):
                          MainCubit.get(context).createOrder(
                              blood: MainCubit.get(context).donorToHimUser!.blood!,
                              city: MainCubit.get(context).donorToHimUser!.city!,
                              name: nameController.text,
                              phone: phoneController.text,
                              age: agee,
                              state: 'تبرع',
                              amount: amount,
                              place: placeController.text,
                              user: MainCubit.get(context).donorToHimUser!);
                        }else{
                          showToast(text: 'من فضلك ادخل جميع البيانات', state: ToastStates.warning);
                        }
                        },),),
                    )
              ],),),
            ),
          );
          },);
  }
}
