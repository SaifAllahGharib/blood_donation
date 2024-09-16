import 'package:blooddoman_clean/RegisterCubit/RegisterScreen.dart';
import 'package:blooddoman_clean/bloc/MainBloc.dart';
import 'package:blooddoman_clean/components/components.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  bool loading2 = false;

  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return RegisterScreen();
    return Container(
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
                    // CacheHelper.getData(key: 'uId') != null
                    //     ? MainCubit.get(context).getDonor()
                    //     :

                    navigateAndFinish(context, const RegisterScreen());
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
          // const SpinKitThreeBounce(
          //         color: Colors.white,
          //       ),
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
                    // CacheHelper.getData(key: 'uId2') != null
                    //     ? MainCubit.get(context).getToHimDonor()
                    //     :

                    navigateTo(context, const RegisterScreen());
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
          // const SpinKitThreeBounce(
          //         color: Colors.white,
          //       ),
        ],
      ),
    );
  }
}
