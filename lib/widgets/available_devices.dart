import 'package:flutter/material.dart';

import 'package:layout_screen_manage/widgets/devices_available.dart';

class AvailableDevices extends StatelessWidget {
  const AvailableDevices({
    Key? key,
    required this.availableDevices,
    required this.onTap,
  }) : super(key: key);
  final List availableDevices;
  final Function(String name) onTap;
 

  @override
  Widget build(BuildContext context) {

    return Container(
     
      padding: const EdgeInsets.all(2),
      child: ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index){
              return  DevicesAvailable(brandName: availableDevices[index], onTap:  onTap(availableDevices[index]) );
              
            }, itemCount: availableDevices.length,),
         
       
      
    );
  }
}
