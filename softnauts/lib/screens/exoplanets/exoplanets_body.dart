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
  late List<Exoplanets> _availablePosts = widget.state.exoplanetsList;
  final ScrollController _scrollController = ScrollController();

  bool _gettingMoreProducts = false;
  bool _scrollDown = false;

  @override
  void didUpdateWidget(covariant ExoplanetsBody oldWidget) {
    if (oldWidget.state.exoplanetsList != widget.state.exoplanetsList) {
      _availablePosts = widget.state.exoplanetsList.toList();
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
    return _buildBody();
  }

  Widget _buildBody() {
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
          child: Expanded(
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                children: <Widget>[
                  _buildList(),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildList() {
    _availablePosts = widget.state.exoplanetsList.toList();

    if (_availablePosts.isEmpty) {
      return const SizedBox();
    }

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: _postCardBuilder,
      itemCount: _availablePosts.length,
    );
  }

  Widget _postCardBuilder(BuildContext _, int index) {
    final Exoplanets post = _availablePosts[index];
    return Card(
      child: Container(
        padding: const EdgeInsets.all(16.0),
        child: Text(post.name),
      ),
    );
  }

  Future<void> _onScroll(BuildContext context) async {
    final double maxScroll = _scrollController.position.maxScrollExtent;
    final double currentScroll = _scrollController.position.pixels;

    if (maxScroll - currentScroll == 0 && !_gettingMoreProducts && _scrollDown) {
      BotToast.showLoading(backgroundColor: Colors.transparent);
      _gettingMoreProducts = true;
      final ExoplanetsCubit cubit = context.read();

      await Future.wait<void>(
        <Future<void>>[
          cubit.getMorePosts(),
          Future<dynamic>.delayed(const Duration(milliseconds: 100), () {}),
        ],
      );

      BotToast.closeAllLoading();
      _gettingMoreProducts = false;
    }
  }
}
