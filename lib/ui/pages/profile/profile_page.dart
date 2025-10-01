import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:guest5stars/locale.dart';
import 'package:guest5stars/ui/pages/profile/widgets/login_form.dart';
import 'package:guest5stars/ui/pages/profile/widgets/profile_card.dart';
import 'package:guest5stars/ui/widgets/body_container.dart';
import 'package:guest5stars/ui/widgets/custom_app_bar.dart';

@RoutePage()
class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool _isAuth = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: S.of(context).profile),
      body: Center(
        child: BodyContainer(
          constraints: BoxConstraints(maxHeight: 412.0),
          child: AnimatedSwitcher(
            duration: Duration(milliseconds: 300),
            child: _isAuth
                ? ProfileCard(
                    key: Key('profile_card'),
                    onLogout: () {
                      // TODO: logout
                      setState(() {
                        _isAuth = false;
                      });
                    },
                  )
                : LoginForm(
                    key: Key('login_form'),
                    onLogin: (type) {
                      // TODO: login
                      setState(() {
                        _isAuth = true;
                      });
                    },
                  ),
          ),
        ),
      ),
    );
  }
}
