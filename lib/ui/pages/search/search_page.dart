import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:guest5stars/locale.dart';
import 'package:guest5stars/ui/pages/search/widgets/search_form.dart';
import 'package:guest5stars/ui/widgets/body_container.dart';
import 'package:guest5stars/ui/widgets/custom_app_bar.dart';
import 'package:guest5stars/ui/widgets/unfocus.dart';

@RoutePage()
class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Unfocus(
      child: Scaffold(
        appBar: CustomAppBar(title: S.of(context).dataRetrieval),
        body: SizedBox(
          height: double.infinity,
          child: BodyContainer(child: SearchForm()),
        ),
      ),
    );
  }
}
