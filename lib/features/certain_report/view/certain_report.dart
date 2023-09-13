import 'dart:async';

import 'package:antidrugs/features/navigation/bloc/appbar_bloc.dart';
import 'package:antidrugs/features/reports_list/dto/donosObj.dart';
import 'package:antidrugs/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class CertainReport extends StatefulWidget {
  const CertainReport({Key? key, required this.donos}) : super(key: key);
  final DonosObj donos;

  @override
  State<CertainReport> createState() => _CertainReportState();
}

class _CertainReportState extends State<CertainReport> {
  final _mapControllerCompleter = Completer<YandexMapController>();

  Padding CR_Divider() {
    return const Padding(
      padding: EdgeInsets.only(top: 5, bottom: 5),
      child: Divider(
        thickness: 1.5,
      ),
    );
  }

  @override
  void initState() {
    GetIt.I<AppbarBloc>().add(const AppbarAddTitle(title: 'Донос'));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
            child: Align(
              alignment: Alignment.center,
              child: Image.network(widget.donos.imgUrl), // Image
            ),
          ),
          CR_Divider(),
          Text(widget.donos.userId.toString()), //State id,
          CR_Divider(),
          Text(widget.donos.text.toString()), // state text
          CR_Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
            child: SizedBox(
              height: 200,
              child: YandexMap(
                onMapCreated: (controller) async {
                  _mapControllerCompleter.complete(controller);
                  (await _mapControllerCompleter.future).moveCamera(
                      CameraUpdate.newCameraPosition(CameraPosition(
                          target: Point(
                              longitude: widget.donos.longitude,
                              latitude: widget.donos.latitude),
                          zoom: 16)));
                },
                mapObjects: [
                  PlacemarkMapObject(
                      opacity: 1,
                      mapId: const MapObjectId('fdf'),
                      point: Point(
                          longitude: widget.donos.longitude,
                          latitude: widget.donos.latitude),
                      icon: PlacemarkIcon.single(PlacemarkIconStyle(
                        scale: 1,
                        anchor: const Offset(0.5, 0),
                        image: BitmapDescriptor.fromAssetImage(
                            Assets.png.dispose.path),
                      )))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
