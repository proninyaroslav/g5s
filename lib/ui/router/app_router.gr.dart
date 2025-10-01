// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

/// generated route for
/// [AddRecordPage]
class AddRecordRoute extends PageRouteInfo<void> {
  const AddRecordRoute({List<PageRouteInfo>? children})
    : super(AddRecordRoute.name, initialChildren: children);

  static const String name = 'AddRecordRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const AddRecordPage();
    },
  );
}

/// generated route for
/// [FullHistoryPaymentPage]
class FullHistoryPaymentRoute
    extends PageRouteInfo<FullHistoryPaymentRouteArgs> {
  FullHistoryPaymentRoute({
    Key? key,
    required double price,
    List<PageRouteInfo>? children,
  }) : super(
         FullHistoryPaymentRoute.name,
         args: FullHistoryPaymentRouteArgs(key: key, price: price),
         initialChildren: children,
       );

  static const String name = 'FullHistoryPaymentRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<FullHistoryPaymentRouteArgs>();
      return FullHistoryPaymentPage(key: args.key, price: args.price);
    },
  );
}

class FullHistoryPaymentRouteArgs {
  const FullHistoryPaymentRouteArgs({this.key, required this.price});

  final Key? key;

  final double price;

  @override
  String toString() {
    return 'FullHistoryPaymentRouteArgs{key: $key, price: $price}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! FullHistoryPaymentRouteArgs) return false;
    return key == other.key && price == other.price;
  }

  @override
  int get hashCode => key.hashCode ^ price.hashCode;
}

/// generated route for
/// [InputCountryPage]
class InputCountryRoute extends PageRouteInfo<InputCountryRouteArgs> {
  InputCountryRoute({
    Key? key,
    required String number,
    required String date,
    List<PageRouteInfo>? children,
  }) : super(
         InputCountryRoute.name,
         args: InputCountryRouteArgs(key: key, number: number, date: date),
         initialChildren: children,
       );

  static const String name = 'InputCountryRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<InputCountryRouteArgs>();
      return InputCountryPage(
        key: args.key,
        number: args.number,
        date: args.date,
      );
    },
  );
}

class InputCountryRouteArgs {
  const InputCountryRouteArgs({
    this.key,
    required this.number,
    required this.date,
  });

  final Key? key;

  final String number;

  final String date;

  @override
  String toString() {
    return 'InputCountryRouteArgs{key: $key, number: $number, date: $date}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! InputCountryRouteArgs) return false;
    return key == other.key && number == other.number && date == other.date;
  }

  @override
  int get hashCode => key.hashCode ^ number.hashCode ^ date.hashCode;
}

/// generated route for
/// [InputDatePage]
class InputDateRoute extends PageRouteInfo<void> {
  const InputDateRoute({List<PageRouteInfo>? children})
    : super(InputDateRoute.name, initialChildren: children);

  static const String name = 'InputDateRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const InputDatePage();
    },
  );
}

/// generated route for
/// [NavPage]
class NavRoute extends PageRouteInfo<void> {
  const NavRoute({List<PageRouteInfo>? children})
    : super(NavRoute.name, initialChildren: children);

  static const String name = 'NavRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const NavPage();
    },
  );
}

/// generated route for
/// [PaymentsPage]
class PaymentsRoute extends PageRouteInfo<void> {
  const PaymentsRoute({List<PageRouteInfo>? children})
    : super(PaymentsRoute.name, initialChildren: children);

  static const String name = 'PaymentsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const PaymentsPage();
    },
  );
}

/// generated route for
/// [ProfilePage]
class ProfileRoute extends PageRouteInfo<void> {
  const ProfileRoute({List<PageRouteInfo>? children})
    : super(ProfileRoute.name, initialChildren: children);

  static const String name = 'ProfileRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ProfilePage();
    },
  );
}

/// generated route for
/// [RentalHistoryPage]
class RentalHistoryRoute extends PageRouteInfo<void> {
  const RentalHistoryRoute({List<PageRouteInfo>? children})
    : super(RentalHistoryRoute.name, initialChildren: children);

  static const String name = 'RentalHistoryRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const RentalHistoryPage();
    },
  );
}

/// generated route for
/// [SearchPage]
class SearchRoute extends PageRouteInfo<void> {
  const SearchRoute({List<PageRouteInfo>? children})
    : super(SearchRoute.name, initialChildren: children);

  static const String name = 'SearchRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SearchPage();
    },
  );
}

/// generated route for
/// [SearchPaymentPage]
class SearchPaymentRoute extends PageRouteInfo<SearchPaymentRouteArgs> {
  SearchPaymentRoute({
    Key? key,
    required double price,
    List<PageRouteInfo>? children,
  }) : super(
         SearchPaymentRoute.name,
         args: SearchPaymentRouteArgs(key: key, price: price),
         initialChildren: children,
       );

  static const String name = 'SearchPaymentRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SearchPaymentRouteArgs>();
      return SearchPaymentPage(key: args.key, price: args.price);
    },
  );
}

class SearchPaymentRouteArgs {
  const SearchPaymentRouteArgs({this.key, required this.price});

  final Key? key;

  final double price;

  @override
  String toString() {
    return 'SearchPaymentRouteArgs{key: $key, price: $price}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! SearchPaymentRouteArgs) return false;
    return key == other.key && price == other.price;
  }

  @override
  int get hashCode => key.hashCode ^ price.hashCode;
}
