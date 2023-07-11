import 'package:go_router/go_router.dart';
import 'package:otc/pages/home/home.dart';
import '../layout/layout.dart';

final List<RouteBase> routes = [
  ShellRoute(
    builder: layout,
    routes: [
      GoRoute(
        // name: RoutesName.home.name,
        path: '/',
        builder: (context, state) => const Home(),
      ),
    ],
  ),
];
