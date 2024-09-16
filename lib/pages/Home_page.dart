import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../RegisterCubit/RegisterScreen.dart';
import '../bloc/BlocStates.dart';
import '../bloc/MainBloc.dart';
import '../components/cache_helper.dart';
import '../components/components.dart';
import 'DonerScreens/DonorLayout.dart';
import 'DonorToHimScreens/DonorToHimLayout.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool loading = false;
  bool loading2 = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainCubit, MainStates>(
      listener: (context, state) {
        if (state is GetDonorToHimSuccessState) {
          MainCubit.get(context).getMyorders();
        }
        if (state is GetMyOrdersSuccessState) {
          setState(() {
            loading2 = false;
          });
          navigateTo(context, const DonorToHimLayout());
        }
        if (state is GetDonorSuccessState) {
          MainCubit.get(context).gethotorders();
        }
        if (state is GetHotOrdersSuccessState) {
          setState(() {
            loading = false;
          });
          navigateTo(context, const DonorLayout());
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/blood_bank.jpg"),
                    fit: BoxFit.cover)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 20,
                ),
                !loading
                    ? InkWell(
                        onTap: () {
                          setState(() {
                            loading = true;
                          });
                          MainCubit.get(context).currentIndex = 0;
                          CacheHelper.getData(key: 'uId') != null
                              ? MainCubit.get(context).getDonor()
                              : navigateAndFinish(
                                  context, const RegisterScreen());
                        },
                        child: Container(
                          alignment: AlignmentDirectional.center,
                          width: MediaQuery.of(context).size.width * 0.33,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.deepPurple),
                          child: const Text(
                            ' مٌتبرع',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      )
                    : CircularProgressIndicator(),
                // const SpinKitThreeBounce(color: Colors.white,),
                const SizedBox(
                  height: 20,
                ),
                !loading2
                    ? InkWell(
                        onTap: () {
                          setState(() {
                            loading2 = true;
                          });
                          MainCubit.get(context).currentIndex2 = 0;
                          CacheHelper.getData(key: 'uId2') != null
                              ? MainCubit.get(context).getToHimDonor()
                              : navigateTo(context, const RegisterScreen());
                        },
                        child: Container(
                          alignment: AlignmentDirectional.center,
                          width: MediaQuery.of(context).size.width * 0.33,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.deepPurple),
                          child: const Text(
                            ' مٌتبرع له',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      )
                    : CircularProgressIndicator(),
                // const SpinKitThreeBounce(color: Colors.white,),
              ],
            ),
          ),
        );
      },
    );
  }
}
