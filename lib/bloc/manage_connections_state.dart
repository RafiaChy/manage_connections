part of 'manage_connections_bloc.dart';

class ManageConnectionsState extends Equatable {
  const ManageConnectionsState(
   {this.activeTile = 'all_enabled'} 
  );
  final String activeTile;
  
  @override
  List<Object> get props => [activeTile];

  ManageConnectionsState copyWith({
    String? activeTile,
  }) {
    return ManageConnectionsState(
      activeTile: activeTile ?? this.activeTile,
    );
  }
}

class ManageConnectionsInitial extends ManageConnectionsState {}

class SelectedAppState extends ManageConnectionsState{
  
}
class LoadingAndSyncingState extends ManageConnectionsState{}
class SyncedState extends ManageConnectionsState{}
