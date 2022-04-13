import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'manage_connections_event.dart';
part 'manage_connections_state.dart';

class ManageConnectionsBloc extends Bloc<ManageConnectionsEvent, ManageConnectionsState> {
  ManageConnectionsBloc() : super(ManageConnectionsInitial()) {
    on<SelectedAppEvent>( _selectedApp);
    on<ConnectAppEvent>( _connectApp);
    
  }


  void _selectedApp(SelectedAppEvent event, Emitter<ManageConnectionsState> emit){
    
  }
  void _connectApp(ConnectAppEvent event, Emitter<ManageConnectionsState> emit){}
}
