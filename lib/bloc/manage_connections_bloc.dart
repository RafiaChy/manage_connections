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
    on<LoadingEvent>(_loadingEvent);
    on<SyncingEvent>(_syncingEvent);
  }

  void _loadingEvent(LoadingEvent event, Emitter<ManageConnectionsState> emit){

     emit(state.copyWith(
       status: ActiveScreenStatus.loading));

      
  
  }
  void _syncingEvent(SyncingEvent event, Emitter<ManageConnectionsState> emit){
    emit(state.copyWith(
         status: ActiveScreenStatus.syncing));
   
  
  
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
    
      for (var tile in listOfTiles) {
        if (tile!.title != selectedTile.title) {
          tile.isSelected = false;
        } else {
          tile.isSelected = true;
        }
      }
      emit(state.copyWith(
          listOfTiles: listOfTiles, status: ActiveScreenStatus.selectedApp, selectedTile: TileModel(title: selectedTile.title, imagePath: selectedTile.imagePath, isSelected: selectedTile.isSelected, isSynced: selectedTile.isSynced)));
    }
  }

  void _connectApp(
      ConnectAppEvent event, Emitter<ManageConnectionsState> emit) {
    
     
     final listOfTiles = state.listOfTiles;
      final syncedTile = event.syncedTile;
      if (listOfTiles.isNotEmpty) {
      
       
        for (var tile in listOfTiles) {
          if (tile!.title == syncedTile.title) {
            tile.isSynced = true;
          }
        }
        
        emit(state.copyWith(
            listOfTiles: listOfTiles, status: ActiveScreenStatus.synced, selectedTile: state.selectedTile));
      }
  
      
    
  }
}