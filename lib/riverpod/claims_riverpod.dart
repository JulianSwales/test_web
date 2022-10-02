//import 'package:clia/services/claims_service.dart';
//import 'package:easy_table/easy_table.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
//import 'package:supabase_flutter/supabase_flutter.dart';

int _currentRecCount = 6000;

final currentRecCountProvider = Provider.autoDispose<int>((ref) {
  return _currentRecCount;
});

final currentFromRecProvider = StateProvider.autoDispose<int>((ref) {
  ref.watch(currentRecPerPageProvider);
  ref.watch(currentPageProvider);
  return ((ref.read(currentPageProvider) - 1) *
              ref.read(currentRecPerPageProvider))
          .toInt() +
      1;
});
final currentPageProvider = StateProvider.autoDispose<int>((ref) => 1);
final currentToRecProvider = Provider.autoDispose<int>((ref) {
  ref.watch(currentRecPerPageProvider);
  ref.watch(currentPageProvider);
  return ref.read(currentPageProvider) * ref.read(currentRecPerPageProvider);
});
final currentRecPerPageProvider = StateProvider.autoDispose<int>((ref) => 25);
final currentSearchProvider = StateProvider.autoDispose<String?>((ref) => null);
