import 'dart:async';
import 'dart:typed_data';
import 'dart:io' show Platform;
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:google_maps/blocs/pages/home/bloc.dart';
import 'package:geolocator/geolocator.dart' as geo;
import 'package:google_maps/utils/extras.dart';
import 'package:google_maps/utils/mapsFunctions.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location_permissions/location_permissions.dart';

class MapsFunctions {
  HomeState state;
  final LocationPermissions locationPermissions = LocationPermissions();
  Completer<GoogleMapController> _completer = Completer();

  final Completer<Marker> _myPositionMarker = Completer();
  final geo.LocationOptions locationOptions = geo.LocationOptions(
      accuracy: geo.LocationAccuracy.high, distanceFilter: 10);

  late StreamSubscription<geo.Position> subscription;
  late StreamSubscription<ServiceStatus> subscriptionGpsStatus;

  Polyline myRoute = Polyline(
    polylineId: PolylineId('my_route'),
    width: 5,
    color: Colors.redAccent,
  );

  Polygon myTaps = Polygon(
      polygonId: PolygonId('my_taps_polygon'),
      fillColor: Colors.redAccent,
      strokeWidth: 3,
      strokeColor: Colors.white);

  Future<GoogleMapController> get _mapController async {
    return await _completer.future;
  }

  MapsFunctions(this.state);
  goToMyPosition(HomeState state) async {
    if (state.myLocation != null) {
      final CameraUpdate cameraUpdate =
          CameraUpdate.newLatLng(state.myLocation);

      await (await _mapController).animateCamera(cameraUpdate);
    }
  }

  loadCarPin() async {
    final Uint8List bytes = await loadAsset('assets/car-pin.png', width: 40);
    final marker = Marker(
      markerId: MarkerId('my_position_marker'),
      icon: BitmapDescriptor.fromBytes(bytes),
      anchor: Offset(0.5, 0.5),
    );
    this._myPositionMarker.complete(marker);
  }

  void setMapController(GoogleMapController controller) {
    if (_completer.isCompleted) {
      _completer = Completer();
    }
    _completer.complete(controller);
  }

  Stream<HomeState> mapOnMyLocationUpdate(OnMyLocationUpdate event) async* {
    //  this.myRoute.points.add(event.location);
    List<LatLng> points = List<LatLng>.from(this.myRoute.points);
    points.add(event.location);

    this.myRoute = this.myRoute.copyWith(pointsParam: points);
    print("points ${this.myRoute.points.length}");

    Map<PolylineId, Polyline> polylines =
        Map<PolylineId, Polyline>.from(this.state.polylines);

    polylines[this.myRoute.polylineId] = this.myRoute;

    final markers = Map<MarkerId, Marker>.from(this.state.markers);

    double rotation = 0;
    LatLng lastPosition = this.state.myLocation;
    if (lastPosition != null) {
      rotation = getCoordsRotation(event.location, lastPosition);
    }

    final Marker myPositionMarker =
        (await this._myPositionMarker.future).copyWith(
      positionParam: event.location,
      rotationParam: rotation,
    );

    markers[myPositionMarker.markerId] = myPositionMarker;

    yield this.state.copyWith(
        loading: false,
        myLocation: event.location,
        polylines: polylines,
        gpsEnabled: true,
        markers: markers);
  }

  Stream<HomeState> mapOnMapTap(OnMapTap event) async* {
    final markerId = MarkerId(this.state.markers.length.toString());
    final info = InfoWindow(
      title: "HEllO ${markerId.value}",
      snippet: "la direcccion etc etc",
    );

    // final Uint8List bytes =
    //     await loadAsset('assets/car-pin.png', width: 50, height: 90);

    final Uint8List bytes = await loadImageFromNetwork(
      'https://cdn.domestika.org/c_fill,dpr_auto,h_256,t_base_params.format_jpg,w_256/v1506185040/avatars/000/150/905/150905-original.jpg?1506185040',
      width: 100,
      height: 100,
    );

    final customIcon = BitmapDescriptor.fromBytes(bytes);
    final marker = Marker(
      markerId: markerId,
      position: event.location,
      icon: customIcon,
      anchor: Offset(0.5, 0.5),
      onTap: () {},
      draggable: true,
      onDragEnd: (newPosition) {},
      infoWindow: info,
    );

    final markers = Map<MarkerId, Marker>.from(this.state.markers);
    markers[markerId] = marker;

    List<LatLng> points = List<LatLng>.from(this.myTaps.points);
    points.add(event.location);
    this.myTaps = this.myTaps.copyWith(pointsParam: points);
    Map<PolygonId, Polygon> polygons =
        Map<PolygonId, Polygon>.from(this.state.polygons);
    polygons[this.myTaps.polygonId] = this.myTaps;

    yield this.state.copyWith(markers: markers, polygons: polygons);
  }
}
