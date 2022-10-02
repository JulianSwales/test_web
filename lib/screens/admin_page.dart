import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class AdminPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text('Admin'),
          ),
          body: Column(
            children: [
              Center(child: Text('Admin')),
              TextButton(
                  onPressed: () {
                    //context.go('claims');
                    context.goNamed('claims');
                  },
                  child: Text('Claims System'))
            ],
          )),
    );
  }
}
