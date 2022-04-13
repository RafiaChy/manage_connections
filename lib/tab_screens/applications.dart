import 'package:flutter/material.dart';
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

  var disconnected = true;
  var message = 'Please wait while we connect...';

  @override
  Widget build(BuildContext context) {

    return  disconnected || activeTile == 'Synced'? Container(
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
              Tile(image: 'Google_Fit_1.png', title: activeTile == 'enabled'? 'Google Fit': activeTile, enable: activeTile == 'enabled' || activeTile == 'Synced'? true: activeTile == 'Google Fit' ? true : false, onTap: () {
                Future.delayed(const Duration(milliseconds: 6000), () {
                  setState(() {
                    activeTile = 'Synced';
                  });
                });
                setState(() {
                 activeTile = changingTheActiveTile('Google Fit');
                  
                }); 
              } ,),
             const SizedBox(width: 30),
             Tile(image: 'samsung_health.png', title: activeTile == 'enabled'? 'Samsung H': activeTile, enable: activeTile == 'enabled' || activeTile == 'Synced'? true: activeTile == 'Samsung H' ? true : false, onTap: () {
                Future.delayed(const Duration(milliseconds: 6000), () {
                  setState(() {
                    activeTile = 'Synced';
                     
                  });
                });
                setState(() {
                  activeTile = changingTheActiveTile('Samsung H');
                  
                }); 
              }  ,),
            ],),
          const SizedBox(height: 30),
        Row( 
        children:  [ 
     Tile(image: 'Mi_Fit_1.png', title: activeTile == 'enabled'? 'Mi Fit': activeTile, enable: activeTile == 'enabled' || activeTile == 'Synced'? true: activeTile == 'Mi Fit' ? true : false, onTap: () {
                Future.delayed(const Duration(milliseconds: 6000), () {
                  setState(() {
                    activeTile = 'Synced';
                     
                  });
                });
                setState(() {
                  activeTile = changingTheActiveTile('Mi Fit');
                   
                }); 
              }  ), 
     const SizedBox(width: 30),

     Tile(image: 'Garmin_Connect_1.png', title: activeTile == 'enabled'? 'Garmin C': activeTile, enable: activeTile == 'enabled' || activeTile == 'Synced'? true: activeTile == 'Garmin C' ? true : false, onTap: () {
             Future.delayed(const Duration(milliseconds: 6000), () {
                  setState(() {
                    activeTile = 'Synced';
                     
                  });
                });
                setState(() {
                  activeTile = changingTheActiveTile('Garmin C');
                 
                }); 
              }, ),
        ],
    )
     ],
  ),
  
    ),
      const SizedBox(height: 60,),
    
     ElevatedButton(onPressed: (){
    
      Future.delayed(const Duration(milliseconds: 3000), () {
                setState(() {
                   message = 'Please wait while we synchronize...';
                   
                });
              });
   
      setState(() {
         disconnected = false;
        
      });
     
   
    }, style: 
    ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18.0),
      
    )),
    backgroundColor:  MaterialStateProperty.resolveWith<Color>(
             (Set<MaterialState> states) {
               if (states.contains(MaterialState.pressed) || activeTile == 'Google Fit' ? true : false || activeTile == 'Mi Fit'? true : false || activeTile == 'Samsung H'? true : false || activeTile == 'Garmin C') {
                 return Colors.blue;
               } 
                return Colors.blueGrey.shade100;
             },
           ),
         ),
     child: Container(
      width: 182,
      height: 47,
      alignment: Alignment.center,
      child: Text('Connect', style: TextStyle(color: activeTile == 'Google Fit'   || activeTile == 'Mi Fit' || activeTile == 'Samsung H' || activeTile == 'Garmin C'? Colors.white: Colors.blueGrey, fontSize: 18 ),),
    ))
       ],
      ),
    ): Container(
       margin: const EdgeInsets.only(bottom: 70),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          if(activeTile == 'Google Fit')
         Column(
           children: [
             buildImageHolder('Google_Fit_1.png'),
             const SizedBox(height: 15),
             Text(message),
           
           ],
         ),
          if(activeTile == 'Mi Fit')
          Column(children: [
               buildImageHolder('Mi_Fit_1.png'),
               const SizedBox(height: 15),
               Text(message),
          ],),
        
          if(activeTile == 'Samsung H')
          Column(
          children: [
          buildImageHolder('samsung_health.png'),
          const SizedBox(height: 15),
          Text(message),
            ]
          ),
   
          if(activeTile == 'Garmin C')
          Column(children: [
          buildImageHolder('Garmin_Connect_1.png'),
          const SizedBox(height: 15),
          Text(message),
          ],),
        ],
      ),
    );
  }

  Container buildImageHolder(image) {
    if(image == 'Google_Fit_1.png' || image == 'samsung_health.png' 
    || image == 'Mi_Fit_1.png' || image ==  'Garmin_Connect_1.png'){
    
      return Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(13.49)
        ),
        child: Image.asset('assets/$image'),
      );
    }
    else{
      return Container();
    }
     
    }
  }




