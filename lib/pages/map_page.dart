import 'package:final_project/data/models/places_model.dart';
import 'package:final_project/pages/detail_page.dart';
import 'package:final_project/utils/global.dart';
import 'package:final_project/widgets/textField_widget.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../data/api/data_source.dart';
import '../widgets/alertDialog_widget.dart';
import '../widgets/button_widget.dart';

class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  static const _initialCameraPosition = CameraPosition(
    target: LatLng(-7.9333885803632445, 110.58283807659834),
    zoom: 5
  );

  late GoogleMapController _googleMapController;

  LatLng? _currentPosition;
  bool _isLoading = true;
  String _keyword = "";
  bool _isSearch = false;
  late AlertDialogWidget alert;
  late Future<List<Places>> _futurePlacesModel;
  Set<Marker> markers = new Set();
  late Places _placesTemp;
  bool _isPlaceSelected = false;

  @override
  void initState() {
    super.initState();
    
    _placesTemp = Places(name: "", place_id: "", location: LatLng(0, 0), rating: 0, formatted_address: '');

    getCurrentLocation();
  }

  getCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    double lat = position.latitude;
    double long = position.longitude;

    LatLng location = LatLng(lat, long);
    _currentPosition = location;

    setState(() {
      _googleMapController.animateCamera(
          CameraUpdate.newCameraPosition(CameraPosition(
              target: (_currentPosition != null) ? _currentPosition! : location,
              zoom: 15
          ))
      );

      _isLoading = false;
    });
  }

  @override
  void dispose() {
    _googleMapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(child: GoogleMap(
            myLocationButtonEnabled: false,
            padding: EdgeInsets.symmetric(vertical: 86),
            initialCameraPosition: _initialCameraPosition,
            zoomControlsEnabled: false,
            onMapCreated: (controller) => _googleMapController = controller,
            markers: markers,
            onTap: _addMarker,
          ),),
          Wrap(
            children: [
              Container(
                color: (_isSearch) ? Colors.white : Colors.transparent,
                padding: EdgeInsets.all(20),
                child: SafeArea(
                  child: Wrap(
                    alignment: WrapAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: (_isSearch) ? MediaQuery.of(context).size.width * 0.65 : MediaQuery.of(context).size.width - 40,
                            child: TextFieldWidget(
                                hintText: "Cari Rumah Sakit",
                                obscureText: false,
                                onChange: (value) {
                                  _keyword = value;
                                },
                                onTap: () {
                                  setState(() {
                                    _isSearch = true;
                                    _isPlaceSelected = false;
                                  });
                                },
                                suffixIcon: Icons.search,
                                inputType: TextInputType.text,
                                fillColor: Colors.white
                            ),
                          ),
                          if(_isSearch) Container(
                            width: MediaQuery.of(context).size.width * 0.2,
                            child: ButtonWidget(
                              title: "Cari",
                              hasBorder: false,
                              onClick: () {
                                getPlaceText();
                              },
                            ),
                          )
                        ],
                      ),

                      Column(
                        children: [
                          if(_isSearch) SizedBox(height: 12,),
                          if(_isSearch) Text("Atau"),
                          SizedBox(height: 12,),
                          ButtonWidget(
                            title: "Cari rumah sakit terdekat",
                            hasBorder: false,
                            onClick: () {
                              getNearbyPlace();
                            },
                          ),
                        ],
                      ),

                      if (_isLoading) SizedBox(height: MediaQuery.of(context).size.height * 0.3,),
                      if (_isLoading) Card(
                        child: Padding(
                          padding: EdgeInsets.all(20),
                          child: Column(
                            children: [
                              CircularProgressIndicator(),
                              SizedBox(height: 16,),
                              Text("Memuat Data..")
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
          if(_isPlaceSelected) Positioned(
            bottom: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold
                        ),
                          _placesTemp.name
                      ),
                      SizedBox(height: 12,),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.star_rate, color: Colors.yellow,),
                          Text((_placesTemp.rating != null) ? _placesTemp.rating.toString() : "0")
                        ],
                      )
                    ],
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => DetailPage(places: _placesTemp, origin: _currentPosition!,))
                      );
                    },
                    child: Icon(Icons.navigate_next)
                  )
                ],
              ),
            )
          )
        ],
      ),
    );
  }

  void _addMarker(LatLng pos) {
    setState(() {
      _isSearch = false;
      FocusManager.instance.primaryFocus?.unfocus();
      _isPlaceSelected = false;
    });
  }

  void getNearbyPlace() {
    setState(() {
      _isSearch = false;
      _isLoading = true;
      FocusManager.instance.primaryFocus?.unfocus();
    });

    _futurePlacesModel = ApiDataSource.instance.loadNearbyPlaces(
        _currentPosition!,
        "5000"
    );

    _futurePlacesModel.then((value) {
      final Set<Marker> markersTemp = new Set();
      for(int i = 0; i < value.length; i++) {
        markersTemp.add(Marker(
          markerId: MarkerId(value[i].place_id),
          position: value[i].location,
          infoWindow: InfoWindow(title: value[i].name),
          onTap: () {
            setState(() {
              _placesTemp = value[i];
              _isPlaceSelected = true;
            });
          }
        ));
      }

      setState(() {
        markers = markersTemp;
        _isLoading = false;
      });

      _googleMapController.animateCamera(
          CameraUpdate.newCameraPosition(CameraPosition(
              target: _currentPosition!,
              zoom: 12.6
          ))
      );
    });
  }

  void getPlaceText() {
    setState(() {
      _isSearch = false;
      _isLoading = _keyword != "";
      FocusManager.instance.primaryFocus?.unfocus();
    });

    if(_keyword != "") {
      _futurePlacesModel = ApiDataSource.instance.loadPlacesText(
          _keyword
      );

      _futurePlacesModel.then((value) {
        final Set<Marker> markersTemp = new Set();
        for(int i = 0; i < value.length; i++) {
          markersTemp.add(Marker(
            markerId: MarkerId(value[i].place_id),
            position: value[i].location,
            infoWindow: InfoWindow(title: value[i].name),
            onTap: () {
              setState(() {
                _placesTemp = value[i];
                _isPlaceSelected = true;
              });
            }
          ));
        }

        setState(() {
          markers = markersTemp;
          _isLoading = false;
        });

        _googleMapController.animateCamera(
            CameraUpdate.newCameraPosition(CameraPosition(
                target: _currentPosition!,
                zoom: 7
            ))
        );
      });
    } else {
      setState(() {
        markers.clear();
      });
    }
  }
}
