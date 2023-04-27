import 'package:cloud_me_v2/core/controller/json_controller/json_save.dart';
import 'package:cloud_me_v2/core/util/calculations/calculation.dart';
import 'package:cloud_me_v2/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../../../core/data/db_abstract.dart';
import '../../../../../../core/data/sqlflite/sql_db.dart';
import '../../../../../domain/usecase/db/db_config_usecase.dart';
import '../../../../modules/database_module/db_config_controller.dart';
import '../../../../modules/database_module/do_congig_module.dart';
import '../../../../modules/notifier/error/error_notifier_container.dart';


class DbConfig extends StatefulWidget {
  const DbConfig({Key? key}) : super(key: key);

  @override
  _ConfigurationPageState createState() => _ConfigurationPageState();
}

class _ConfigurationPageState extends State<DbConfig> {
  final _formKey = GlobalKey<FormState>();
  final _ipController = TextEditingController();
  final _portController = TextEditingController();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _dbNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Configuration"),
      ),
      body: CustomNotifier(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: _ipController,
                  decoration: const InputDecoration(labelText: 'IP Address'),
                  validator: (value) {
                    if (value?.isEmpty??true) {
                      return 'Please enter an IP Address';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _portController,
                  decoration: const InputDecoration(labelText: 'Port'),
                  validator: (value) {
                    if (value?.isEmpty??true) {
                      return 'Please enter a Port';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _usernameController,
                  decoration: const InputDecoration(labelText: 'Username'),
                  validator: (value) {
                    if (value?.isEmpty??true) {
                      return 'Please enter a username';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _passwordController,
                  decoration: const InputDecoration(labelText: 'Password'),
                  obscureText: true,
                  validator: (value) {
                    if (value?.isEmpty??true) {
                      return 'Please enter a password';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _dbNameController,
                  decoration: const InputDecoration(labelText: 'Database Name'),
                  validator: (value) {
                    if (value?.isEmpty??true) {
                      return 'Please enter a database name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                VxNotifier(
                  mutations: {
                    DBCongigMutation:(ctx, store, {status}){
                      if(status == VxStatus.success){

                      }
                    },
                  },
                  child: MaterialButton(
                    onPressed:(_formKey.currentState?.validate()??false)? () async{
                      await sl<GetDBController>()(data: ConfigData(DBType.msql,DBConnectionParams(
                          _ipController.text,
                          _portController.text.parseInt!,
                          _usernameController.text,
                          _passwordController.text,
                          _dbNameController.text
                      )));

                    }:null,
                    child: const Text("Configure"),
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
