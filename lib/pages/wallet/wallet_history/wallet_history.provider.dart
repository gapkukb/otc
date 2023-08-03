import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:otc/apis/apis.dart';
import 'package:otc/constants/currency.dart';

enum FilterType { topup, withdraw }

enum FilterTime { week, month, quarter, halfYear }

enum FilterState { all, done, pendding }

class Filters {
  final FilterType type;
  final FilterTime time;
  final FilterState status;
  final String orderId;
  final Cryptocurrency coin;

  const Filters({
    required this.type,
    required this.time,
    required this.status,
    required this.orderId,
    required this.coin,
  });

  Filters copyWith({
    FilterType? type,
    FilterTime? time,
    FilterState? status,
    String? orderId,
    Cryptocurrency? coin,
  }) {
    return Filters(
      type: type ?? this.type,
      time: time ?? this.time,
      status: status ?? this.status,
      orderId: orderId ?? this.orderId,
      coin: coin ?? this.coin,
    );
  }
}

class FilterNotifier extends StateNotifier<Filters> {
  FilterNotifier()
      : super(
          const Filters(
            coin: Cryptocurrency.USDT,
            orderId: "",
            status: FilterState.all,
            time: FilterTime.week,
            type: FilterType.topup,
          ),
        );

  update({
    FilterType? type,
    FilterTime? time,
    FilterState? status,
    String? orderId,
    Cryptocurrency? coin,
  }) {
    state = state.copyWith(
      type: type,
      time: time,
      status: status,
      orderId: orderId,
      coin: coin,
    );
  }
}

final filterProvider = StateNotifierProvider<FilterNotifier, Filters>((ref) {
  return FilterNotifier();
});

final transferHisotryProvider = FutureProvider.autoDispose<String>((ref) async {
  final filters = ref.watch(filterProvider);
  await Future.delayed(Duration(seconds: 3));
  return Future.value(filters.time.name + filters.type.name + filters.status.name + filters.orderId);
});

final blockchainHisotryProvider = FutureProvider.family<dynamic, Map<String, dynamic>>((ref, filters) async {
  print("object");
  await Future.delayed(Duration(seconds: 3));
  return [];
});
