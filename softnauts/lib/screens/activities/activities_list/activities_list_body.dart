import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:softnauts/screens/activities/activities_details/activities_details_screen.dart';
import 'package:softnauts/softnauts.dart';

import 'cubit/activities_cubit.dart';

class ActivitiesListBody extends StatefulWidget {
  const ActivitiesListBody({
    super.key,
    required this.state,
  });

  final ActivitiesListLoadedState state;

  @override
  State<ActivitiesListBody> createState() => AactivitiesBodyState();
}

class AactivitiesBodyState extends State<ActivitiesListBody> {
  late List<Activities> _availableActivities = widget.state.activitiesList;
  final ScrollController _scrollController = ScrollController();

  bool _gettingMoreProducts = false;
  bool _scrollDown = false;

  @override
  void didUpdateWidget(covariant ActivitiesListBody oldWidget) {
    if (oldWidget.state.activitiesList != widget.state.activitiesList) {
      _availableActivities = widget.state.activitiesList.toList();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() => _onScroll(context));
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<UserScrollNotification>(
      onNotification: (UserScrollNotification notification) {
        final ScrollDirection direction = notification.direction;
        setState(() {
          if (direction == ScrollDirection.reverse) {
            _scrollDown = true;
          } else if (direction == ScrollDirection.forward) {
            _scrollDown = false;
          }
        });
        return true;
      },
      child: _buildList(context),
    );
  }

  Widget _buildList(BuildContext context) {
    _availableActivities = widget.state.activitiesList.toList();

    if (_availableActivities.isEmpty) {
      return const SizedBox();
    }

    return ListView.separated(
      controller: _scrollController,
      physics: const AlwaysScrollableScrollPhysics(),
      itemBuilder: (BuildContext _, int index) => _activitiesCardBuilder(index, context),
      itemCount: _availableActivities.length,
      separatorBuilder: (BuildContext _, int __) => const Divider(
        color: Colors.deepPurple,
        height: 1.0,
      ),
    );
  }

  Widget _activitiesCardBuilder(int index, BuildContext context) {
    final Activities activities = _availableActivities[index];

    return InkWell(
      highlightColor: Colors.transparent,
      splashColor: Colors.purple.withOpacity(0.2),
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ActivitiesDetailsScreen(
            id: activities.id,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: Row(
          children: [
            IconButton(
              onPressed: () => _onHeartPress(context, activities.id),
              icon: widget.state.favouritesIds.contains(activities.id)
                  ? const Icon(
                      Icons.favorite_rounded,
                      color: Colors.purple,
                    )
                  : const Icon(
                      Icons.favorite_outline_rounded,
                      color: SnColors.textColor,
                    ),
            ),
            Expanded(
              child: Text(
                activities.displayName,
                overflow: TextOverflow.ellipsis,
                style: SnTextStyles.dMSansSmall14.copyWith(
                  color: SnColors.textColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onHeartPress(BuildContext context, int id) {
    ActivitiesListCubit cubit = context.read();

    if (widget.state.favouritesIds.contains(id)) {
      cubit.removeActivities(id);

      return;
    }

    cubit.addActivities(id);
  }

  Future<void> _onScroll(BuildContext context) async {
    final double maxScroll = _scrollController.position.maxScrollExtent;
    final double currentScroll = _scrollController.position.pixels;

    if (maxScroll - currentScroll == 0 && !_gettingMoreProducts && _scrollDown) {
      BotToast.showLoading(backgroundColor: Colors.transparent);
      _gettingMoreProducts = true;
      final ActivitiesListCubit cubit = context.read();

      await Future.wait<void>(
        <Future<void>>[
          cubit.getMoreActivities(),
          Future<dynamic>.delayed(const Duration(milliseconds: 50), () {}),
        ],
      );

      BotToast.closeAllLoading();
      _gettingMoreProducts = false;
    }
  }
}
