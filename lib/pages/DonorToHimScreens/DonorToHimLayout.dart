import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/BlocStates.dart';
import '../../bloc/MainBloc.dart';
import '../../components/components.dart';
import '../Home_page.dart';
import 'AddOrderScreen.dart';

class DonorToHimLayout extends StatelessWidget {
  const DonorToHimLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainCubit, MainStates>(listener: (context, state) {
      if (state is LogOutDonorToHimSuccessStates) {
        navigateAndFinish(context, const HomePage());
      }
    }, builder: (context, state) {
      return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          leading: IconButton(
            onPressed: () {
              navigateAndFinish(context, const HomePage());
            },
            icon: const Icon(
              Icons.home,
              color: Colors.white,
            ),
          ),
          actions: [
            MainCubit.get(context).currentIndex2 == 2
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
                          MainCubit.get(context).logOutDonorToHim();
                        },
                      ).show();
                    },
                    icon: const Icon(
                      Icons.logout,
                      color: Colors.white,
                    ))
                : const SizedBox()
          ],
          backgroundColor: const Color.fromRGBO(199, 0, 58, 1),
          title: MainCubit.get(context)
              .titles[MainCubit.get(context).currentIndex2],
        ),
        body: MainCubit.get(context)
            .donorToHimScreens[MainCubit.get(context).currentIndex2],
        bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            MainCubit.get(context).changeIndex2(index);
          },
          currentIndex: MainCubit.get(context).currentIndex2,
          selectedIconTheme:
              const IconThemeData(color: Color.fromRGBO(199, 0, 58, 1)),
          selectedItemColor: const Color.fromRGBO(199, 0, 58, 1),
          items: MainCubit.get(context).items,
        ),
        floatingActionButton: MainCubit.get(context).currentIndex2 == 2
            ? null
            : FloatingActionButton(
                onPressed: () {
                  navigateTo(
                      context,
                      AddOrderScreen(
                          hot: MainCubit.get(context).currentIndex2 == 0
                              ? true
                              : false));
                },
                backgroundColor: const Color.fromRGBO(199, 0, 58, 1),
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
      );
    });
  }
}
