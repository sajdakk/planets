import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:planets/planets.dart';

import 'cubit/activities_cubit.dart';
import 'widgets/_widgets.dart';

class ActivitiesBody extends StatefulWidget {
  const ActivitiesBody({
    super.key,
    required this.state,
  });

  final ActivitiesLoadedState state;

  @override
  State<ActivitiesBody> createState() => ActivitiesBodyState();
}

class ActivitiesBodyState extends State<ActivitiesBody> {
  final ScrollController _scrollController = ScrollController();

  bool _gettingMoreProducts = false;
  bool _scrollDown = false;

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();

    super.dispose();
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
      child: Stack(
        children: [
          ListView.separated(
            controller: _scrollController,
            physics: const AlwaysScrollableScrollPhysics(),
            itemBuilder: (BuildContext _, int index) {
              final Activity activity = widget.state.activitiesList[index];
              return ActivityRow(
                activity: activity,
                favoritesIds: widget.state.favoritesIds,
                onHeartPressed: _onHeartPressed,
              );
            },
            itemCount: widget.state.activitiesList.length,
            separatorBuilder: (BuildContext _, int __) => const Divider(
              color: Colors.deepPurple,
              height: 1.0,
            ),
          ),
          Positioned.fill(
            child: SafeArea(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: Visibility(
                    visible: _gettingMoreProducts,
                    child: const CircularProgressIndicator(),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _onHeartPressed(int id) {
    final ActivitiesCubit cubit = context.read();

    if (widget.state.favoritesIds.contains(id)) {
      cubit.removeActivities(id);

      return;
    }

    cubit.addActivities(id);
  }

  Future<void> _onScroll() async {
    final double maxScroll = _scrollController.position.maxScrollExtent;
    final double currentScroll = _scrollController.position.pixels;
    if (maxScroll - currentScroll != 0 || _gettingMoreProducts || !_scrollDown) {
      return;
    }

    _gettingMoreProducts = true;
    final ActivitiesCubit cubit = context.read();
    await cubit.getMoreActivities();
    _gettingMoreProducts = false;
  }
}
