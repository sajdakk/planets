import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:softnauts/softnauts.dart';

import 'cubit/activity_details_cubit.dart';
import 'widgets/_widgets.dart';

class ActivityBody extends StatefulWidget {
  const ActivityBody({
    super.key,
    required this.state,
  });

  final ActivityDetailsLoadedState state;

  @override
  State<ActivityBody> createState() => AactivityBodyState();
}

class AactivityBodyState extends State<ActivityBody> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: _scrollController,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 16.0),
            DetailsRow(
              text: 'ID: ${widget.state.activity.id}',
            ),
            if (widget.state.activity.creationDate != null)
              DetailsRow(
                text: 'creation date: ${widget.state.activity.creationDate!.readable()}',
              ),
            if (widget.state.activity.date != null)
              DetailsRow(
                text: 'date: ${widget.state.activity.date!.readable()}',
              ),
            if (widget.state.activity.links.isNotEmpty)
              DetailsRow(
                text: 'links: ${widget.state.activity.links.join(', ')}',
              ),
            if (widget.state.activity.title != '')
              DetailsRow(
                text: 'title: ${widget.state.activity.title}',
              ),
            if (widget.state.activity.content != '')
              DetailsRow(
                text: 'content: ${widget.state.activity.content}',
              ),
            if (widget.state.activity.label != '')
              DetailsRow(
                text: 'label: ${widget.state.activity.label}',
              ),
            if (widget.state.activity.profile != '')
              DetailsRow(
                text: 'profile: ${widget.state.activity.profile}',
              ),
            if (widget.state.activity.observingSite != null && widget.state.activity.observingSite != '')
              DetailsRow(
                text: 'observing site: ${widget.state.activity.observingSite}',
              ),
            if (widget.state.activity.telescope != null && widget.state.activity.telescope != '')
              DetailsRow(
                text: 'telescope: ${widget.state.activity.telescope}',
              ),
            if (widget.state.activity.instrument != null && widget.state.activity.instrument != '')
              DetailsRow(
                text: 'instrument: ${widget.state.activity.instrument}',
              ),
            if (widget.state.activity.programme != null)
              DetailsRow(
                text: 'programme:\n${widget.state.activity.programme!.displayName}',
              ),
            if (widget.state.activity.programmeType != '')
              DetailsRow(
                text: 'programme type: ${widget.state.activity.programmeType}',
              ),
            if (widget.state.activity.targetName != '')
              DetailsRow(
                text: 'target name: ${widget.state.activity.targetName}',
              ),
            if (widget.state.activity.coordinates != null)
              DetailsRow(
                text: 'coordinates:\n${widget.state.activity.coordinates!.displayName}',
              ),
            if (widget.state.activity.organisation != null && widget.state.activity.organisation != '')
              DetailsRow(
                text: 'organisation: ${widget.state.activity.organisation}',
              ),
            if (widget.state.activity.collaboration != null && widget.state.activity.collaboration != '')
              DetailsRow(
                text: 'collaboration: ${widget.state.activity.collaboration}',
              ),
            Row(
              children: <Widget>[
                IconButton(
                  onPressed: () => _onHeartPress(context),
                  icon: widget.state.isActivityInFavourites
                      ? const Icon(
                          Icons.favorite_rounded,
                          color: Colors.purple,
                        )
                      : const Icon(
                          Icons.favorite_outline_rounded,
                          color: SnColors.textColor,
                        ),
                ),
                Text(
                  'favourite',
                  style: SnTextStyles.dMSansRegular16.copyWith(
                    color: Colors.purple,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _onHeartPress(BuildContext context) {
    final ActivityDetailsCubit cubit = context.read();

    if (widget.state.isActivityInFavourites) {
      cubit.removeActivity(widget.state.activity.id);

      return;
    }

    cubit.addActivity(widget.state.activity.id);
  }
}
