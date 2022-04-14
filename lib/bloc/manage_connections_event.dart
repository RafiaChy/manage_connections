part of 'manage_connections_bloc.dart';

abstract class ManageConnectionsEvent extends Equatable {
  const ManageConnectionsEvent();

  @override
  List<Object> get props => [];
}
class CreateListOfTilesEvent extends ManageConnectionsEvent {
  final List<TileModel> listOfTiles;
  const CreateListOfTilesEvent({required this.listOfTiles});
  @override
  List<Object> get props => [listOfTiles];
}
class SelectedAppEvent extends ManageConnectionsEvent{
  final TileModel selectedTile;
  const SelectedAppEvent({required this.selectedTile});
  @override
  List<Object> get props => [selectedTile];
}
class ConnectAppEvent extends ManageConnectionsEvent{
  final TileModel syncedTile;
  const ConnectAppEvent({required this.syncedTile});
  @override
  List<Object> get props => [syncedTile];
}