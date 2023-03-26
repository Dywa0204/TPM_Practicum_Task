import 'package:flutter/material.dart';
import 'package:praktpm_tugas2/data/tourism_data.dart';
import 'package:praktpm_tugas2/screens/detail_screen.dart';
import 'package:praktpm_tugas2/screens/login_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(24),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Tour Place List",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 30
                      ),
                      textAlign: TextAlign.start,
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (builder) => LoginScreen())
                          );
                        },
                        child: Icon(Icons.logout, color: Colors.red,)
                    ),
                  ],
                ),
                SizedBox(height: 16,),
                Expanded(
                  child: ListView.separated(
                    separatorBuilder: (BuildContext context, int index) => SizedBox(height: 8,),
                    itemCount: tourismPlaceList.length,
                    itemBuilder: (context, index) => TourCardList(tourismPlace: tourismPlaceList[index],),
                  ),
                )
              ],
            ),
          ),
        ),
      )
    );
  }
}

class TourCardList extends StatelessWidget {
  final TourismPlace tourismPlace;
  const TourCardList({Key? key, required this.tourismPlace}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return DetailScreen(tourismPlace: tourismPlace);
        }))
      },
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16)
        ),
        elevation: 0,
        child: Padding(
          padding: EdgeInsets.all(8),
          child: ListTile(
            title: Text(tourismPlace.name),
            leading: CircleAvatar(
              backgroundImage: NetworkImage(tourismPlace.imageUrls[0]),
            ),
            subtitle: Column(
              children: [
                Row(
                  children: [
                    Icon(Icons.location_pin, size: 16,),
                    SizedBox(width: 6,),
                    Text(tourismPlace.location)
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.access_time, size: 16,),
                    SizedBox(width: 6,),
                    Flexible(child: Text(tourismPlace.openDays + " - " + tourismPlace.openTime))
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.attach_money, size: 16,),
                    SizedBox(width: 6,),
                    Flexible(child: Text(tourismPlace.ticketPrice))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

