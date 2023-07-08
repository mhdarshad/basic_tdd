
import '../../../domain/entities/vx_store.dart';
import 'package:velocity_x/velocity_x.dart';

class TransactionSucsessMutation extends VxMutation<ProjectStore>
    {
  String err = "";

  TransactionSucsessMutation();

  @override
  perform() async {
    print("hello ");
  }

  @override
  onException(e, StackTrace s) {

  }
}