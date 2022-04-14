import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:layout_screen_manage/models/tile_model.dart';

part 'manage_connections_event.dart';
part 'manage_connections_state.dart';

class ManageConnectionsBloc
    extends Bloc<ManageConnectionsEvent, ManageConnectionsState> {
  ManageConnectionsBloc() : super(const ManageConnectionsState()) {
    on<CreateListOfTilesEvent>(_createListOfTiles);
    on<SelectedAppEvent>(_selectedApp);
    on<ConnectAppEvent>(_connectApp);
  }

  void _createListOfTiles(
      CreateListOfTilesEvent event, Emitter<ManageConnectionsState> emit) {
    emit(state.copyWith(status: ActiveScreenStatus.creating));
    emit(state.copyWith(
        listOfTiles: event.listOfTiles, status: ActiveScreenStatus.initial));
  }

  void _selectedApp(
      SelectedAppEvent event, Emitter<ManageConnectionsState> emit) {
    final listOfTiles = state.listOfTiles;
    final selectedTile = event.selectedTile;
    if (listOfTiles.isNotEmpty) {
      // change the status of all the tiles to unselected to false except the selected tile
      for (var tile in listOfTiles) {
        if (tile!.title != selectedTile.title) {
          tile.isSelected = false;
        } else {
          tile.isSelected = true;
        }
      }
      emit(state.copyWith(
          listOfTiles: listOfTiles, status: ActiveScreenStatus.selectedApp));
    }
  }

  void _connectApp(
      ConnectAppEvent event, Emitter<ManageConnectionsState> emit) {
    emit(state.copyWith(status: ActiveScreenStatus.loading));
    Future.delayed(const Duration(seconds: 2), () {});
    Future.delayed(const Duration(seconds: 2), () {
      emit(state.copyWith(
        listOfTiles: state.listOfTiles,
        status: ActiveScreenStatus.syncing,
      ));
      final listOfTiles = state.listOfTiles;
      final syncedTile = event.syncedTile;
      if (listOfTiles.isNotEmpty) {
        // change the status of that  tiles to be synced
        for (var tile in listOfTiles) {
          if (tile!.title == syncedTile.title) {
            tile.isSynced = true;
          }
        }
        emit(state.copyWith(
            listOfTiles: listOfTiles, status: ActiveScreenStatus.synced));
      }
    });
  }
}