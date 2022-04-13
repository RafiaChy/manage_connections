import 'package:flutter/material.dart';

import 'package:layout_screen_manage/widgets/devices_added.dart';

class AddedDevices extends StatelessWidget {
  const AddedDevices({
    Key? key,
    required this.addedDevices,
  }) : super(key: key);
  final List addedDevices;

  @override
  Widget build(BuildContext context) {
     return Container(
      
      padding: const EdgeInsets.all(2),
      child:  ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index){
              return  DevicesAdded(brandName: addedDevices[index]);
              
            }, itemCount: addedDevices.length,),
         
       
      
    );
  }
}
