import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:planets/planets.dart';

import 'cubit/activity_details_cubit.dart';
import 'widgets/_widgets.dart';

class ActivityBody extends StatelessWidget {
  const ActivityBody({
    super.key,
    required this.state,
  });

  final ActivityDetailsLoadedState state;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 16.0),
            DetailsRow(
              text: 'ID: ${state.activity.id}',
            ),
            if (state.activity.creationDate != null)
              DetailsRow(
                text: 'creation date: ${state.activity.creationDate!.readable()}',
              ),
            if (state.activity.date != null)
              DetailsRow(
                text: 'date: ${state.activity.date!.readable()}',
              ),
            if (state.activity.links.isNotEmpty)
              DetailsRow(
                text: 'links: ${state.activity.links.join(', ')}',
              ),
            if (state.activity.title != '')
              DetailsRow(
                text: 'title: ${state.activity.title}',
              ),
            if (state.activity.content != '')
              DetailsRow(
                text: 'content: ${state.activity.content}',
              ),
            if (state.activity.label != '')
              DetailsRow(
                text: 'label: ${state.activity.label}',
              ),
            if (state.activity.profile != '')
              DetailsRow(
                text: 'profile: ${state.activity.profile}',
              ),
            if (state.activity.observingSite != null && state.activity.observingSite != '')
              DetailsRow(
                text: 'observing site: ${state.activity.observingSite}',
              ),
            if (state.activity.telescope != null && state.activity.telescope != '')
              DetailsRow(
                text: 'telescope: ${state.activity.telescope}',
              ),
            if (state.activity.instrument != null && state.activity.instrument != '')
              DetailsRow(
                text: 'instrument: ${state.activity.instrument}',
              ),
            if (state.activity.programme != null)
              DetailsRow(
                text: 'programme:\n${state.activity.programme!.displayName}',
              ),
            if (state.activity.programmeType != '')
              DetailsRow(
                text: 'programme type: ${state.activity.programmeType}',
              ),
            if (state.activity.targetName != '')
              DetailsRow(
                text: 'target name: ${state.activity.targetName}',
              ),
            if (state.activity.coordinates != null)
              DetailsRow(
                text: 'coordinates:\n${state.activity.coordinates!.displayName}',
              ),
            if (state.activity.organisation != null && state.activity.organisation != '')
              DetailsRow(
                text: 'organisation: ${state.activity.organisation}',
              ),
            if (state.activity.collaboration != null && state.activity.collaboration != '')
              DetailsRow(
                text: 'collaboration: ${state.activity.collaboration}',
              ),
            Row(
              children: <Widget>[
                IconButton(
                  onPressed: () => _onHeartPress(context),
                  icon: state.isActivityInFavorites
                      ? const Icon(
                          Icons.favorite_rounded,
                          color: Colors.purple,
                        )
                      : const Icon(
                          Icons.favorite_outline_rounded,
                          color: MyColors.textColor,
                        ),
                ),
                Text(
                  'favorite',
                  style: MyTextStyles.dMSansRegular16.copyWith(
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

    if (state.isActivityInFavorites) {
      cubit.removeActivity(state.activity.id);

      return;
    }

    cubit.addActivity(state.activity.id);
  }
}
