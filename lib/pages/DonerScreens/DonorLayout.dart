import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/BlocStates.dart';
import '../../bloc/MainBloc.dart';
import '../../components/components.dart';
import '../Home_page.dart';

class DonorLayout extends StatelessWidget {
  const DonorLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainCubit, MainStates>(listener: (context, state) {
      if (state is LogOutDonorSuccessStates) {
        navigateAndFinish(context, const HomePage());
      }
    }, builder: (context, state) {
      return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          actions: [
            MainCubit.get(context).currentIndex == 2
                ? IconButton(
                    onPressed: () {
                      AwesomeDialog(
                        context: context,
                        dialogType: DialogType.warning,
                        animType: AnimType.rightSlide,
                        title: 'تسجيل خروج',
                        desc: 'هل تريد حقا تسجيل الخروج ؟',
                        btnCancelOnPress: () {},
                        btnCancelText: 'لا',
                        btnOkText: 'نعم',
                        btnOkOnPress: () {
                          MainCubit.get(context).logOutDonor();
                        },
                      ).show();
                    },
                    icon: const Icon(
                      Icons.logout,
                      color: Colors.white,
                    ))
                : const SizedBox()
          ],
          leading: IconButton(
            onPressed: () {
              navigateAndFinish(context, const HomePage());
            },
            icon: const Icon(
              Icons.home,
              color: Colors.white,
            ),
          ),
          backgroundColor: const Color.fromRGBO(199, 0, 58, 1),
          title: MainCubit.get(context)
              .titles[MainCubit.get(context).currentIndex],
        ),
        body: MainCubit.get(context)
            .donorScreens[MainCubit.get(context).currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            MainCubit.get(context).changeIndex(index);
          },
          currentIndex: MainCubit.get(context).currentIndex,
          selectedIconTheme:
              const IconThemeData(color: Color.fromRGBO(199, 0, 58, 1)),
          selectedItemColor: const Color.fromRGBO(199, 0, 58, 1),
          items: MainCubit.get(context).items,
        ),
      );
    });
  }
}
