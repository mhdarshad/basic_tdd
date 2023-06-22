import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_me_v2/rought_genrator.dart';
import 'package:cloud_me_v2/tdd/presentaion/view/screens/home/home_controller.dart';

import '../../../../../core/util/presentation/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
class CardTrainingsWidget extends StatefulWidget {
  final String url;
  final Widget containt;
  const CardTrainingsWidget({Key? key, required this.url, required this.containt}) : super(key: key);

  @override
  _CardTrainingsWidgetState createState() => _CardTrainingsWidgetState();
}

class _CardTrainingsWidgetState extends State<CardTrainingsWidget> {

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        navigate.push(context, name: Routename.checkout);
      },
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(16, 8, 16, 8),
        child: Container(
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            boxShadow: [
              BoxShadow(
                blurRadius: 8,
                color: FlutterFlowTheme.of(context).secondaryText,
                offset: const Offset(0, 4),
              )
            ],
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: FlutterFlowTheme.of(context).primaryBackground,
              width: 1,
            ),
          ),
          child: Container(
            height: 220,
            child: Stack(
              children: [
                // Hero(
                //   tag: 'italyImage',
                //   transitionOnUserGestures: true,
                //   child: ClipRRect(
                //     borderRadius: BorderRadius.circular(12),
                //     child: CachedNetworkImage(
                //       width: double.infinity,
                //       errorWidget: (context,data,_){
                //         return  Image.asset(widget.url);
                //       },
                //       fit: BoxFit.cover, imageUrl:'assets/dummy.jpg',
                //     ),
                //   ),
                // ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: CachedNetworkImage(
                    width: double.infinity,
                    errorWidget: (context,data,_){
                      return  Image.asset(widget.url);
                    },
                    fit: BoxFit.cover, imageUrl:'assets/dummy.jpg',
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(0, 1),
                  child: Container(
                    height: 100,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0x0014181B), Color(0x9B14181B), Colors.black],
                        stops: [0, 0.4, 0.7],
                        begin: AlignmentDirectional(0, -1),
                        end: AlignmentDirectional(0, 1),
                      ),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(12),
                        bottomRight: Radius.circular(12),
                        topLeft: Radius.circular(0),
                        topRight: Radius.circular(0),
                      ),
                    ),
                    child: widget.containt,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
class CardListContaint extends StatelessWidget {
  final String title;
  final String discription;
  final String price;
  const CardListContaint({
    super.key, required this.title, required this.discription, required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(18))),
      color: FlutterFlowTheme.of(context).secondaryBackground,
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(16, 12, 16, 12),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: CachedNetworkImage(
                width: 100,
                errorWidget: (context,data,_){
                  return  Container();
                },
                fit: BoxFit.cover, imageUrl:'assets/dummy.jpg',
              ),
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: FlutterFlowTheme.of(context).bodyLarge,
                  ),
                  Text(
                    discription,
                    style: FlutterFlowTheme.of(context).bodySmall.override(
                      fontFamily: 'Readex Pro',
                      color: FlutterFlowTheme.of(context).secondaryText,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 32,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).primaryText,
                borderRadius: BorderRadius.circular(12),
              ),
              alignment: const AlignmentDirectional(0, 0),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                child: Text(
                  price,
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Readex Pro',
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}