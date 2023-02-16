import 'package:flutter/material.dart';


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
      body: Padding(
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
              MaterialButton(
                onPressed: () {
                  if (_formKey.currentState?.validate()??false) {
                    // Perform configuration here

                  }
                },
                child: const Text("Configure"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
