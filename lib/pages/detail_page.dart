import 'package:cached_network_image/cached_network_image.dart';
import 'package:final_project/data/models/place_detail_model.dart';
import 'package:final_project/data/models/places_model.dart';
import 'package:final_project/data/models/direction_model.dart';
import 'package:final_project/utils/.env.dart';
import 'package:final_project/widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../data/api/data_source.dart';
import '../utils/global.dart';
import '../widgets/textField_widget.dart';

class DetailPage extends StatefulWidget {
  final Places places;
  final LatLng origin;
  const DetailPage({Key? key, required this.places, required this.origin}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState(places, origin);
}

class _DetailPageState extends State<DetailPage> {
  final Places places;
  final LatLng origin;

  late Future<PlaceDetail> _futurePlacesModel;
  late Future<Direction> _futurePDirectionModel;

  _DetailPageState(this.places, this.origin);

  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _futurePlacesModel = ApiDataSource.instance.loadDetailPlace(places.place_id);
    
    _pageController = PageController(viewportFraction: 0.8);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
            children: [
              _buildListProductsBody()
            ],
          )
      ),
    );
  }

  Widget _buildListProductsBody() {
    return Container(
      child: FutureBuilder<PlaceDetail>(
        future: _futurePlacesModel,
        builder: (BuildContext context, AsyncSnapshot<PlaceDetail> snapshot) {
          if (snapshot.hasError) {
            return _buildErrorSection();
          }
          if (snapshot.hasData) {
            return _buildSuccessSection(snapshot.data!);
          }
          return _buildLoadingSection();
        },
      ),
    );
  }

  Widget _buildErrorSection() {
    return Center(
      child: const Text("Error"),
    );
  }

  Widget _buildLoadingSection() {
    return Center(
      child: Column(
        children: [
          SizedBox(height: 24,),
          CircularProgressIndicator()
        ],
      ) ,
    );
  }

  Widget _buildSuccessSection(PlaceDetail data) {
    _futurePDirectionModel = ApiDataSource.instance.loadDirection(places.location, origin);
    
    return Column(
      children: [
        Row(
          children: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Icon(Icons.arrow_back, color: Colors.black,)
            ),
            Text(
              "Detail Rumah Sakit",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 30
              ),
              textAlign: TextAlign.start,
            ),
          ],
        ),

        Container(
          color: Colors.black54,
          height: MediaQuery.of(context).size.height * 0.3,
          child: PageView.builder(
              itemCount: data.photoList.length,
              pageSnapping: true,
              controller: _pageController,
              onPageChanged: (page) {
                setState(() {
                  var activePage = page;
                });
              },
              itemBuilder: (context, i) {
                return Container(
                  margin: EdgeInsets.all(10),
                  child: CachedNetworkImage(
                    imageUrl: "https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photo_reference=${data.photoList[i]["photo_reference"]}&key=${googleAPIKey}",
                    placeholder: (context, url) => Image.asset(
                      "assets/images/placeholder.png",
                      width: 120.0,
                      height: 120.0,
                    ),
                    errorWidget: (context, url, error) => Image.asset(
                      "assets/images/placeholder.png",
                    ),
                  ),
                );
              }
          ),
        ),

        Container(
          height: MediaQuery.of(context).size.height * 0.6,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [

                  Text(
                    places.name,
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(height: 16,),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.location_pin),
                      SizedBox(width: 8,),
                      Flexible(child: Text(
                        (places.formatted_address != null) ? places.formatted_address : "-",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),)
                    ],
                  ),
                  SizedBox(height: 8,),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.star_rate, color: Colors.orange,),
                      SizedBox(width: 8,),
                      Flexible(child: Text(
                        places.rating.toString(),
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),)
                    ],
                  ),

                  SizedBox(height: 16,),

                  Text(
                    "Estimasi Waktu dan Jarak dari lokasi sekarang",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(height: 16,),
                  FutureBuilder<Direction> (
                      future: _futurePDirectionModel,
                      builder: (BuildContext context, AsyncSnapshot<Direction> snapshot) {
                        if (snapshot.hasError) {
                          return _buildErrorSection();
                        }
                        if (snapshot.hasData) {
                          return _buildSuccessDirection(snapshot.data!, context);
                        }
                        return _buildLoadingSection();
                      }
                  ),

                  SizedBox(height: 16,),
                  Text(
                    " Review :",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(height: 16,),
                  if(data.review != null) Container(
                    height: MediaQuery.of(context).size.height * 0.25,
                    child: ListView.builder(
                      itemCount: data.review?.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  data.review?[index]["author_name"],
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                                if(data.review?[index]["text"] != "") Text(
                                  data.review?[index]["text"],
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Icon(Icons.star_rate, color: Colors.orange,),
                                    SizedBox(width: 8,),
                                    Flexible(child: Text(
                                      data.review![index]["rating"].toString(),
                                      style: TextStyle(
                                        fontSize: 18,
                                      ),
                                    ),)
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),


      ],
    );
  }
  
  Widget _buildSuccessDirection(Direction data, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Jarak tempuh : " + data.distance,
          style: TextStyle(
            fontSize: 18,
          ),
        ),
        Text(
          "Estimasi waktu : " + data.duration,
          style: TextStyle(
            fontSize: 18,
          ),
        ),
      ],
    );
  }
}
