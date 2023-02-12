/*
import 'dart:async';
import 'dart:math';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mapmyindia_gl/mapmyindia_gl.dart';
import 'lat_lng.dart' as latlng;


enum GoogleMapStyle {
  standard,
  silver,
  retro,
  dark,
  night,
  aubergine,
}

enum GoogleMarkerColor {
  red,
  orange,
  yellow,
  green,
  cyan,
  azure,
  blue,
  violet,
  magenta,
  rose,
}
enum MarkerTYpe{
  Normal,Pickup,Destination
}

class MapMyIndiaInitiate{
  static const String MAP_SDK_KEY = "91fbeba27f59a02aa80c0508d6016305";
  static const String REST_API_KEY = "91fbeba27f59a02aa80c0508d6016305";
  static const String ATLAS_CLIENT_ID = "33OkryzDZsJkYsbulomHQB_bC2k3Ux1mN1vR_wDAPCzNkf2TbggP2HmGVCytHTL1IZrf1eUmT57ldfBmGqtTog==";
  static const String ATLAS_CLIENT_SECRET = "lrFxI-iSEg8cMPOai6_qmjyqP9tonTh1av_-ZCRH1PMlCAHh6pMG-LCDCR2C55A1xGkutCm8oUybLQv_J8xFiKqRCAuP4NDc";

  /// ## Map My India Initialized
  /// Initialize map my india in [main]
  /// Initializes a new MapMyIndia instance by [MAP_SDK_KEY] , [REST_API_KEY] , [ATLAS_CLIENT_ID] and [ATLAS_CLIENT_SECRET], and returns the created app.
  /// This method should be called before any usage of MapMyIndia plugins
  /// go to map my india official website {@youtube 560 315 https://mapmyindia.com/ }to get those [KEY]
  initialize(){
  MapmyIndiaAccountManager.setMapSDKKey(MAP_SDK_KEY);
  MapmyIndiaAccountManager.setRestAPIKey(REST_API_KEY);
  MapmyIndiaAccountManager.setAtlasClientId(ATLAS_CLIENT_ID);
  MapmyIndiaAccountManager.setAtlasClientSecret(ATLAS_CLIENT_SECRET);

}
}
final mapinit = MapMyIndiaInitiate();
class FlutterFlowMarker {
   FlutterFlowMarker(
       {required this.markerId, required this.location, this.markerColor = GoogleMarkerColor
           .cyan, this.markertype = MarkerTYpe
           .Normal, this.draggable = false, this.onTap});
  final String markerId;
  final GoogleMarkerColor markerColor;
  final latlng.LatLng location;
  final Future Function()? onTap;
  final MarkerTYpe markertype;
  final bool draggable ;

   SymbolOptions get symbolOptions=>
       markertype==MarkerTYpe.Pickup?SymbolOptions(geometry: LatLng(location.latitude,location.longitude),iconColor: "${googleMarkerColorMap[markerColor]}",draggable: draggable)
           :markertype==MarkerTYpe.Destination?SymbolOptions(geometry: LatLng(location.latitude,location.longitude),iconColor: "${googleMarkerColorMap[markerColor]}",draggable: draggable)
           :SymbolOptions(geometry: LatLng(location.latitude,location.longitude),iconColor: "${googleMarkerColorMap[markerColor]}",draggable: draggable);
}

class FlutterFlowGoogleMap extends StatefulWidget {


  const FlutterFlowGoogleMap({
    this.onCameraIdle,
    this.initialLocation =  const latlng.LatLng(0.0, 0.0),
    this.markers = const [],
    this.markerColor = GoogleMarkerColor.red,
    this.mapType = MyLocationTrackingMode.None,
    this.style = GoogleMapStyle.standard,
    this.initialZoom = 12,
    this.allowInteraction = true,
    this.allowZoom = true,
    this.showZoomControls = true,
    this.showLocation = true,
    this.showCompass = false,
    this.showMapToolbar = false,
    this.showTraffic = false,
    this.centerMapOnMarkerTap = false,
    this.allowongclick = false,
    Key? key,
  }) : super(key: key);

  final bool allowongclick;
  final Function(latlng.LatLng)? onCameraIdle;
  final latlng.LatLng initialLocation;
  final Iterable<FlutterFlowMarker> markers;
  final GoogleMarkerColor markerColor;
  final MyLocationTrackingMode mapType;
  final GoogleMapStyle style;
  final double initialZoom;
  final bool allowInteraction;
  final bool allowZoom;
  final bool showZoomControls;
  final bool showLocation;
  final bool showCompass;
  final bool showMapToolbar;
  final bool showTraffic;
  final bool centerMapOnMarkerTap;

  @override
  State<StatefulWidget> createState() => _FlutterFlowGoogleMapState();
}
Completer get _controller => Completer<MapmyIndiaMapController>();
class _FlutterFlowGoogleMapState extends State<FlutterFlowGoogleMap> {
  double get initialZoom => max(double.minPositive, widget.initialZoom);
  LatLng get initialPosition =>
      widget.initialLocation.toGoogleMaps() ;

  late MapmyIndiaMapController mapcontroler ;
  LatLng? currentMapCenter;

  @override
  void initState() {
    super.initState();
    currentMapCenter = initialPosition;
    widget.markers
        .map((m) => FlutterFlowMarker(
          markerId: m.markerId,
          location: m.location,
          onTap: () async {
            await m.onTap?.call();
            if (widget.centerMapOnMarkerTap) {
              final controller = await _controller.future;
              await controller.animateCamera(
                CameraUpdate.newLatLng(m.location.toGoogleMaps()),
              );
              widget.onCameraIdle?.call(m.location);
            }
          },
        ));
  }
  Future<void> addImageFromAsset(String name, String assetName) async {
    final ByteData bytes = await rootBundle.load(assetName);
    final Uint8List list = bytes.buffer.asUint8List();
     mapcontroler.addImage(name, list);
     _controller.complete(mapcontroler);
  }
  @override
  Widget build(BuildContext context) => AbsorbPointer(
        absorbing: !widget.allowInteraction,
        child:*/
