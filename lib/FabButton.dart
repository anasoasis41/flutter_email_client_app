import 'package:flutter/material.dart';
import 'package:flutter_email_client_app/Provider.dart';
import 'package:flutter_email_client_app/manager/CounterManager.dart';



class FabButton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    CounterManager manager = Provider.of(context).fetch(CounterManager);

    return FloatingActionButton(
      onPressed: manager.increment,
    );
  }
}
