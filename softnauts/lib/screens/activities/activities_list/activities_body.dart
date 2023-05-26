import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:softnauts/models/activities/activities.dart';
import 'package:softnauts/screens/activities/activities_details/activities_details_screen.dart';

import 'cubit/activities_cubit.dart';

class ActivitiesBody extends StatefulWidget {
  const ActivitiesBody({
    super.key,
    required this.state,
  });

  final ActivitiesLoadedState state;

  @override
  State<ActivitiesBody> createState() => AactivitiesBodyState();
}

class AactivitiesBodyState extends State<ActivitiesBody> {
  late List<Activities> _availableActivities = widget.state.activitiesList;
  final ScrollController _scrollController = ScrollController();

  bool _gettingMoreProducts = false;
  bool _scrollDown = false;

  @override
  void didUpdateWidget(covariant ActivitiesBody oldWidget) {
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        NotificationListener<UserScrollNotification>(
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
        ),
      ],
    );
  }

  Widget _buildList(BuildContext context) {
    _availableActivities = widget.state.activitiesList.toList();

    if (_availableActivities.isEmpty) {
      return const SizedBox();
    }

    return Expanded(
      child: ListView.builder(
        controller: _scrollController,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (BuildContext _, int index) => _activitiesCardBuilder(index, context),
        itemCount: _availableActivities.length,
      ),
    );
  }

  Widget _activitiesCardBuilder(int index, BuildContext context) {
    final Activities activities = _availableActivities[index];
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ActivitiesDetailsScreen(
            id: activities.id,
          ),
        ),
      ),
      child: Card(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              IconButton(
                onPressed: () {
                  ActivitiesCubit cubit = context.read();

                  if (widget.state.favouritesIds.contains(activities.id)) {
                    cubit.removeActivities(activities.id);

                    return;
                  }

                  cubit.addActivities(activities.id);
                },
                icon: widget.state.favouritesIds.contains(activities.id)
                    ? const Icon(Icons.favorite_rounded)
                    : const Icon(Icons.favorite_outline_rounded),
              ),
              Expanded(
                child: Text(
                  activities.displayName,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _onScroll(BuildContext context) async {
    final double maxScroll = _scrollController.position.maxScrollExtent;
    final double currentScroll = _scrollController.position.pixels;

    if (maxScroll - currentScroll == 0 && !_gettingMoreProducts && _scrollDown) {
      BotToast.showLoading(backgroundColor: Colors.transparent);
      _gettingMoreProducts = true;
      final ActivitiesCubit cubit = context.read();

      await Future.wait<void>(
        <Future<void>>[
          cubit.getMoreActivities(),
          Future<dynamic>.delayed(const Duration(milliseconds: 100), () {}),
        ],
      );

      BotToast.closeAllLoading();
      _gettingMoreProducts = false;
    }
  }
}
