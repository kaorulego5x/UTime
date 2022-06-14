//一旦処理の実装用にここにプロバイダー置いときます
//別でちゃんとプロバイダーつくるならこれを移植しといてくださいー
import 'package:riverpod/riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

var yearProvider = StateProvider<String>((ref) {
  return "1s1";
});