/* GoogleMap(
          onMapCreated: (controller) async {
            _controller.complete(controller);
            await controller.setMapStyle(googleMapStyleStrings[widget.style]);
          },
          onCameraIdle: () =>
              widget.onCameraIdle?.call(currentMapCenter.toLatLng()),
          onCameraMove: (position) => currentMapCenter = position.target,
          initialCameraPosition: CameraPosition(
            target: initialPosition,
            zoom: initialZoom,
          ),
          mapType: widget.mapType,
          zoomGesturesEnabled: widget.allowZoom,
          zoomControlsEnabled: widget.showZoomControls,
          myLocationEnabled: widget.showLocation,
          compassEnabled: widget.showCompass,
          mapToolbarEnabled: widget.showMapToolbar,
          trafficEnabled: widget.showTraffic,
          markers: widget.markers
              .map(
                (m) => Marker(
                  markerId: MarkerId(m.markerId),
                  position: m.location.toGoogleMaps(),
                  icon: BitmapDescriptor.defaultMarkerWithHue(
                      googleMarkerColorMap[widget.markerColor]),
                  onTap: () async {
                    await m.onTap?.call();
                    if (widget.centerMapOnMarkerTap) {
                      final controller = await _controller.future;
                      await controller.animateCamera(
                        CameraUpdate.newLatLng(m.location.toGoogleMaps()),
                      );
                      widget.onCameraIdle?.call(m.location);
                    }
                  },
                ),
              )
              .toSet(),
        )*//*
Stack(
           children: [
             MapmyIndiaMap(
            initialCameraPosition:  CameraPosition(
              target: initialPosition,
              zoom: 14.0,
            ),
            onCameraIdle:  widget.onCameraIdle?.call(currentMapCenter!.toLatLng()),
            onCameraTrackingChanged: (_) => _controller.future.then((value) => currentMapCenter = value.cameraPosition!.target),
            // onCameraMove: (position) => currentMapCenter = position.target,
            // mapType: widget.mapType,
            zoomGesturesEnabled: widget.allowZoom,
            // zoomControlsEnabled: widget.showZoomControls,
            myLocationEnabled: widget.showLocation,
            compassEnabled: widget.showCompass,
            // mapToolbarEnabled: widget.showMapToolbar,
            // trafficEnabled: widget.showTraffic,
            // markers: widget.markers
            // myLocationEnabled: true,
            myLocationTrackingMode: widget.mapType,
            onMapLongClick: widget.allowongclick?(ponter,latlng)=>_controller.future.then((value) => value.addSymbol(SymbolOptions(geometry: latlng))):null,
            trackCameraPosition: true,
            onMapCreated: (map) async{
              _controller.complete(map);
              mapcontroler = map;
              // await addImageFromAsset("pickuppos","");
              // await addImageFromAsset("destinationpos","");
              // await addImageFromAsset("activeauto","");
              // await addImageFromAsset("inactiveauto","");
              // await map.setMapStyle(googleMapStyleStrings[widget.style]);
              widget.markers.map((e) async=> await map.addSymbol(e.symbolOptions));
              // await map.addSymbol(SymbolOptions(geometry: LatLng(25.321684, 82.987289)));

            },
            compassViewPosition: CompassViewPosition.BottomLeft,
            myLocationRenderMode: MyLocationRenderMode.GPS,

          ),
           ]
        ),
      );
}

extension ToGoogleMapsLatLng on latlng.LatLng {
  LatLng toGoogleMaps() => LatLng(latitude, longitude);
}

extension GoogleMapsToLatLng on LatLng {
  latlng.LatLng toLatLng() => latlng.LatLng(latitude, longitude);
}

Map<GoogleMapStyle, String> googleMapStyleStrings = {
  GoogleMapStyle.standard: '[]',
  GoogleMapStyle.silver:
      r'[{"elementType":"geometry","stylers":[{"color":"#f5f5f5"}]},{"elementType":"labels.icon","stylers":[{"visibility":"off"}]},{"elementType":"labels.text.fill","stylers":[{"color":"#616161"}]},{"elementType":"labels.text.stroke","stylers":[{"color":"#f5f5f5"}]},{"featureType":"administrative.land_parcel","elementType":"labels.text.fill","stylers":[{"color":"#bdbdbd"}]},{"featureType":"poi","elementType":"geometry","stylers":[{"color":"#eeeeee"}]},{"featureType":"poi","elementType":"labels.text.fill","stylers":[{"color":"#757575"}]},{"featureType":"poi.park","elementType":"geometry","stylers":[{"color":"#e5e5e5"}]},{"featureType":"poi.park","elementType":"labels.text.fill","stylers":[{"color":"#9e9e9e"}]},{"featureType":"road","elementType":"geometry","stylers":[{"color":"#ffffff"}]},{"featureType":"road.arterial","elementType":"labels.text.fill","stylers":[{"color":"#757575"}]},{"featureType":"road.highway","elementType":"geometry","stylers":[{"color":"#dadada"}]},{"featureType":"road.highway","elementType":"labels.text.fill","stylers":[{"color":"#616161"}]},{"featureType":"road.local","elementType":"labels.text.fill","stylers":[{"color":"#9e9e9e"}]},{"featureType":"transit.line","elementType":"geometry","stylers":[{"color":"#e5e5e5"}]},{"featureType":"transit.station","elementType":"geometry","stylers":[{"color":"#eeeeee"}]},{"featureType":"water","elementType":"geometry","stylers":[{"color":"#c9c9c9"}]},{"featureType":"water","elementType":"labels.text.fill","stylers":[{"color":"#9e9e9e"}]}]',
  GoogleMapStyle.retro:
      r'[{"elementType":"geometry","stylers":[{"color":"#ebe3cd"}]},{"elementType":"labels.text.fill","stylers":[{"color":"#523735"}]},{"elementType":"labels.text.stroke","stylers":[{"color":"#f5f1e6"}]},{"featureType":"administrative","elementType":"geometry.stroke","stylers":[{"color":"#c9b2a6"}]},{"featureType":"administrative.land_parcel","elementType":"geometry.stroke","stylers":[{"color":"#dcd2be"}]},{"featureType":"administrative.land_parcel","elementType":"labels.text.fill","stylers":[{"color":"#ae9e90"}]},{"featureType":"landscape.natural","elementType":"geometry","stylers":[{"color":"#dfd2ae"}]},{"featureType":"poi","elementType":"geometry","stylers":[{"color":"#dfd2ae"}]},{"featureType":"poi","elementType":"labels.text.fill","stylers":[{"color":"#93817c"}]},{"featureType":"poi.park","elementType":"geometry.fill","stylers":[{"color":"#a5b076"}]},{"featureType":"poi.park","elementType":"labels.text.fill","stylers":[{"color":"#447530"}]},{"featureType":"road","elementType":"geometry","stylers":[{"color":"#f5f1e6"}]},{"featureType":"road.arterial","elementType":"geometry","stylers":[{"color":"#fdfcf8"}]},{"featureType":"road.highway","elementType":"geometry","stylers":[{"color":"#f8c967"}]},{"featureType":"road.highway","elementType":"geometry.stroke","stylers":[{"color":"#e9bc62"}]},{"featureType":"road.highway.controlled_access","elementType":"geometry","stylers":[{"color":"#e98d58"}]},{"featureType":"road.highway.controlled_access","elementType":"geometry.stroke","stylers":[{"color":"#db8555"}]},{"featureType":"road.local","elementType":"labels.text.fill","stylers":[{"color":"#806b63"}]},{"featureType":"transit.line","elementType":"geometry","stylers":[{"color":"#dfd2ae"}]},{"featureType":"transit.line","elementType":"labels.text.fill","stylers":[{"color":"#8f7d77"}]},{"featureType":"transit.line","elementType":"labels.text.stroke","stylers":[{"color":"#ebe3cd"}]},{"featureType":"transit.station","elementType":"geometry","stylers":[{"color":"#dfd2ae"}]},{"featureType":"water","elementType":"geometry.fill","stylers":[{"color":"#b9d3c2"}]},{"featureType":"water","elementType":"labels.text.fill","stylers":[{"color":"#92998d"}]}]',
  GoogleMapStyle.dark:
      r'[{"elementType":"geometry","stylers":[{"color":"#212121"}]},{"elementType":"labels.icon","stylers":[{"visibility":"off"}]},{"elementType":"labels.text.fill","stylers":[{"color":"#757575"}]},{"elementType":"labels.text.stroke","stylers":[{"color":"#212121"}]},{"featureType":"administrative","elementType":"geometry","stylers":[{"color":"#757575"}]},{"featureType":"administrative.country","elementType":"labels.text.fill","stylers":[{"color":"#9e9e9e"}]},{"featureType":"administrative.land_parcel","stylers":[{"visibility":"off"}]},{"featureType":"administrative.locality","elementType":"labels.text.fill","stylers":[{"color":"#bdbdbd"}]},{"featureType":"poi","elementType":"labels.text.fill","stylers":[{"color":"#757575"}]},{"featureType":"poi.park","elementType":"geometry","stylers":[{"color":"#181818"}]},{"featureType":"poi.park","elementType":"labels.text.fill","stylers":[{"color":"#616161"}]},{"featureType":"poi.park","elementType":"labels.text.stroke","stylers":[{"color":"#1b1b1b"}]},{"featureType":"road","elementType":"geometry.fill","stylers":[{"color":"#2c2c2c"}]},{"featureType":"road","elementType":"labels.text.fill","stylers":[{"color":"#8a8a8a"}]},{"featureType":"road.arterial","elementType":"geometry","stylers":[{"color":"#373737"}]},{"featureType":"road.highway","elementType":"geometry","stylers":[{"color":"#3c3c3c"}]},{"featureType":"road.highway.controlled_access","elementType":"geometry","stylers":[{"color":"#4e4e4e"}]},{"featureType":"road.local","elementType":"labels.text.fill","stylers":[{"color":"#616161"}]},{"featureType":"transit","elementType":"labels.text.fill","stylers":[{"color":"#757575"}]},{"featureType":"water","elementType":"geometry","stylers":[{"color":"#000000"}]},{"featureType":"water","elementType":"labels.text.fill","stylers":[{"color":"#3d3d3d"}]}]',
  GoogleMapStyle.night:
      r'[{"elementType":"geometry","stylers":[{"color":"#242f3e"}]},{"elementType":"labels.text.fill","stylers":[{"color":"#746855"}]},{"elementType":"labels.text.stroke","stylers":[{"color":"#242f3e"}]},{"featureType":"administrative.locality","elementType":"labels.text.fill","stylers":[{"color":"#d59563"}]},{"featureType":"poi","elementType":"labels.text.fill","stylers":[{"color":"#d59563"}]},{"featureType":"poi.park","elementType":"geometry","stylers":[{"color":"#263c3f"}]},{"featureType":"poi.park","elementType":"labels.text.fill","stylers":[{"color":"#6b9a76"}]},{"featureType":"road","elementType":"geometry","stylers":[{"color":"#38414e"}]},{"featureType":"road","elementType":"geometry.stroke","stylers":[{"color":"#212a37"}]},{"featureType":"road","elementType":"labels.text.fill","stylers":[{"color":"#9ca5b3"}]},{"featureType":"road.highway","elementType":"geometry","stylers":[{"color":"#746855"}]},{"featureType":"road.highway","elementType":"geometry.stroke","stylers":[{"color":"#1f2835"}]},{"featureType":"road.highway","elementType":"labels.text.fill","stylers":[{"color":"#f3d19c"}]},{"featureType":"transit","elementType":"geometry","stylers":[{"color":"#2f3948"}]},{"featureType":"transit.station","elementType":"labels.text.fill","stylers":[{"color":"#d59563"}]},{"featureType":"water","elementType":"geometry","stylers":[{"color":"#17263c"}]},{"featureType":"water","elementType":"labels.text.fill","stylers":[{"color":"#515c6d"}]},{"featureType":"water","elementType":"labels.text.stroke","stylers":[{"color":"#17263c"}]}]',
  GoogleMapStyle.aubergine:
      r'[{"elementType":"geometry","stylers":[{"color":"#1d2c4d"}]},{"elementType":"labels.text.fill","stylers":[{"color":"#8ec3b9"}]},{"elementType":"labels.text.stroke","stylers":[{"color":"#1a3646"}]},{"featureType":"administrative.country","elementType":"geometry.stroke","stylers":[{"color":"#4b6878"}]},{"featureType":"administrative.land_parcel","elementType":"labels.text.fill","stylers":[{"color":"#64779e"}]},{"featureType":"administrative.province","elementType":"geometry.stroke","stylers":[{"color":"#4b6878"}]},{"featureType":"landscape.man_made","elementType":"geometry.stroke","stylers":[{"color":"#334e87"}]},{"featureType":"landscape.natural","elementType":"geometry","stylers":[{"color":"#023e58"}]},{"featureType":"poi","elementType":"geometry","stylers":[{"color":"#283d6a"}]},{"featureType":"poi","elementType":"labels.text.fill","stylers":[{"color":"#6f9ba5"}]},{"featureType":"poi","elementType":"labels.text.stroke","stylers":[{"color":"#1d2c4d"}]},{"featureType":"poi.park","elementType":"geometry.fill","stylers":[{"color":"#023e58"}]},{"featureType":"poi.park","elementType":"labels.text.fill","stylers":[{"color":"#3C7680"}]},{"featureType":"road","elementType":"geometry","stylers":[{"color":"#304a7d"}]},{"featureType":"road","elementType":"labels.text.fill","stylers":[{"color":"#98a5be"}]},{"featureType":"road","elementType":"labels.text.stroke","stylers":[{"color":"#1d2c4d"}]},{"featureType":"road.highway","elementType":"geometry","stylers":[{"color":"#2c6675"}]},{"featureType":"road.highway","elementType":"geometry.stroke","stylers":[{"color":"#255763"}]},{"featureType":"road.highway","elementType":"labels.text.fill","stylers":[{"color":"#b0d5ce"}]},{"featureType":"road.highway","elementType":"labels.text.stroke","stylers":[{"color":"#023e58"}]},{"featureType":"transit","elementType":"labels.text.fill","stylers":[{"color":"#98a5be"}]},{"featureType":"transit","elementType":"labels.text.stroke","stylers":[{"color":"#1d2c4d"}]},{"featureType":"transit.line","elementType":"geometry.fill","stylers":[{"color":"#283d6a"}]},{"featureType":"transit.station","elementType":"geometry","stylers":[{"color":"#3a4762"}]},{"featureType":"water","elementType":"geometry","stylers":[{"color":"#0e1626"}]},{"featureType":"water","elementType":"labels.text.fill","stylers":[{"color":"#4e6d70"}]}]',
};

Map<GoogleMarkerColor, double>  googleMarkerColorMap = {
  GoogleMarkerColor.red: 0.0,
  GoogleMarkerColor.orange: 30.0,
  GoogleMarkerColor.yellow: 60.0,
  GoogleMarkerColor.green: 120.0,
  GoogleMarkerColor.cyan: 180.0,
  GoogleMarkerColor.azure: 210.0,
  GoogleMarkerColor.blue: 240.0,
  GoogleMarkerColor.violet: 270.0,
  GoogleMarkerColor.magenta: 300.0,
  GoogleMarkerColor.rose: 330.0,
};
*/
