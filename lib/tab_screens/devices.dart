import 'package:flutter/material.dart';
import 'package:layout_screen_manage/widgets/added_devices.dart';
import 'package:layout_screen_manage/widgets/available_devices.dart';

class Devices extends StatefulWidget {
  const Devices({ Key? key }) : super(key: key);

  @override
  State<Devices> createState() => _DevicesState();
}

class _DevicesState extends State<Devices> {
       List dummyDevices = const[
    'Xiomi Mi Band 4',
    'Xiomi Mi Band 4',
    'Xiomi Mi Band 4',
    'KrishnaFitband',
    'Xiomi Mi Band 3',
    'Xiomi Mi Band 3',
  ];
  List addedDummies = [];
  void getDevice(String device){
    return addedDummies.add(device) ;
     
  }
  @override
  Widget build(BuildContext context) {
    print('$addedDummies');
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(2),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(left: 20, right: 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:[
                  
                   const Text('Configure devices', style: TextStyle(fontSize: 23),),
                   TextButton(
                     onPressed: (){},
                     child: Column(
                       
                       children: [
                         Container(
                           height: 6,
                           width: 6,
                           decoration: BoxDecoration(
                             color: Colors.black,
                             borderRadius: BorderRadius.circular(8)
                           ),
                         ),
                        const SizedBox(height: 2,),
                            Container(
                           height: 6,
                           width: 6,
                           decoration: BoxDecoration(
                             color: Colors.black,
                             borderRadius: BorderRadius.circular(8)
                           ),
                         ),
                       ],
                               
                     ),
                   ),
                 
                ],
              ),
            ),
              Container(
            margin: const EdgeInsets.only(left: 15, right: 5),
            child: const Text('Added Devices'),      
          ),
          AddedDevices(addedDevices: addedDummies),
          const  SizedBox(height: 20),
                Container(
            margin: const EdgeInsets.only(left: 15, right: 5),
            child: Row(
              children: [
                const Expanded(
                  flex: 2,
                  child: Text('Available Devices')),
                const Text('Refresh'),
                IconButton(onPressed: (){}, icon: Icon(Icons.refresh)),
              ],
            ),
          ),
            AvailableDevices(availableDevices: dummyDevices, onTap: getDevice),
          ],
        ),
      ),
    );
  }
}