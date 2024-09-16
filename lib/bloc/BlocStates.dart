abstract class MainStates {}

class MainInitialStates extends MainStates {}

class AppChangeBottomNavBarState extends MainStates {}

class UserLoginLoadingStates extends MainStates {}

class LogOutDonorSuccessStates extends MainStates {}

class LogOutDonorToHimSuccessStates extends MainStates {}

class ChangeItem extends MainStates {}

class GetDonorLoadingState extends MainStates {}

class GetDonorSuccessState extends MainStates {}

class GetDonorSuccessINSettingScreen extends MainStates {}

class GetDonorErrorState extends MainStates {
  final String error;

  GetDonorErrorState(this.error);
}

class GetDonorToHimSuccessState extends MainStates {}

class GetDonorToHimErrorState extends MainStates {
  final String error;

  GetDonorToHimErrorState(this.error);
}

class LogOutLoadingState extends MainStates {}

class LogOutSuccessState extends MainStates {}

class LogOutErrorState extends MainStates {
  final String error;

  LogOutErrorState(this.error);
}

class DeleteProductLoadingStates extends MainStates {}

class DeleteProductsSuccessStates extends MainStates {}

class CreateOrderSuccessState extends MainStates {}

class GetHotOrdersLoadingState extends MainStates {}

class GetHotOrdersSuccessState extends MainStates {}

class GetOrdersSuccessState extends MainStates {}

class GetMyOrdersSuccessState extends MainStates {}

class GetMyOrdersErrorStates extends MainStates {
  final String error;

  GetMyOrdersErrorStates(this.error);
}

class GetOrdersLoadingState extends MainStates {}
