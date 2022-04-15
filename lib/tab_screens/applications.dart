import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:layout_screen_manage/bloc/manage_connections_bloc.dart';
import 'package:layout_screen_manage/models/tile_model.dart';
import 'package:layout_screen_manage/widgets/tile.dart';

class Applications extends StatefulWidget {
  const Applications({ Key? key }) : super(key: key);

  @override
  State<Applications> createState() => _ApplicationsState();
}


class _ApplicationsState extends State<Applications> {
  String activeTile = 'enabled';
  String changingTheActiveTile(String tileName){
    return tileName;
  }
  List<TileModel> tiles = [
    TileModel(title: 'Google Fit', imagePath: 'assets/Google_Fit_1.png', isSelected: true, isSynced: false),
    TileModel(title: 'Samsung H', imagePath: 'assets/samsung_health.png', isSelected: true, isSynced: false),
    TileModel(title: 'Mi Fit', imagePath: 'assets/Mi_Fit_1.png', isSelected: true, isSynced: false),
    TileModel(title: 'Garmin C', imagePath: 'assets/Garmin_Connect_1.png', isSelected: true, isSynced: false),
  ];
  @override
  void initState() {
  
    super.initState();
  }

  var disconnected = true;
  var message = 'Please wait while we connect...';
   var message1 = 'Please wait while we synchronize...';

