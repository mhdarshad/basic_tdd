import 'package:rising_gym/core/usecases/usecase.dart';
import 'package:rising_gym/rought_genrator.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../../../core/util/presentation/flutter_flow/flutter_flow_theme.dart';
import '../../../../../../injection_container.dart';
import '../../../../../domain/modle/vx_store.dart';
import '../../../../modules/plans/plans_list_consumer.dart';
import '../../../../modules/plans/plans_list_controller.dart';
import '../../../widgets/cards/project_plans_card.dart';
import '../../plan_list/plans_listing.dart';

class PlanSelectList extends StatefulWidget {
  const PlanSelectList( {Key? key}) : super(key: key);

  @override
  State<PlanSelectList> createState() => _PlanSelectListState();
}

class _PlanSelectListState extends State<PlanSelectList> {
  @override
  void initState() {
    // TODO: implement initState
    sl<PlansListEvent>()(data: NoPrams());
  }
  @override
  Widget build(BuildContext context) {
    return PlansListContainer(
      builder: (BuildContext context, ProjectStore store, VxStatus state) {
        return ListView(
          children:  store.plans.map((e) =>
              PlansListing(title: e.groupName??'', children: e.plans.map((e) =>  GestureDetector(onTap:() {
                store.selectedPlans = e;
                // if(e.register_trainer==1){
                //   navigate.push(context,
                //       name: Routename.trainers,
                //       qparms: {'item_code': e.itemCode.toString()},
                //       parms: stored.pathParameters ?? {});
                // }else{
                  navigate.push(context, name: Routename.checkout);
                // }
              },child: CardListContaint(title:e.itemDescription, discription: e.itemDescription, price: e.itemPrice.toString(), image: e.image??'',))).toList(),),
          ).toList() ,
        );
      },

    );
  }
}

class CardTrainingListDataWidget extends StatelessWidget {
  final String title;
  final String price;
  const CardTrainingListDataWidget({
    super.key, required this.title, required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: FlutterFlowTheme.of(context).bodyMedium.override(
              fontFamily: 'Readex Pro',
              color: FlutterFlowTheme.of(context).secondaryText,
            ),
          ),
          Text(
            price,
            style: FlutterFlowTheme.of(context).bodyMedium.override(
              fontFamily: 'Readex Pro',
              color: FlutterFlowTheme.of(context).secondaryText,
            ),
          ),
        ],
      ),
    );
  }
}