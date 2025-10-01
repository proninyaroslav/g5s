import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:guest5stars/icons/app_icons.dart';
import 'package:guest5stars/locale.dart';
import 'package:guest5stars/ui/pages/profile/widgets/profile_avatar.dart';
import 'package:guest5stars/ui/router/app_router.dart';

class ProfileCard extends StatefulWidget {
  final VoidCallback onLogout;

  const ProfileCard({super.key, required this.onLogout});

  @override
  State<ProfileCard> createState() => _ProfileCardState();
}

class _ProfileCardState extends State<ProfileCard> {
  final _profileName = 'Jon Mackleyn';
  final _profileEmail = 'jon.mackleyn@gmail.com';
  final _photoUrl = null;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      color: Theme.of(context).colorScheme.surfaceContainer,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Spacer(),

            ProfileAvatar(fullName: _profileName, photoUrl: _photoUrl),

            SizedBox(height: 18.0),

            Text(
              _profileName,
              style: Theme.of(
                context,
              ).textTheme.headlineMedium!.copyWith(fontWeight: FontWeight.w600),
            ),

            SizedBox(height: 4.0),

            Text(
              _profileEmail,
              style: TextStyle(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),

            Spacer(),

            SizedBox(
              width: double.infinity,
              child: FilledButton.icon(
                onPressed: () => context.navigateTo(AddRecordRoute()),
                label: Text(S.of(context).addARecord),
                icon: Icon(AppIcons.accept),
              ),
            ),

            SizedBox(height: 10.0),

            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: widget.onLogout,
                label: Text(S.of(context).goOut),
                icon: Icon(AppIcons.exit),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