  @override
  Widget build(BuildContext context) {

    return   BlocProvider(
      create: (context) => ManageConnectionsBloc()..add(CreateListOfTilesEvent(listOfTiles: tiles)),
      child: BlocListener<ManageConnectionsBloc, ManageConnectionsState>(
        listener: (context, state) {
          if(state.status == ActiveScreenStatus.syncing){
               Future.delayed(const Duration(seconds: 5), () {
 context.read<ManageConnectionsBloc>().add(ConnectAppEvent(syncedTile: state.selectedTile!));
});  }
          if(state.status == ActiveScreenStatus.loading){
           

    Future.delayed(const Duration(seconds: 5), () {
  context.read<ManageConnectionsBloc>().add(SyncingEvent());
});
  }
 },
        child: BlocBuilder<ManageConnectionsBloc, ManageConnectionsState>(
              
              builder: (context, state) {
                print('from builder ${state.status}');
                
               if(state.status == ActiveScreenStatus.loading){
                
                   return Column(
                     mainAxisAlignment: MainAxisAlignment.end,
                     children: [
                       buildImageHolder(state.selectedTile!.imagePath),
                       const SizedBox(height: 9),
                       Text(message),
                       const SizedBox(height: 100,)
                     ],
                   );
                 
                
               }
               if(state.status == ActiveScreenStatus.syncing){

                   return Column(
                     mainAxisAlignment: MainAxisAlignment.end,
                     children: [
                       buildImageHolder(state.selectedTile!.imagePath),
                       const SizedBox(height: 9),
                       Text(message1),
                       const SizedBox(height: 100,)
                     ],
                   );
                
                
               }
               
                
              if(state.status == ActiveScreenStatus.creating) {
                return const CircularProgressIndicator();
              }
              if(state.status == ActiveScreenStatus.initial || state.status == ActiveScreenStatus.selectedApp) {
                 return Container(
                      padding: const EdgeInsets.all(4),
                      child: Column(
                        children: [
                         Container(
                           margin: const EdgeInsets.only(left: 20, right: 20, top: 42),
                           child: Row(
                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             children: const [
                               Text('Choose one of the apps', style: TextStyle(fontSize: 23),),
                               Text('info'),
                             ],
                           ),
                         ),
                         
                      Container(
                     margin: const EdgeInsets.only(top: 47, left: 15, right: 15),
                      child:Column(
                          
                          children: [
                            Row(
                              children:  [
                            
                Tile(image: state.listOfTiles[0]!.imagePath, title: state.listOfTiles[0]!.title, enable: state.listOfTiles[0]!.isSelected, onTap: (){
                  context.read<ManageConnectionsBloc>().add(SelectedAppEvent(selectedTile: state.listOfTiles[0]!));
                }),
                const SizedBox(width: 30),
                Tile(image: state.listOfTiles[1]!.imagePath, title: state.listOfTiles[1]!.title, enable: state.listOfTiles[1]!.isSelected, onTap: (){
                  context.read<ManageConnectionsBloc>().add(SelectedAppEvent(selectedTile: state.listOfTiles[1]!));
                }),
             ],
           ),

       const SizedBox(height: 30),
             Row( children: [
                        Tile(image: state.listOfTiles[2]!.imagePath, title: state.listOfTiles[2]!.title, enable: state.listOfTiles[2]!.isSelected, onTap: (){
                   context.read<ManageConnectionsBloc>().add(SelectedAppEvent(selectedTile: state.listOfTiles[2]!));
                 }),
                 const SizedBox(width: 30),
                 Tile(image: state.listOfTiles[3]!.imagePath, title: state.listOfTiles[3]!.title, enable: state.listOfTiles[3]!.isSelected, onTap: (){
                   context.read<ManageConnectionsBloc>().add(SelectedAppEvent(selectedTile: state.listOfTiles[3]!));
                 }), 
                      ],
                    )
                ],      ),
                  
                    ),
               const SizedBox(height: 60,),
                    
                 ElevatedButton(onPressed: (){ 
                   
                context.read<ManageConnectionsBloc>().add(LoadingEvent());
                 }, style: 
                    ButtonStyle(
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      
                    )),
                    backgroundColor:  MaterialStateProperty.resolveWith<Color>(
                             (Set<MaterialState> states) {
                               if (state.selectedTile == null) {
                                 return Colors.blueGrey.shade100;
                               } 
                                return Colors.blue;
                             },
                           ),
                     
                    ),
                     child: Container(
                      width: 182,
                      height: 47,
                      alignment: Alignment.center,
                      child: const Text('Connect', style: TextStyle(color:  Colors.white, fontSize: 18 ),),
                    ))
                       ],
                      ),
                    );
              }

               return    Container(
                      padding: const EdgeInsets.all(4),
                      child: Column(
                        children: [
                         Container(
                           margin: const EdgeInsets.only(left: 20, right: 20, top: 42),
                           child: Row(
                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             children: const [
                               Text('Choose one of the apps', style: TextStyle(fontSize: 23),),
                               Text('info'),
                             ],
                           ),
                         ),
                         
                      Container(
                     margin: const EdgeInsets.only(top: 47, left: 15, right: 15),
                      child:Column(
                          
                          children: [
                            Row(
                              children:  [
                            
                Tile(image: state.listOfTiles[0]!.imagePath, title: state.listOfTiles[0]!.isSelected ? 'Synced' : state.listOfTiles[0]!.title, enable: state.listOfTiles[0]!.isSelected, onTap: (){
                  context.read<ManageConnectionsBloc>().add(SelectedAppEvent(selectedTile: state.listOfTiles[0]!));
                }),
                const SizedBox(width: 30),
                Tile(image: state.listOfTiles[1]!.imagePath, title: state.listOfTiles[1]!.isSelected ? 'Synced' : state.listOfTiles[1]!.title, enable: state.listOfTiles[1]!.isSelected, onTap: (){
                  context.read<ManageConnectionsBloc>().add(SelectedAppEvent(selectedTile: state.listOfTiles[1]!));
                }),
             ],
           ),

       const SizedBox(height: 30),
             Row( children: [
                        Tile(image: state.listOfTiles[2]!.imagePath, title: state.listOfTiles[2]!.isSelected ? 'Synced' : state.listOfTiles[2]!.title, enable: state.listOfTiles[2]!.isSelected, onTap: (){
                   context.read<ManageConnectionsBloc>().add(SelectedAppEvent(selectedTile: state.listOfTiles[2]!));
                 }),
                 const SizedBox(width: 30),
                 Tile(image: state.listOfTiles[3]!.imagePath, title: state.listOfTiles[3]!.isSelected ? 'Synced' : state.listOfTiles[3]!.title, enable: state.listOfTiles[3]!.isSelected, onTap: (){
                   context.read<ManageConnectionsBloc>().add(SelectedAppEvent(selectedTile: state.listOfTiles[3]!));
                 }), 
                      ],
                    )
                ],      ),
                  
                    ),
               const SizedBox(height: 60,),
                    
                 ElevatedButton(onPressed: (){ 
                   
                context.read<ManageConnectionsBloc>().add(LoadingEvent());
                 }, style: 
                    ButtonStyle(
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      
                    )),
                    backgroundColor:  MaterialStateProperty.resolveWith<Color>(
                             (Set<MaterialState> states) {
                               if (state.selectedTile == null || state.status == ActiveScreenStatus.synced) {
                                 return Colors.blueGrey.shade100;
                               } 
                                return Colors.blue;
                             },
                           ),
                     
                    ),
                     child: Container(
                      width: 182,
                      height: 47,
                      alignment: Alignment.center,
                      child: const Text('Connect', style: TextStyle(color: Colors.white, fontSize: 18 ),),
                    ))
                       ],
                      ),
                    );
              },
            ),
      ),
    );
  }

 
  Container buildImageHolder(String image) {
    if(image == 'assets/Google_Fit_1.png' || image == 'assets/samsung_health.png' 
    || image == 'assets/Mi_Fit_1.png' || image ==  'assets/Garmin_Connect_1.png'){
    
      return Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(13.49)
        ),
        child: Image.asset(image),
      );
    }
    else{
      return Container();
    }
     
    }
  }




