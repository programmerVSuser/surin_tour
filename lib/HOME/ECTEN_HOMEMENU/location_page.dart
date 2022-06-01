import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MMap extends StatefulWidget {
  const MMap({Key? key}) : super(key: key);

  @override
  _MMapState createState() => _MMapState();
}

class _MMapState extends State<MMap> {
  Set<Marker> _marker = {};
  void _onMap(
      GoogleMapController controller){
    setState((){
      _marker.add(Marker(
          markerId: MarkerId("id-1"),
          position: LatLng(14.85904048950496, 103.48725046984309),
          infoWindow: InfoWindow(
            title: "Surin tour",
            snippet: "บริการขนส่งสุรินทร์ - กรุงเทพ ",
          )));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Location", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.purple[800],
      ),
      body: GoogleMap(
        onMapCreated: _onMap,
        markers: _marker,
        initialCameraPosition: CameraPosition(
          target: LatLng(14.886287199196806, 103.49297263931271),
          zoom: 13,
        ),
        mapType: MapType.normal,
      ),
    );
  }
}
