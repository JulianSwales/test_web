import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text('Customer'),
          ),
          body: Text('Customer')),
    );
  }
}