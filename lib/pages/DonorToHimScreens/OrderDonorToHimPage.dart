import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/BlocStates.dart';
import '../../bloc/MainBloc.dart';

class OrderDonorToHimPage extends StatelessWidget {
  const OrderDonorToHimPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainCubit, MainStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Text("data4");
          // return ConditionalBuilder(
          //   condition: state is! DeleteProductLoadingStates,
          //   builder: (context) => ListView.builder(
          //     itemBuilder: (context, index) {
          //       return model2(
          //         order: MainCubit.get(context).myOrderModel[index],
          //         context: context,
          //       );
          //     },
          //     itemCount: MainCubit.get(context).myOrderModel.length,
          //   ),
          //   fallback: (context) {
          //     return const Center(child: CircularProgressIndicator());
          //   },
          // );
        });
  }
}
