import 'package:flutter/material.dart';
import 'package:guest5stars/ui/pages/search/model/review_item_data.dart';
import 'package:guest5stars/ui/widgets/divider_card.dart';
import 'package:guest5stars/ui/widgets/rating_bar.dart';
import 'package:intl/intl.dart';

class ReviewItem extends StatelessWidget {
  final ReviewItemData item;

  const ReviewItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final locale = Localizations.localeOf(context).languageCode;
    final dateFormat = DateFormat.yMMMMd(locale);

    final ReviewItemData(:description, :timestamp, :rating) = item;

    return DividerCard(
      constraints: BoxConstraints(minHeight: 68.0),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          spacing: 8.0,
          children: [
            Expanded(child: Text(description)),

            Column(
              mainAxisSize: MainAxisSize.min,
              spacing: 4.0,
              children: [
                Text(
                  dateFormat.format(timestamp.toLocal()),
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                ),
                RatingBar(value: rating, starSize: 16.0),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
