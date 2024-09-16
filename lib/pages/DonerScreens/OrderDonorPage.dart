import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/BlocStates.dart';
import '../../bloc/MainBloc.dart';

class OrderDonorPage extends StatelessWidget {
  const OrderDonorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainCubit, MainStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Text("data2");
          // return ConditionalBuilder(
          //   builder: (context) => ListView.builder(
          //     itemBuilder: (context, index) {
          //       return model(
          //         order: MainCubit.get(context).orderModel[index],
          //       );
          //     },
          //     itemCount: MainCubit.get(context).orderModel.length,
          //   ),
          //   condition: state is! GetOrdersLoadingState,
          //   fallback: (BuildContext context) {
          //     return const Center(
          //       child: CircularProgressIndicator(),
          //     );
          //   },
          // );
        });
  }
}
