import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:planets/planets.dart';

import 'cubit/exoplanets_cubit.dart';

class ExoplanetsBody extends StatefulWidget {
  const ExoplanetsBody({
    super.key,
    required this.state,
  });

  final ExoplanetsLoadedState state;

  @override
  State<ExoplanetsBody> createState() => ExoplanetsBodyState();
}

class ExoplanetsBodyState extends State<ExoplanetsBody> {
  late List<Exoplanet> _availableExoplanets = widget.state.exoplanetsList;
  final ScrollController _scrollController = ScrollController();

  bool _gettingMoreItems = false;
  bool _scrollDown = false;

  @override
  void didUpdateWidget(covariant ExoplanetsBody oldWidget) {
    if (oldWidget.state.exoplanetsList != widget.state.exoplanetsList) {
      _availableExoplanets = widget.state.exoplanetsList.toList();
    }
    super.didUpdateWidget(oldWidget);
  }

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
        if (direction == ScrollDirection.reverse) {
          _scrollDown = true;
        } else if (direction == ScrollDirection.forward) {
          _scrollDown = false;
        }

        setState(() {});

        return true;
      },
      child: Stack(
        children: [
          ListView.builder(
            controller: _scrollController,
            physics: const AlwaysScrollableScrollPhysics(),
            itemBuilder: (BuildContext _, int index) {
              final Exoplanet exoplanets = _availableExoplanets[index];

              return Card(
                child: Container(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    exoplanets.displayName,
                    style: MyTextStyles.dMSansSmall14.copyWith(
                      color: MyColors.textColor,
                    ),
                  ),
                ),
              );
            },
            itemCount: _availableExoplanets.length,
          ),
          Positioned.fill(
            child: SafeArea(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: Visibility(
                    visible: _gettingMoreItems,
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

  Future<void> _onScroll() async {
    final double maxScroll = _scrollController.position.maxScrollExtent;
    final double currentScroll = _scrollController.position.pixels;
    if (maxScroll - currentScroll != 0 || _gettingMoreItems || !_scrollDown) {
      return;
    }

    _gettingMoreItems = true;
    final ExoplanetsCubit cubit = context.read();
    await cubit.getMoreExoplanets();
    _gettingMoreItems = false;
  }
}
