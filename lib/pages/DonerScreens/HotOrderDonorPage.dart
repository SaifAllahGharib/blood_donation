import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/BlocStates.dart';
import '../../bloc/MainBloc.dart';

class HotOrderDonorPage extends StatelessWidget {
  const HotOrderDonorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainCubit, MainStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Text("data");
          // return ConditionalBuilder(
          //   condition: state is! GetHotOrdersLoadingState,
          //   builder: (context) {
          //     return ListView.builder(
          //       itemBuilder: (context, index) {
          //         return model(
          //           order: MainCubit.get(context).hotOrderModel[index],
          //         );
          //       },
          //       itemCount: MainCubit.get(context).hotOrderModel.length,
          //     );
          //   },
          //   fallback: (context) {
          //     return const Center(child: CircularProgressIndicator());
          //   },
          // );
        });
  }
}
