import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:search_map_place_updated/search_map_place_updated.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  LatLng startLocation = LatLng(27.6602292, 85.308027);
  String location = "Search Location";
  late MapControllerClass _mapControllerClass;

  get placeApiKey => 'AIzaSyBH791EwQqqScXBHNaHFrSh5fNFljqGP6k';
  @override
  void initState() {
    super.initState();
    _mapControllerClass = MapControllerClass();
  }

  @override
  Widget build(BuildContext context) {
    var userPosition;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.blueAccent,
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Column(
        children:[
          Padding(
            padding: const EdgeInsets.only(top: 40),
            child: SearchMapPlaceWidget(
            textColor: Colors.blue,
              iconColor: Colors.blue,
              bgColor: Colors.white,
              apiKey: '$placeApiKey',
              language: 'en',
              location: userPosition?.coordinates, // Make sure userPosition is not null
              onSelected: (Place place) async {
                final geolocation = await place.geolocation;
                final GoogleMapController controller = _mapControllerClass.mapController;
                controller.animateCamera(CameraUpdate.newLatLng(geolocation?.coordinates));
                controller.animateCamera(CameraUpdate.newLatLngBounds(geolocation?.bounds, 0));
              }),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
            child: Text(
              'Today, 7th May, 2023',
              style: TextStyle(
                fontSize: 14,
                color: Colors.white,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 3, 0, 0),
            child: Text(
              'Bangladesh',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
            child: Text(
              'Dhaka',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(height: 20),
          Container(
            height: 240,
            width: 240,
            child: CircleAvatar(
              radius: 100,
              backgroundColor: Colors.white,
              child: Column(
                //alignment: Alignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                    child: Image.asset(
                      'assets/image/4.png',
                      width: 60,
                      height: 60,
                    ),
                  ),
                  Text(
                    '10\u00B0C',
                    style: TextStyle(
                      fontSize: 100,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
         SizedBox(height: 25,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 70),
                child: Column(
                  children: [
                    Text(
                      "Wind Status",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                      ),
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      "7 mph",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                          color: Colors.white
                      ),
                    ),
                    Text(
                      "Humidity",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                      ),
                    ),
                    Text(
                      "85%",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                          color: Colors.white
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 70),
                child: Column(
                  children: [
                    Text(
                      "Visibility",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                      ),
                      textDirection: TextDirection.ltr,
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      "6.4 miles",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                          color: Colors.white
                      ),
                    ),
                    Text(
                      "Air pressure",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                      ),
                    ),
                    Text(
                      "998 mb",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                          color: Colors.white
                      ),),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 50),
          Container(
            height: 248,
            width: 420,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
               Padding(
                  padding: const EdgeInsets.all(30),
                  child: Text(
                    'The Next 5 days',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black
                    ),
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 40),
                    child: Row(
                      children: <Widget>[
                        Text('Sunday',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                          color: Colors.black
                        ),
                        ),
                        SizedBox(width: 55),
                        Text('Monday',
                          style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                              color: Colors.black
                          ),
                        ),
                        SizedBox(width: 55),
                        Text('Tuesday',
                          style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                              color: Colors.black
                          ),
                        ),
                        SizedBox(width: 55),
                        Text('Wednesday',style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: Colors.black
                        ),
                        ),
                        SizedBox(width: 55),
                        Text('Thusday',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: Colors.black
                        ),
                        ),
                        SizedBox(width: 55),
                        Text('Friday',
                          style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                              color: Colors.black
                          ),
                        ),
                        SizedBox(width: 55),
                        Text('Saterday',
                          style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                              color: Colors.black
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 25,),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 75,
                          width: 70,
                          decoration: BoxDecoration(
                              border:  Border.all(color: Colors.blueGrey),
                            borderRadius: BorderRadius.circular(10)
                          ),
                          child: Column(
                            children: [
                              Image(image: AssetImage('assets/image/4.png'),
                              height: 35,
                              width: 35,),
                              Text('10\u00B0C',
                              style: TextStyle(
                              fontSize: 30,
                                color: Colors.black,
                              ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 15),
                        Container(
                          height: 75,
                          width: 70,
                          decoration: BoxDecoration(
                              border:  Border.all(color: Colors.blueGrey),
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: Column(
                            children: [
                              Image(image: AssetImage('assets/image/4.png'),
                                height: 35,
                                width: 35,),
                              Text('10\u00B0C',
                                style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 15),
                        Container(
                          height: 75,
                          width: 70,
                          decoration: BoxDecoration(
                              border:  Border.all(color: Colors.blueGrey),
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: Column(
                            children: [
                              Image(image: AssetImage('assets/image/4.png'),
                                height: 35,
                                width: 35,),
                              Text('10\u00B0C',
                                style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 15),
                        Container(
                          height: 75,
                          width: 70,
                          decoration: BoxDecoration(
                              border:  Border.all(color: Colors.blueGrey),
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: Column(
                            children: [
                              Image(image: AssetImage('assets/image/4.png'),
                                height: 35,
                                width: 35,),
                              Text('10\u00B0C',
                                style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 15),
                        Container(
                          height: 75,
                          width: 70,
                          decoration: BoxDecoration(
                              border:  Border.all(color: Colors.blueGrey),
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: Column(
                            children: [
                              Image(image: AssetImage('assets/image/4.png'),
                                height: 35,
                                width: 35,),
                              Text('10\u00B0C',
                                style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 15),
                        Container(
                          height: 75,
                          width: 70,
                          decoration: BoxDecoration(
                              border:  Border.all(color: Colors.blueGrey),
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: Column(
                            children: [
                              Image(image: AssetImage('assets/image/4.png'),
                                height: 35,
                                width: 35,),
                              Text('10\u00B0C',
                                style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 15),
                        Container(
                          height: 75,
                          width: 70,
                          decoration: BoxDecoration(
                              border:  Border.all(color: Colors.blueGrey),
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: Column(
                            children: [
                              Image(image: AssetImage('assets/image/4.png'),
                                height: 35,
                                width: 35,),
                              Text('10\u00B0C',
                                style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],

            ),
          ),

        ],
                ),
      ),
    );
  }
}

class MapControllerClass {
  late GoogleMapController _mapController;

  GoogleMapController get mapController => _mapController;

  void onMapCreated(GoogleMapController controller) {
    _mapController = controller;
  }
}
