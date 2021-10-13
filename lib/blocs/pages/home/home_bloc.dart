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
import 'home_events.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvents, HomeState> {
  late MapsFunctions mapa;
  HomeBloc(HomeState initState) : super(initState) {
    mapa = MapsFunctions(initState);
    this._init();
  }

  @override
  Future<void> close() async {
    mapa.subscription.cancel();
    mapa.subscriptionGpsStatus.cancel();
    super.close();
  }

  @override
  HomeState get initialState => HomeState.initialState;
  @override
  Stream<HomeState> mapEventToState(HomeEvents event) async* {
    if (event is OnMyLocationUpdate) {
      yield* this.mapa.mapOnMyLocationUpdate(event);
    } else if (event is OnGpsEnabled) {
      yield this.state.copyWith(gpsEnabled: event.enabled);
    } else if (event is OnMapTap) {
      yield* this.mapa.mapOnMapTap(event);
    }
  }

  _init() async {
    mapa.loadCarPin();
    mapa.subscription = geo.Geolocator.getPositionStream(
            desiredAccuracy: geo.LocationAccuracy.high, distanceFilter: 10)
        .listen(
      (geo.Position position) async {
        if (position != null) {
          final newPosition = LatLng(position.latitude, position.longitude);
          add(
            OnMyLocationUpdate(
              newPosition,
            ),
          );

          // final CameraUpdate cameraUpdate = CameraUpdate.newLatLng(newPosition);
          // await (await _mapController).animateCamera(cameraUpdate);
        }
      },
    );

    if (Platform.isAndroid) {
      //final bool enabled = await _geolocator.isLocationServiceEnabled();

      mapa.subscriptionGpsStatus =
          mapa.locationPermissions.serviceStatus.listen((status) {
        add(
          OnGpsEnabled(status == ServiceStatus.enabled),
        );
      });
    }
  }
}
