import 'package:flutter/material.dart';
import 'package:planets/planets.dart';
import 'package:planets/screens/activity/activity_details/activity_details_screen.dart';

class ActivityRow extends StatelessWidget {
  const ActivityRow({
    super.key,
    required this.activity,
    required this.favoritesIds,
    required this.onHeartPressed,
  });

  final Activity activity;
  final Set<int> favoritesIds;
  final void Function(int) onHeartPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      key: ValueKey<String>('${activity.id}+${favoritesIds.contains(activity.id)}'),
      highlightColor: Colors.transparent,
      splashColor: Colors.purple.withOpacity(0.2),
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (BuildContext _) => ActivityDetailsScreen(
            id: activity.id,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: Row(
          children: <Widget>[
            IconButton(
              onPressed: () => onHeartPressed(activity.id),
              icon: favoritesIds.contains(activity.id)
                  ? const Icon(
                      Icons.favorite_rounded,
                      color: Colors.purple,
                    )
                  : const Icon(
                      Icons.favorite_outline_rounded,
                      color: MyColors.textColor,
                    ),
            ),
            Expanded(
              child: Text(
                activity.displayName,
                overflow: TextOverflow.ellipsis,
                style: MyTextStyles.dMSansSmall14.copyWith(
                  color: MyColors.textColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
