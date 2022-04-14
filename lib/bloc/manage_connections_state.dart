part of 'manage_connections_bloc.dart';

class ManageConnectionsState extends Equatable {
  const ManageConnectionsState({
    this.listOfTiles = const [],
    this.status= ActiveScreenStatus.initial,}
  );
  final List<TileModel?> listOfTiles;
  final ActiveScreenStatus status;
  
  @override
  List<Object> get props => [listOfTiles, status];

  ManageConnectionsState copyWith({
    List<TileModel?>? listOfTiles,
    ActiveScreenStatus? status,
  }) {
    return ManageConnectionsState(
      listOfTiles: listOfTiles ?? this.listOfTiles,
      status: status ?? this.status,
    );
  }
}

enum ActiveScreenStatus {creating, initial, selectedApp, loading, syncing, synced }