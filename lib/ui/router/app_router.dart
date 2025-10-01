import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:guest5stars/ui/nav_page.dart';
import 'package:guest5stars/ui/pages/add_record/add_record_page.dart';
import 'package:guest5stars/ui/pages/payments/payments_page.dart';
import 'package:guest5stars/ui/pages/profile/profile_page.dart';
import 'package:guest5stars/ui/pages/search/search.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen|Page,Route')
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => const RouteType.adaptive();

  @override
  List<AutoRoute> get routes => [
    AutoRoute(
      page: NavRoute.page,
      initial: true,
      children: [
        AutoRoute(page: ProfileRoute.page),
        AutoRoute(page: SearchRoute.page),
        AutoRoute(page: PaymentsRoute.page),
        AutoRoute(page: AddRecordRoute.page),
      ],
    ),
    AutoRoute(page: InputDateRoute.page),
    AutoRoute(page: InputCountryRoute.page),
    AutoRoute(page: SearchPaymentRoute.page),
    AutoRoute(page: FullHistoryPaymentRoute.page),
    AutoRoute(page: RentalHistoryRoute.page),
  ];
}
