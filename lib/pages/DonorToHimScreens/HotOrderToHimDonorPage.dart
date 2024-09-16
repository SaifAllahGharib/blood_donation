import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/BlocStates.dart';
import '../../bloc/MainBloc.dart';

class HotOrderDonorToHimPage extends StatelessWidget {
  const HotOrderDonorToHimPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainCubit, MainStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Text("data3");
          // return ConditionalBuilder(
          //   condition: state is! DeleteProductLoadingStates,
          //   builder: (context) => ListView.builder(
          //     itemBuilder: (context, index) {
          //       return model2(
          //         order: MainCubit.get(context).myHotOrderModel[index],
          //         context: context,
          //       );
          //     },
          //     itemCount: MainCubit.get(context).myHotOrderModel.length,
          //   ),
          //   fallback: (context) {
          //     return const Center(child: CircularProgressIndicator());
          //   },
          // );
        });
  }
}
