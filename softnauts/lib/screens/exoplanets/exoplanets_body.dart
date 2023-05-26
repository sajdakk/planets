import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:softnauts/softnauts.dart';

import 'cubit/exoplanets_cubit.dart';

class ExoplanetsBody extends StatefulWidget {
  const ExoplanetsBody({
    super.key,
    required this.state,
  });

  final ExoplanetsLoadedState state;

  @override
  State<ExoplanetsBody> createState() => EexoplanetsBodyState();
}

class EexoplanetsBodyState extends State<ExoplanetsBody> {
  late List<Exoplanets> _availableExoplanets = widget.state.exoplanetsList;
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
      child: _buildList(),
    );
  }

  Widget _buildList() {
    _availableExoplanets = widget.state.exoplanetsList.toList();

    if (_availableExoplanets.isEmpty) {
      return const SizedBox();
    }

    return ListView.builder(
      controller: _scrollController,
      physics: const AlwaysScrollableScrollPhysics(),
      itemBuilder: _exoplanetsCardBuilder,
      itemCount: _availableExoplanets.length,
    );
  }

  Widget _exoplanetsCardBuilder(BuildContext _, int index) {
    final Exoplanets exoplanets = _availableExoplanets[index];

    return Card(
      child: Container(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          exoplanets.name,
          style: SnTextStyles.dMSansSmall14.copyWith(
            color: SnColors.textColor,
          ),
        ),
      ),
    );
  }

  Future<void> _onScroll(BuildContext context) async {
    final double maxScroll = _scrollController.position.maxScrollExtent;
    final double currentScroll = _scrollController.position.pixels;

    if (maxScroll - currentScroll == 0 && !_gettingMoreItems && _scrollDown) {
      BotToast.showLoading(backgroundColor: Colors.transparent);
      _gettingMoreItems = true;
      final ExoplanetsCubit cubit = context.read();

      await Future.wait<void>(
        <Future<void>>[
          cubit.getMoreExoplanets(),
          Future<dynamic>.delayed(const Duration(milliseconds: 50), () {}),
        ],
      );

      BotToast.closeAllLoading();
      _gettingMoreItems = false;
    }
  }
}
