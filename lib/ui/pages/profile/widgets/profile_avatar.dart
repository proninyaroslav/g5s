import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

const _kSize = 104.0;

class ProfileAvatar extends StatelessWidget {
  final String fullName;
  final String? photoUrl;

  const ProfileAvatar({super.key, required this.fullName, this.photoUrl});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      width: _kSize,
      height: _kSize,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            blurRadius: 2.0,
            spreadRadius: 0.0,
            offset: Offset(0.0, 2.0),
            color: Color.from(alpha: 0.15, red: 0, green: 0, blue: 0),
          ),
        ],
        color: colorScheme.primary,
      ),
      child: photoUrl == null
          ? _Placeholder(fullName: fullName)
          : ClipOval(
              child: CachedNetworkImage(
                imageUrl: photoUrl!,
                width: _kSize,
                height: _kSize,
                fit: BoxFit.cover,
                errorWidget: (context, url, error) =>
                    _Placeholder(fullName: fullName),
                placeholder: (context, url) => _Placeholder(fullName: fullName),
              ),
            ),
    );
  }
}

class _Placeholder extends StatelessWidget {
  final String fullName;

  const _Placeholder({super.key, required this.fullName});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Center(
      child: Text(
        _toInitials(fullName),
        style: Theme.of(context).textTheme.headlineLarge!.copyWith(
          fontWeight: FontWeight.w600,
          color: colorScheme.onPrimary,
        ),
      ),
    );
  }

  String _toInitials(String fullName) =>
      RegExp(r'\b(\w)').allMatches(fullName).map((m) => m.group(0)).join('');
}
