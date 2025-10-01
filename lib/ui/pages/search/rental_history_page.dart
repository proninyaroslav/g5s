import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:guest5stars/locale.dart';
import 'package:guest5stars/ui/pages/search/model/review_item_data.dart';
import 'package:guest5stars/ui/pages/search/widgets/review_item.dart';
import 'package:guest5stars/ui/widgets/body_container.dart';
import 'package:guest5stars/ui/widgets/custom_app_bar.dart';
import 'package:guest5stars/ui/widgets/rating_bar.dart';

@RoutePage()
class RentalHistoryPage extends StatelessWidget {
  const RentalHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: S.of(context).theStoryOfTheLease,
        leading: AutoLeadingButton(),
      ),
      body: SizedBox(
        height: double.infinity,
        child: SafeArea(
          child: BodyContainer(
            child: Column(
              children: [
                SizedBox(height: 20.0),

                Text(
                  S.of(context).averageRating,
                  style: Theme.of(context).textTheme.titleLarge,
                ),

                SizedBox(height: 14.0),

                RatingBar(value: 4),

                Divider(height: 40.0),

                _List(
                  // TODO: reviews
                  reviews: [
                    ReviewItemData(
                      id: '1',
                      description: 'Серьезные повреждения мебели',
                      rating: 1,
                      timestamp: DateTime(2020, 10, 7),
                    ),
                    ReviewItemData(
                      id: '2',
                      description:
                          'Пятна на занавесках, но все исправно. Чистота и оплата на троечку. Опаздывал.',
                      rating: 3,
                      timestamp: DateTime(2020, 8, 1),
                    ),
                    ReviewItemData(
                      id: '3',
                      description:
                          'Сделал небольшой ремонт с разрешения хозяев. Исправная оплата. Будем скучать!',
                      rating: 5,
                      timestamp: DateTime(2019, 6, 25),
                    ),
                    ReviewItemData(
                      id: '4',
                      description:
                          'В целом все удовлетворительно, были опоздания с оплатой.',
                      rating: 5,
                      timestamp: DateTime(2018, 12, 19),
                    ),
                    ReviewItemData(
                      id: '5',
                      description:
                          'Отличный и приятный арендатор! Категорически рекомендуем!',
                      rating: 5,
                      timestamp: DateTime(2017, 2, 14),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _List extends StatelessWidget {
  final List<ReviewItemData> reviews;

  const _List({super.key, required this.reviews});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      itemBuilder: (context, index) =>
          ReviewItem(key: Key(reviews[index].id), item: reviews[index]),
      separatorBuilder: (context, index) => SizedBox(height: 10.0),
      itemCount: reviews.length,
    );
  }
}
