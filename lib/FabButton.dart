import 'package:flutter/material.dart';
import 'package:flutter_email_client_app/UglyProvider.dart';



class FabButton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var state = UglyProvider.of(context);

    return FloatingActionButton(
      onPressed: state.increment,
    );
  }
}
