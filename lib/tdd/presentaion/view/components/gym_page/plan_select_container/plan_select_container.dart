import 'package:flutter/material.dart';

import '../../../../../../core/util/presentation/flutter_flow/flutter_flow_theme.dart';
import '../../../widgets/cards/project_plans_card.dart';
import '../../../widgets/expansion_widget/project_custome_expansion.dart';
import 'plans_listing.dart';

class PlanSelectList extends StatefulWidget {
  const PlanSelectList( {Key? key}) : super(key: key);

  @override
  State<PlanSelectList> createState() => _PlanSelectListState();
}

class _PlanSelectListState extends State<PlanSelectList> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children:   const [
        PlansListing(title: '2023 OFFERS', children: [
          CardListContaint(title: 'BUILD - A BETTER VERSION OF YOU', discription: 'Watch your muscles grow through body resistance and free weight training.', price: '220 AED',),
          CardListContaint(title: 'BUILD - A BETTER VERSION OF YOU', discription: 'Watch your muscles grow through body resistance and free weight training.', price: '220 AED',),
          CardListContaint(title: 'BUILD - A BETTER VERSION OF YOU', discription: 'Watch your muscles grow through body resistance and free weight training.', price: '220 AED',),
          CardListContaint(title: 'BUILD - A BETTER VERSION OF YOU', discription: 'Watch your muscles grow through body resistance and free weight training.', price: '220 AED',),
          CardListContaint(title: 'BUILD - A BETTER VERSION OF YOU', discription: 'Watch your muscles grow through body resistance and free weight training.', price: '220 AED',),
        ],),
      ],
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