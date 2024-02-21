import 'package:flutter/material.dart';

import '../../global/global_vars.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  Card dashboardItem(String title, IconData iconData, int index){
    return Card(
      elevation: 2,
      margin: const EdgeInsets.all(8),
      child: Container(
        decoration: index == 0 || index ==3 || index ==4?
        const BoxDecoration(
          gradient: LinearGradient(
              colors:[Colors.black, Colors.black87],
            begin: FractionalOffset(0.0, 0.0),
            end: FractionalOffset(1.0, 0.0),
            tileMode: TileMode.clamp
          )
        ):
        const BoxDecoration(
            gradient: LinearGradient(
                colors:[Colors.black87, Colors.black],
                begin: FractionalOffset(0.0, 0.0),
                end: FractionalOffset(1.0, 0.0),
                tileMode: TileMode.clamp
            )
        ),
        child: InkWell(
          onTap: (){},
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            verticalDirection: VerticalDirection.down,
            children: [
              const SizedBox(height: 50,),

              Center(
                child: Icon(iconData,
                size: 48,
                color: Colors.white,),
              ),
              const SizedBox(height: 10,),
              Center(
                child: Text(title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16
                ),),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Welcome ${sharedPreferences!.getString("name")}",
        style: const TextStyle(
          fontSize: 18,
          letterSpacing: 2,
          color: Colors.white
        ),),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 1),
        child: GridView.count(
            crossAxisCount: 2,
          children: [
            dashboardItem('New Available Orders', Icons.assessment, 0),
            dashboardItem('Parcel in Progress', Icons.airport_shuttle, 1),
            dashboardItem('Not Yet Delivery', Icons.location_history, 2),
            dashboardItem('History', Icons.done_all, 3),
            dashboardItem('Total Earnings', Icons.monetization_on, 4),
            dashboardItem('Logout', Icons.logout, 5),
          ],
        ),
      ),
    );
  }
}
