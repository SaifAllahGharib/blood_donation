import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Models/donorToHimModel.dart';
import '../Models/donormodel.dart';
import '../Models/orderModel.dart';
import '../components/cache_helper.dart';
import '../pages/DonerScreens/HotOrderDonorPage.dart';
import '../pages/DonerScreens/OrderDonorPage.dart';
import '../pages/DonorToHimScreens/HotOrderToHimDonorPage.dart';
import '../pages/DonorToHimScreens/OrderDonorToHimPage.dart';
import '../pages/DonorToHimScreens/SettingPage2.dart';
import '../pages/SettingPage.dart';
import 'BlocStates.dart';

class MainCubit extends Cubit<MainStates> {
  MainCubit() : super(MainInitialStates());

  static MainCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  int currentIndex2 = 0;

  List<BottomNavigationBarItem> items = [
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.hail,
      ),
      label: 'طلبات عاجلة',
    ),
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.health_and_safety,
      ),
      label: 'طلبات',
    ),
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.perm_identity,
      ),
      label: 'الصفحه الشخصيه',
    ),
  ];

  void logOutDonor() {
    FirebaseAuth.instance.signOut();
    CacheHelper.removeData(key: 'uId');
    emit(LogOutDonorSuccessStates());
  }

  void logOutDonorToHim() {
    FirebaseAuth.instance.signOut();
    CacheHelper.removeData(key: 'uId2');
    emit(LogOutDonorToHimSuccessStates());
  }

  List<Widget> titles = [
    const Center(
        child: Text(
      'طلبات عاجلة',
      style: TextStyle(color: Colors.white),
    )),
    const Center(
        child: Text(
      'طلبات',
      style: TextStyle(color: Colors.white),
    )),
    const Center(
        child: Text(
      'الصفحه الشخصيه',
      style: TextStyle(color: Colors.white),
    )),
  ];
  List<Widget> donorScreens = [
    const HotOrderDonorPage(),
    const OrderDonorPage(),
    SettingPage()
  ];
  List<Widget> donorToHimScreens = [
    const HotOrderDonorToHimPage(),
    const OrderDonorToHimPage(),
    SettingPage2()
    //  SettingPage()
  ];

  void changeIndex(int index) {
    currentIndex = index;
    emit(AppChangeBottomNavBarState());
    if (currentIndex == 0) {
      gethotorders();
    }
    if (currentIndex == 1) {
      getOrders();
    }
    if (currentIndex == 2) {
      getDonor();
    }
  }

  void changeIndex2(int index) {
    currentIndex2 = index;
    emit(AppChangeBottomNavBarState());

    if (currentIndex == 2) {
      getToHimDonor();
    }
  }

  List<DonorToHimModel> donorToHimModel = [];
  List<OrderModel> hotOrderModel = [];
  List<OrderModel> orderModel = [];
  List<OrderModel> myOrderModel = [];
  List<OrderModel> myHotOrderModel = [];

  void getMyorders() {
    myHotOrderModel.clear();
    myOrderModel.clear();
    FirebaseFirestore.instance
        .collection("users2")
        .doc(CacheHelper.getData(key: 'uId2'))
        .collection('hotorders')
        .get()
        .then((value) {
      for (var element in value.docs) {
        myHotOrderModel.add(OrderModel.fromjson(element.data()));
      }
    });
    FirebaseFirestore.instance
        .collection("users2")
        .doc(CacheHelper.getData(key: 'uId2'))
        .collection('orders')
        .get()
        .then((value) {
      for (var element in value.docs) {
        myOrderModel.add(OrderModel.fromjson(element.data()));
      }
      emit(GetMyOrdersSuccessState());
    }).catchError((error) {
      emit(GetMyOrdersErrorStates(error.toString()));
    });
  }

  void getOrders() {
    orderModel.clear();
    emit(GetOrdersLoadingState());
    FirebaseFirestore.instance
        .collection('city')
        .doc(donorModel!.city)
        .collection(donorModel!.city!)
        .doc(donorModel!.blood)
        .collection('متبرع له')
        .get()
        .then((value) {
      for (var element in value.docs) {
        orderModel.add(OrderModel.fromjson(element.data()));
      }
      emit(GetOrdersSuccessState());
    });
  }

  void gethotorders() {
    emit(GetHotOrdersLoadingState());
    hotOrderModel.clear();
    FirebaseFirestore.instance.collection('hots').get().then((value) {
      for (var element in value.docs) {
        hotOrderModel.add(OrderModel.fromjson(element.data()));
      }
      emit(GetHotOrdersSuccessState());
    });
  }

  DonorToHimModel? donorToHimUser;

  void getToHimDonor() {
    FirebaseFirestore.instance
        .collection("users2")
        .doc(CacheHelper.getData(key: 'uId2'))
        .get()
        .then((value) {
      donorToHimUser = DonorToHimModel.fromjson(value.data()!);
      emit(GetDonorToHimSuccessState());
    }).catchError((error) {
      emit(GetDonorToHimErrorState(error.toString()));
    });
  }

  DonorModel? donorModel;

  void getDonor() {
    emit(GetDonorLoadingState());

    FirebaseFirestore.instance
        .collection("users")
        .doc(CacheHelper.getData(key: 'uId'))
        .get()
        .then((value) {
      donorModel = DonorModel.fromjson(value.data()!);
      emit(GetDonorSuccessState());
    }).catchError((error) {
      emit(GetDonorErrorState(error.toString()));
    });
  }

  void createHotOrder({
    required String blood,
    required String city,
    required String name,
    required String phone,
    required String age,
    required String state,
    required String amount,
    required String place,
  }) {
    OrderModel model = OrderModel(
      blood: blood,
      city: city,
      name: name,
      phone: phone,
      age: age,
      state: state,
      amount: amount,
      place: place,
    );
    FirebaseFirestore.instance
        .collection('hots')
        .doc(CacheHelper.getData(key: 'uId2'))
        .set(model.toMap())
        .then((value) {
      FirebaseFirestore.instance
          .collection('users2')
          .doc(CacheHelper.getData(key: 'uId2'))
          .collection('hotorders')
          .doc(name)
          .set(model.toMap())
          .then((value) {
        getMyorders();
        emit(CreateOrderSuccessState());
      });
    });
  }

  void createOrder({
    required String blood,
    required String city,
    required String name,
    required String phone,
    required String age,
    required String state,
    required String amount,
    required String place,
    required DonorToHimModel user,
  }) {
    OrderModel model = OrderModel(
      blood: blood,
      city: city,
      name: name,
      phone: phone,
      age: age,
      state: state,
      amount: amount,
      place: place,
    );
    FirebaseFirestore.instance
        .collection('city')
        .doc(user.city)
        .collection(user.city!)
        .doc(user.blood)
        .collection('متبرع له')
        .doc(name)
        .set(model.toMap());
    FirebaseFirestore.instance
        .collection('users2')
        .doc(CacheHelper.getData(key: 'uId2'))
        .collection('orders')
        .doc(name)
        .set(model.toMap())
        .then((value) {
      getMyorders();
      emit(CreateOrderSuccessState());
    });
  }

  void deleteOrder({
    required String city,
    required String blood,
    required String name,
    required String state,
  }) {
    emit(DeleteProductLoadingStates());

    if (state == 'تبرع') {
      FirebaseFirestore.instance
          .collection('users2')
          .doc(CacheHelper.getData(key: 'uId2'))
          .collection('orders')
          .doc(name)
          .delete();
      FirebaseFirestore.instance
          .collection("city")
          .doc(city)
          .collection(city)
          .doc(blood)
          .collection("متبرع له")
          .doc(name)
          .delete()
          .then((value) {
        myOrderModel.clear();
        getMyorders();
        emit(DeleteProductsSuccessStates());
      });
    } else {
      FirebaseFirestore.instance
          .collection('users2')
          .doc(CacheHelper.getData(key: 'uId2'))
          .collection('hotorders')
          .doc(name)
          .delete();
      FirebaseFirestore.instance
          .collection("hots")
          .doc(CacheHelper.getData(key: 'uId2'))
          .delete()
          .then((value) {
        myOrderModel.clear();
        getMyorders();
        emit(DeleteProductsSuccessStates());
      });
    }
  }

  void em() {
    emit(ChangeItem());
  }

  void updateDonor({
    required String phone,
    required String name,
    required String age,
    required String city,
    required String blood,
    required String disease,
  }) {
    DonorModel donermodel = DonorModel(
        name: name,
        blood: blood,
        city: city,
        phone: phone,
        age: age,
        disease: disease,
        uId: CacheHelper.getData(key: 'uId'));
    FirebaseFirestore.instance
        .collection('users')
        .doc(CacheHelper.getData(key: 'uId'))
        .update(donermodel.toMap())
        .then((value) {
      getDonor();
    });
  }

  void updateDonorToHim({
    required String phone,
    required String name,
    required String age,
    required String city,
    required String blood,
  }) {
    DonorToHimModel donermodel = DonorToHimModel(
        name: name,
        blood: blood,
        city: city,
        phone: phone,
        age: age,
        uId: CacheHelper.getData(key: 'uId2'));
    FirebaseFirestore.instance
        .collection('users2')
        .doc(CacheHelper.getData(key: 'uId2'))
        .update(donermodel.toMap())
        .then((value) {
      getToHimDonor();
    });
  }
}
