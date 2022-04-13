import 'package:flutter/material.dart';
import 'package:layout_screen_manage/tab_screens/devices.dart';
import 'package:layout_screen_manage/tab_screens/applications.dart';

class OptionalApssDisplayed extends StatefulWidget {
  const OptionalApssDisplayed({ Key? key }) : super(key: key);

  @override
  _OptionalApssDisplayedState createState() => _OptionalApssDisplayedState();
}

class _OptionalApssDisplayedState extends State<OptionalApssDisplayed> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 2, vsync: this);
    return Scaffold(
       appBar:
        AppBar(
                elevation: 0,
                 leading: const Padding(
                   padding:  EdgeInsets.all(8.0),
                   child: IconButton(icon: Icon(Icons.arrow_back_ios, color: Colors.white,), onPressed: null,),
                 ),
                leadingWidth: 20,
                title: 
                  const 
                    Text('back', style: TextStyle(color: Colors.white),), 
              ),
              body: Column(
                children: [
                  Container(
                  padding: const EdgeInsets.all(8.0),
                  color: Colors.blue,
                    child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 20),
                          child: const Text('Manage Connections', style: TextStyle(color: Colors.white, fontSize: 24, fontFamily: 'DM Sans'),)),
                        Container(margin: const EdgeInsets.only(right: 32),child: IconButton(onPressed: null, icon: Image.asset('assets/vector.png'),)),
                      ],
                    ),
                  ),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            
            Container(
              color: Colors.blue,
              child: TabBar(
     
                tabs: const [
                  Tab(
                    text: 'Applications',
                  ),
                  Tab(
                    text: 'Devices',
                  )
                ],
                controller: tabController,
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorColor: Colors.white,
              ),
            ),
            Expanded(
              child: TabBarView(
                children: const [
                  Applications(),
                  Devices()
                ],
                controller: tabController,
              ),
            ),
          ],
        ),
      ),
      ],
    ), 
              
     
    );
  }
}