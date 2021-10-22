import 'dart:async';
import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../utils/map_style.dart';
import '../blocs/pages/home/bloc.dart';

class HomePage extends StatefulWidget {
  static const routeName = 'home-page';
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeBloc _bloc = HomeBloc(HomeState.initialState);
  // -0.1081339,-78.4699519,18z

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: this._bloc,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          title: Text(
            'CelerikLocations',
            style: TextStyle(color: Colors.black54),
          ),
        ),
        body: SafeArea(
          child: Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.blueAccent,
            child: BlocBuilder<HomeBloc, HomeState>(
              builder: (_, state) {
                if (!state.gpsEnabled) {
                  return Center(
                    child: Text(
                      "To use the app activate the GPS",
                      textAlign: TextAlign.center,
                    ),
                  );
                }

                if (state.loading) {
                  return Center(
                    child: CircularProgressIndicator(
                      backgroundColor: Colors.red,
                    ),
                  );
                }

                final CameraPosition initialPosition = CameraPosition(
                  target: state.myLocation,
                  zoom: 15,
                );

                return Stack(
                  children: <Widget>[
                    GoogleMap(
                      initialCameraPosition: initialPosition,
                      zoomControlsEnabled: false,
                      compassEnabled: false,
                      myLocationEnabled: false,
                      markers: state.markers.values.toSet(),
                      polylines: state.polylines.values.toSet(),
                      polygons: state.polygons.values.toSet(),
                      onTap: (LatLng position) {
                        this._bloc.add(OnMapTap(position));
                      },
                      myLocationButtonEnabled: false,
                      onMapCreated: (GoogleMapController controller) {
                        this._bloc.mapa.setMapController(controller);
                      },
                    ),
                    Positioned(
                      bottom: 15,
                      right: 15,
                      child: FloatingActionButton(
                        onPressed: () => _bloc.mapa.goToMyPosition(state),
                        child: Icon(
                          Icons.gps_fixed,
                          color: Colors.black,
                        ),
                        backgroundColor: Colors.white,
                      ),
                    )
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
