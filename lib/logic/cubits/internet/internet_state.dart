part of 'internet_cubit.dart';

abstract class InternetState {
  const InternetState();
}

class InternetLoading extends InternetState {
  const InternetLoading();
}

class InternetConnected extends InternetState {
  final ConnectionType connectionType;

  const InternetConnected(this.connectionType);
}

class InternetDisconnected extends InternetState {}
