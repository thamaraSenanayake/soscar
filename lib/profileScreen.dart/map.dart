import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/services.dart';
// import 'package:geolocator/geolocator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:soscar/widget/nearLocation.dart';
import 'package:soscar/widget/textbox.dart';
import '../const.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:ui' as ui;

class MapPage extends StatefulWidget {
  MapPage({Key key}) : super(key: key);

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {

  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};
  GoogleMapController mapController;
  CameraPosition  cameraPosition;


  @override
  void initState() { 
    super.initState();
    _getCurrentPosition();
  }

  _getCurrentPosition() async {
    print("get location");
    // Position position;
    // try{
    //   position = await Geolocator.getCurrentPosition(desiredAccuracy:LocationAccuracy.best);
    // }
    // catch (e){
    //   return;
    // }
    // _currentLatLang = LatLng(position.latitude, position.longitude);
    // _addMark(LatLng(position.latitude, position.longitude));
  }

  _addMark(LatLng position) async {
    final Uint8List markerIcon = await getBytesFromAsset('assets/icon/user.png', 100);
    markers.remove("YOUR_LOCATION");
    var marker = Marker(
      markerId: MarkerId("YOUR_LOCATION"),
      position: LatLng(position.latitude,position.longitude),
      icon: BitmapDescriptor.fromBytes(markerIcon),
    );

    setState(() {
      cameraPosition =  CameraPosition(
        target: LatLng(position.latitude,position.longitude),
        zoom: 15
      );
      markers[MarkerId("YOUR_LOCATION")] = marker;
    });
  }

  Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(), targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png)).buffer.asUint8List();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Container(
        height:AppData.height.h -160.h,
        width:AppData.width.w,
        color: Colors.white,
        child: Stack(
          children: [
            Container(
              child: GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: LatLng(
                    -13.702797,
                    -69.6865109
                  ),
                  zoom: 4
                ),
                onMapCreated: _onMapCreated,
                mapToolbarEnabled: true,
                markers: Set<Marker>.of(markers.values),
                onTap: (latLng){
                  
                },
              ),
            ),

            Padding(
              padding:  EdgeInsets.only(top:100.h),
              child: Align(
                alignment: Alignment.topCenter,
                child: TextBox(
                  textBoxKey: "textBoxKey", 
                  onChange: (val){

                  }, 
                  errorText: "",
                  textBoxHint: "Search",
                  suffixIcon: Icons.search,
                ),
              ),
            ),

            DraggableScrollableActuator(
              child: DraggableScrollableSheet(
                initialChildSize: 0.15,
                minChildSize: 0.15,
                maxChildSize: (0.70),
                builder: (BuildContext context,ScrollController _scrollController) {
                  return SingleChildScrollView(
                    controller: _scrollController,
                    // physics: NeverScrollableScrollPhysics(),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 40.h,
                        ),
                        Container(
                          height: 74.h,
                          width: AppData.width.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10.w),
                              topRight: Radius.circular(10.w),
                            ),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(color: Color.fromRGBO(0, 0, 0, 0.15)),
                              BoxShadow(
                                color: Color.fromRGBO(0, 0, 0, 0.15),
                                blurRadius: 11.0,
                                spreadRadius: 0.0,
                                offset: Offset(
                                  0.0,
                                  3.0,
                                ),
                              )
                            ],
                          ),
                        ),

                        Container(
                          height: AppData.height*0.7.h-200.h,
                          width: AppData.width.w,
                          color:Colors.white,
                          child: Column(
                            children: [
                              NearLoc(),
                              NearLoc(),
                              NearLoc(),
                            ],
                          ),
                        )

                      ]
                    )
                  );
                }
              )
            )

          ],
        ),
      ),
    );
  }

  void _onMapCreated(GoogleMapController controller) {
    setState(() {
      mapController = controller;
      // controller.setMapStyle(_mapStyle);
    });

  }
}