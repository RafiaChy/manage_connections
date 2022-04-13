import 'package:flutter/material.dart';

class DevicesAdded extends StatelessWidget {
  const DevicesAdded({
    Key? key,
    required this.brandName,
  }) : super(key: key);
  final String brandName;

  @override
  Widget build(BuildContext context) {
     return Container(
      padding: const EdgeInsets.only(left: 10, right: 10),
     height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 24,
            width: 16,
            child: Image.asset('assets/watch.png', color: Colors.blue,),),
            const SizedBox(width: 21,),
           
          Expanded(
            flex: 2,
            child: Text(brandName)),
          
          IconButton(onPressed: null, icon: Icon(Icons.settings, color: Colors.blue,)),
        ],
      ),
    );
  }
}
