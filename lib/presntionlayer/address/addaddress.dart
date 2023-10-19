import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/busnieslogiclayer/address/addressviewmodel.dart';
import 'package:untitled1/customwidget/customappbar.dart';

import '../../const/color.dart';
import '../../customwidget/custombutton.dart';
import 'custom.dart';

class AddAddressView extends StatefulWidget {
  const AddAddressView({super.key});

  @override
  State<AddAddressView> createState() => _AddAddressViewState();
}

class _AddAddressViewState extends State<AddAddressView> {
  final List<Marker> _markers = <Marker>[
    const Marker(
        draggable: true,
        markerId: MarkerId('1'),
        position: LatLng(33.68, 73.04),
        infoWindow: InfoWindow(title: ''))
  ];

  final Completer<GoogleMapController> _controller = Completer();
  String? address;
  late double lat;
  late double lng;

  static const CameraPosition _kGooglePlex = CameraPosition(
    bearing: 0,
    tilt: 0.0,
    target: LatLng(33.684, 73.047),
    zoom: 17,
  );

  @override
  void initState() {
    // _pageController = PageController(initialPage: 1, viewportFraction: 0.85);
    super.initState();
    getCurrentLocation().then((value) async {
      print('${value.latitude}********${value.longitude}');
      lat = value.latitude;
      lng = value.longitude;
      List<Placemark> placemarks = await placemarkFromCoordinates(lat, lng);
      print('111111${placemarks}111111');
      Placemark place = placemarks[0];
      address = '${place.street} ,  ${place.country}';
      print(address.toString());
      _markers.add(Marker(
        draggable: true,
        onDragEnd: (newPosition) async {
          lat = newPosition.latitude;
          lng = newPosition.longitude;
          List<Placemark> placemarks = await placemarkFromCoordinates(lat, lng);
          print('222222${placemarks}22222222');
          Placemark place = placemarks[0];
          address = '${place.locality} ,  ${place.country}';
          print('444444${address}444444');
          setState(() {});
        },
        markerId: const MarkerId('1'),
        position: LatLng(value.latitude, value.longitude),
      ));
      CameraPosition cameraPosition = CameraPosition(
          zoom: 17, target: LatLng(value.latitude, value.longitude));
      final GoogleMapController controller = await _controller.future;
      controller.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));

      setState(() {});
    });
  }

  bool _isHomeSelected = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: drewAppBar(context: context, name: "إضافة عنوان"),
      body: Stack(alignment: Alignment.bottomCenter, children: [
        SizedBox(
          width: MediaQuery
              .of(context)
              .size
              .width,
          height: MediaQuery
              .of(context)
              .size
              .height,
          child: GoogleMap(
            zoomControlsEnabled: true,
            zoomGesturesEnabled: true,
            mapType: MapType.normal,
            markers: Set<Marker>.of(_markers),
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
            initialCameraPosition: _kGooglePlex,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white),
                height: 60,
                width: 3900,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: address != null
                            ? Text(
                          address.toString(),
                          style: const TextStyle(color: Colors.grey),
                        )
                            : const Text(
                          'اختر موقعك',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          if (_isHomeSelected == false) {
                            setState(() {
                              _isHomeSelected = true;
                            });
                          }
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: !_isHomeSelected
                                      ? Colors.grey
                                      : DefaultColor),
                              color:
                              _isHomeSelected ? DefaultColor : Colors.white,
                              borderRadius: BorderRadius.circular(15)),
                          width: 72,
                          height: 36,
                          child: Center(
                            child: Text(
                              "house",
                              style: TextStyle(
                                  color: !_isHomeSelected
                                      ? Colors.black
                                      : Colors.white),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          if (_isHomeSelected == true) {
                            setState(() {
                              _isHomeSelected = false;
                            });
                          }
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color:
                            !_isHomeSelected ? DefaultColor : Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                                color: _isHomeSelected
                                    ? Colors.grey
                                    : DefaultColor),
                          ),
                          width: 72,
                          height: 36,
                          child: Center(
                            child: Text(
                              ".work",
                              style: TextStyle(
                                  color: _isHomeSelected
                                      ? Colors.black
                                      : Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              CustomFormField(
                controller: context
                    .watch<AddressViewModel>()
                    .phoneController,
                obsecure: false,
                validator: () {},
                hintText: "phone",
              ),
              SizedBox(
                height: 10,
              ),
              CustomFormField(
                controller: context
                    .watch<AddressViewModel>()
                    .describtionController,
                obsecure: false,
                validator: () {},
                hintText: "description",
              ),
              SizedBox(
                height: 10,
              ),

              drewCustomButton(
                  name: "اضافة عنوان",
                  tab: () {
                    var des =
                        context
                            .read<AddressViewModel>()
                            .describtionController;
                    var phone =
                        context
                            .read<AddressViewModel>()
                            .phoneController;
                    context.read<AddressViewModel>().addAddress(
                      context: context,
                      lat: lat,
                      lng: lng,
                      loc: address,
                      type: _isHomeSelected,
                    //  isDefault: 1,
                      desc: des.text,
                      phone: phone.text,
                    );
                    setState(() {
                      des.clear();
                      phone.clear();
                    });
                  }),

            ],
          ),
        ),
      ]),
    );
  }

  Future<Position> getCurrentLocation() async {
    await Geolocator.requestPermission()
        .then((value) {})
        .onError((error, stackTrace) {
      print('error is $error');
    });
    return await Geolocator.getCurrentPosition();
  }
}
