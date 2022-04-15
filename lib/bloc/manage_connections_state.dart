part of 'manage_connections_bloc.dart';

class ManageConnectionsState extends Equatable {
  const ManageConnectionsState({
    this.listOfTiles = const [],
    this.selectedTile,
    this.status= ActiveScreenStatus.creating,}
  );
  final List<TileModel?> listOfTiles;
  final ActiveScreenStatus status;
  final TileModel? selectedTile;
  
  @override
  List<Object> get props => [listOfTiles, status];

  ManageConnectionsState copyWith({
    List<TileModel?>? listOfTiles,
    ActiveScreenStatus? status,
    TileModel? selectedTile,
  }) {
    return ManageConnectionsState(
      listOfTiles: listOfTiles ?? this.listOfTiles,
      status: status ?? this.status,
      selectedTile: selectedTile ?? this.selectedTile,
    );
  }
}

enum ActiveScreenStatus {creating, initial, selectedApp, loading, syncing, synced}