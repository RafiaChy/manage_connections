import 'package:flutter/material.dart';

class DevicesAvailable extends StatelessWidget {
  const DevicesAvailable({
    Key? key,
    required this.brandName,
    required this.onTap,
  }) : super(key: key);
  final String brandName;
  final Null Function(String name) onTap;
 

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
            child: Image.asset('assets/watch.png')),
            const SizedBox(width: 21,),
           
          Expanded(
            flex: 2,
            child: Text(brandName)),
          
          IconButton(onPressed:(){onTap(brandName);}, icon: const Icon(Icons.add, color: Colors.black,)),
        ],
      ),
    );
  }
}
