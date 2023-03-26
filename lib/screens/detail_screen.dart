import 'package:flutter/material.dart';
import 'package:praktpm_tugas2/data/tourism_data.dart';

class DetailScreen extends StatelessWidget {
  final TourismPlace tourismPlace;

  const DetailScreen({Key? key, required this.tourismPlace}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 24, horizontal: 6),
              child: Column(
                children: [
                  Row(
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Icon(Icons.arrow_back, color: Colors.black,)
                      ),
                      Text(
                        "Tour Place Detail",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 30
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                  SizedBox(height: 16,),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 18),
                    child: Column(
                      children: [
                        Image.network(tourismPlace.imageUrls[0]),
                        SizedBox(height: 16,),
                        Row(
                          children: [
                            Text(
                              tourismPlace.name,
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 30
                              ),
                              textAlign: TextAlign.start,
                            ),
                          ],
                        ),
                        SizedBox(height: 8,),
                        Row(
                          children: [
                            Icon(Icons.location_pin, size: 16,),
                            SizedBox(width: 6,),
                            Text(tourismPlace.location)
                          ],
                        ),
                        SizedBox(height: 6,),
                        Row(
                          children: [
                            Icon(Icons.access_time, size: 16,),
                            SizedBox(width: 6,),
                            Flexible(child: Text(tourismPlace.openDays + " - " + tourismPlace.openTime))
                          ],
                        ),
                        SizedBox(height: 6,),
                        Row(
                          children: [
                            Icon(Icons.attach_money, size: 16,),
                            SizedBox(width: 6,),
                            Flexible(child: Text(tourismPlace.ticketPrice))
                          ],
                        ),
                        SizedBox(height: 12,),
                        Row(
                          children: [
                            Flexible(
                              child: Text(tourismPlace.description, textAlign: TextAlign.justify,),
                            )
                          ],
                        ),
                      ],
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
