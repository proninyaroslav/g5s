import 'package:flutter/material.dart';
import 'package:guest5stars/gen/assets.gen.dart';
import 'package:guest5stars/icons/app_icons.dart';
import 'package:guest5stars/locale.dart';
import 'package:guest5stars/ui/theme.dart';
import 'package:svg_flutter/svg.dart';

enum LoginType { vk, mail }

class LoginForm extends StatelessWidget {
  final ValueChanged<LoginType> onLogin;

  const LoginForm({super.key, required this.onLogin});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      color: Theme.of(context).colorScheme.surfaceContainer,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 12.0),
        child: Column(
          children: [
            Spacer(),

            ShaderMask(
              blendMode: BlendMode.srcIn,
              shaderCallback: (Rect bounds) {
                return AppPalette.lightGradient.createShader(bounds);
              },
              child: Icon(AppIcons.person, size: 100),
            ),

            SizedBox(height: 50.0),

            Text(
              S.of(context).createAccountDescription,
              style: Theme.of(context).textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),

            Spacer(),

            SizedBox(
              width: double.infinity,
              child: FilledButton.icon(
                onPressed: () => onLogin(LoginType.vk),
                label: Text(S.of(context).entranceVkId),
                icon: SvgPicture.asset(
                  Assets.images.vk,
                  width: 24.0,
                  colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
                ),
              ),
            ),

            SizedBox(height: 16.0),

            SizedBox(
              width: double.infinity,
              child: FilledButton.icon(
                onPressed: () => onLogin(LoginType.mail),
                label: Text(S.of(context).entranceMailRu),
                icon: SvgPicture.asset(
                  Assets.images.mailRu,
                  width: 24.0,
                  colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
