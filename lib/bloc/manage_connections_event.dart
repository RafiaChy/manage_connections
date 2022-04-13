part of 'manage_connections_bloc.dart';

abstract class ManageConnectionsEvent extends Equatable {
  const ManageConnectionsEvent();

  @override
  List<Object> get props => [];
}
class SelectedAppEvent extends ManageConnectionsEvent{}
class ConnectAppEvent extends ManageConnectionsEvent{}