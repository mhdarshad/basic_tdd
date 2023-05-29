import 'package:flutter/material.dart';

import '../../../../../../core/util/presentation/flutter_flow/flutter_flow_theme.dart';
import '../../../widgets/cards/project_plans_card.dart';
import '../../../widgets/expansion_widget/project_custome_expansion.dart';

class PlanSelectList extends StatefulWidget {
  const PlanSelectList( {Key? key}) : super(key: key);

  @override
  State<PlanSelectList> createState() => _PlanSelectListState();
}

class _PlanSelectListState extends State<PlanSelectList> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children:   [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ProjectExpansion(
            title: '2023 OFFERS',
            discription:Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                CardTrainingListDataWidget(title: 'Early summer offers -14 classes', price: 'AED 640',),
                CardTrainingListDataWidget(title: 'Early summer offers -24 classes', price: 'AED 1,050.00',),
              ],
            ),
            expandedChild:  Column(
              mainAxisSize: MainAxisSize.max,
              children: const [
                CardTrainingsWidget(url: 'https://risinggym.com/wp-content/uploads/2022/09/class-img-1.jpg', containt: CardListContaint(title: 'BUILD - A BETTER VERSION OF YOU', discription: 'Watch your muscles grow through body resistance and free weight training.', price: '220 AED',),),
                CardTrainingsWidget(url: 'https://risinggym.com/wp-content/uploads/2022/09/class-img-1.jpg', containt: CardListContaint(title: 'BUILD - A BETTER VERSION OF YOU', discription: 'Watch your muscles grow through body resistance and free weight training.', price: '220 AED',),),
                CardTrainingsWidget(url: 'https://risinggym.com/wp-content/uploads/2022/09/class-img-1.jpg', containt: CardListContaint(title: 'BUILD - A BETTER VERSION OF YOU', discription: 'Watch your muscles grow through body resistance and free weight training.', price: '220 AED',),),
                CardTrainingsWidget(url: 'https://risinggym.com/wp-content/uploads/2022/09/class-img-1.jpg', containt: CardListContaint(title: 'BUILD - A BETTER VERSION OF YOU', discription: 'Watch your muscles grow through body resistance and free weight training.', price: '220 AED',),),
                CardTrainingsWidget(url: 'https://risinggym.com/wp-content/uploads/2022/09/class-img-1.jpg', containt: CardListContaint(title: 'BUILD - A BETTER VERSION OF YOU', discription: 'Watch your muscles grow through body resistance and free weight training.', price: '220 AED',),),
                CardTrainingsWidget(url: 'https://risinggym.com/wp-content/uploads/2022/09/class-img-1.jpg', containt: CardListContaint(title: 'BUILD - A BETTER VERSION OF YOU', discription: 'Watch your muscles grow through body resistance and free weight training.', price: '220 AED',),),
              ],
            ),),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ProjectExpansion(
            title: 'KIDS PACKAGES',
            discription:Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                CardTrainingListDataWidget(title: '1 class', price: 'AED 100.00',),
                CardTrainingListDataWidget(title: '5 class package', price: 'AED 350.00',),
                CardTrainingListDataWidget(title: '12 class package', price: 'AED 600.00',),
                CardTrainingListDataWidget(title: '20 class package', price: 'AED 1,000.00',),
              ],
            ),
            expandedChild:  Column(
              mainAxisSize: MainAxisSize.max,
              children: const [
                CardTrainingsWidget(url: 'https://risinggym.com/wp-content/uploads/2022/09/class-img-1.jpg', containt: CardListContaint(title: 'BUILD - A BETTER VERSION OF YOU', discription: 'Watch your muscles grow through body resistance and free weight training.', price: '220 AED',),),
                CardTrainingsWidget(url: 'https://risinggym.com/wp-content/uploads/2022/09/class-img-1.jpg', containt: CardListContaint(title: 'BUILD - A BETTER VERSION OF YOU', discription: 'Watch your muscles grow through body resistance and free weight training.', price: '220 AED',),),
                CardTrainingsWidget(url: 'https://risinggym.com/wp-content/uploads/2022/09/class-img-1.jpg', containt: CardListContaint(title: 'BUILD - A BETTER VERSION OF YOU', discription: 'Watch your muscles grow through body resistance and free weight training.', price: '220 AED',),),
                CardTrainingsWidget(url: 'https://risinggym.com/wp-content/uploads/2022/09/class-img-1.jpg', containt: CardListContaint(title: 'BUILD - A BETTER VERSION OF YOU', discription: 'Watch your muscles grow through body resistance and free weight training.', price: '220 AED',),),
                CardTrainingsWidget(url: 'https://risinggym.com/wp-content/uploads/2022/09/class-img-1.jpg', containt: CardListContaint(title: 'BUILD - A BETTER VERSION OF YOU', discription: 'Watch your muscles grow through body resistance and free weight training.', price: '220 AED',),),
                CardTrainingsWidget(url: 'https://risinggym.com/wp-content/uploads/2022/09/class-img-1.jpg', containt: CardListContaint(title: 'BUILD - A BETTER VERSION OF YOU', discription: 'Watch your muscles grow through body resistance and free weight training.', price: '220 AED',),),

              ],
            ),),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ProjectExpansion(
            title: 'Open Gym',
            discription:Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                CardTrainingListDataWidget(title: '1 class', price: 'AED 100.00',),
                CardTrainingListDataWidget(title: '5 class package', price: 'AED 350.00',),
                CardTrainingListDataWidget(title: '12 class package', price: 'AED 600.00',),
                CardTrainingListDataWidget(title: '20 class package', price: 'AED 1,000.00',),
              ],
            ),
            expandedChild:  Column(
              mainAxisSize: MainAxisSize.max,
              children: const [
                CardTrainingsWidget(url: 'https://risinggym.com/wp-content/uploads/2022/09/class-img-1.jpg', containt: CardListContaint(title: 'BUILD - A BETTER VERSION OF YOU', discription: 'Watch your muscles grow through body resistance and free weight training.', price: '220 AED',),),
                CardTrainingsWidget(url: 'https://risinggym.com/wp-content/uploads/2022/09/class-img-1.jpg', containt: CardListContaint(title: 'BUILD - A BETTER VERSION OF YOU', discription: 'Watch your muscles grow through body resistance and free weight training.', price: '220 AED',),),
                CardTrainingsWidget(url: 'https://risinggym.com/wp-content/uploads/2022/09/class-img-1.jpg', containt: CardListContaint(title: 'BUILD - A BETTER VERSION OF YOU', discription: 'Watch your muscles grow through body resistance and free weight training.', price: '220 AED',),),
                CardTrainingsWidget(url: 'https://risinggym.com/wp-content/uploads/2022/09/class-img-1.jpg', containt: CardListContaint(title: 'BUILD - A BETTER VERSION OF YOU', discription: 'Watch your muscles grow through body resistance and free weight training.', price: '220 AED',),),
                CardTrainingsWidget(url: 'https://risinggym.com/wp-content/uploads/2022/09/class-img-1.jpg', containt: CardListContaint(title: 'BUILD - A BETTER VERSION OF YOU', discription: 'Watch your muscles grow through body resistance and free weight training.', price: '220 AED',),),
                CardTrainingsWidget(url: 'https://risinggym.com/wp-content/uploads/2022/09/class-img-1.jpg', containt: CardListContaint(title: 'BUILD - A BETTER VERSION OF YOU', discription: 'Watch your muscles grow through body resistance and free weight training.', price: '220 AED',),),

              ],
            ),),
        ),
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