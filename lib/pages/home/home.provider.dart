import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:otc/apis/apis.dart';

class HomeNotifier extends StateNotifier<HomeModel> {
  HomeNotifier() : super(const HomeModel()) {
    update();
  }

  update() async {
    final defaultRate = await apis.app.defaultRate();

    state = state.copyWith(
      defaultRate: defaultRate,
    );
  }
}

final homeProvider = StateNotifierProvider<HomeNotifier, HomeModel>((ref) {
  return HomeNotifier();
});

class HomeModel {
  final num defaultRate;

  const HomeModel({
    this.defaultRate = 0,
  });

  HomeModel copyWith({
    num? defaultRate,
  }) {
    return HomeModel(
      defaultRate: defaultRate ?? this.defaultRate,
    );
  }
}
