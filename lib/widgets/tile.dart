import 'package:flutter/material.dart';

import 'package:layout_screen_manage/tab_screens/applications.dart';

class Tile extends StatelessWidget {
  Tile({
    Key? key,
    required this.image,
    required this.title,
    required this.enable,
    required this.onTap,
  }) : super(key: key);
  final String image;
  final String title;
  final bool enable;
  final Function onTap;
  @override
  Widget build(BuildContext context) {
  
    return GestureDetector(
      onTap: (){
        onTap();
      },
      child:  enable? tileToBeChosen(Colors.black) :tileToBeChosen(Colors.black45),
    );
  }
  Container tileToBeChosen(Color color) {
    return Container(
           height: 170,
           width: 170,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(13.3,),
              border: Border.all(
                          color:enable? Colors.blue : Colors.black12,
                          width: 1,
              )),
            padding: const EdgeInsets.fromLTRB(35, 27, 35, 27),
            child: Column(
                children: [
                  Image.asset('assets/$image', color: enable? null: const Color.fromRGBO(255, 255, 255, 0.5),
                  colorBlendMode: BlendMode.modulate),
                  const SizedBox(height: 12,),
                  Center(
                      child: Row( 
                        children: [
                          Text( title , style: TextStyle(color: color),),
                          title == 'Synced'? SizedBox(
                            height: 15,
                            width: 14,
                            child:  Image.asset('assets/carbon_settings.png')): Container()
                        ],
                      ),
                    ),
                  
                ],
              ),
              
          );
  }
}
