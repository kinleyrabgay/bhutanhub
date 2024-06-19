import 'dart:async';
import 'package:bhutanhub/core/constants/enums.dart';
import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

part 'internet_state.dart';

class InternetCubit extends Cubit<InternetState> {
  final Connectivity connectivity;
  late StreamSubscription connectivityStreamSubscription;

  InternetCubit({required this.connectivity}) : super(InternetLoading()) {
    connectivityStreamSubscription =
        connectivity.onConnectivityChanged.listen((connectivityResults) {
      if (connectivityResults.contains(ConnectivityResult.wifi)) {
        emitInternetConnected(ConnectionType.wifi);
      } else if (connectivityResults.contains(ConnectivityResult.mobile)) {
        emitInternetConnected(ConnectionType.mobile);
      } else if (connectivityResults.contains(ConnectivityResult.none)) {
        emitInternetDisconnected();
      } else {
        emitInternetDisconnected();
      }
    });
  }

  void emitInternetConnected(ConnectionType connectionType) =>
      emit(InternetConnected(connectionType: connectionType));

  void emitInternetDisconnected() => emit(InternetDisconnected());

  @override
  Future<void> close() {
    connectivityStreamSubscription.cancel();
    return super.close();
  }
}
