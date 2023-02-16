import '../../../../core/data/db_abstract.dart';
import '../../../../core/util/presentation/Events/logic_event_handler.dart';
import '../../../domain/usecase/db/db_config_usecase.dart';
import 'do_congig_module.dart';

class   GetDBController extends LogicHandler<BDConfigUseCase, ConfigData> {
  BDConfigUseCase usecase;

  GetDBController(this.usecase) : super(usecase);
  @override
  call({required ConfigData data}) {
    // TODO: implement call
    return DBCongigMutation(usecase, data);
  }

}

class ConfigData {
  final DBType dbType;
  final DBConnectionParams? dbdata;
 const ConfigData(this.dbType, [this.dbdata]);}