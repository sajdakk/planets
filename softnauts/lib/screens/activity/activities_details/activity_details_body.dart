import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:softnauts/softnauts.dart';

import 'cubit/activity_details_cubit.dart';

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
            _buildIdInfo(),
            _buildCreationDateInfo(),
            _buildDateInfo(),
            _buildLinksInfo(),
            _buildTitleInfo(),
            _buildContentInfo(),
            _buildLabelInfo(),
            _buildProfileInfo(),
            _buildObservingSiteInfo(),
            _buildTelescopeInfo(),
            _buildInstrumentInfo(),
            _buildProgrammeInfo(),
            _buildProgrammeTypeInfo(),
            _buildTargetNameInfo(),
            _buildCoordinatesInfo(),
            _buildOrganisationInfo(),
            _buildCollaborationInfo(),
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

  Widget _buildIdInfo() {
    return Column(
      children: <Widget>[
        Text(
          'ID: ${widget.state.activity.id}',
          style: SnTextStyles.dMSansSmall14.copyWith(
            color: SnColors.textColor,
          ),
        ),
        const SizedBox(height: 16.0),
      ],
    );
  }

  Widget _buildCreationDateInfo() {
    if (widget.state.activity.creationDate == null) {
      return const SizedBox();
    }

    return Column(
      children: <Widget>[
        Text(
          'creation date: ${widget.state.activity.creationDate!.readable()}',
          style: SnTextStyles.dMSansSmall14.copyWith(
            color: SnColors.textColor,
          ),
        ),
        const SizedBox(height: 16.0),
      ],
    );
  }

  Widget _buildDateInfo() {
    if (widget.state.activity.date == null) {
      return const SizedBox();
    }

    return Column(
      children: <Widget>[
        Text(
          'date: ${widget.state.activity.date!.readable()}',
          style: SnTextStyles.dMSansSmall14.copyWith(
            color: SnColors.textColor,
          ),
        ),
        const SizedBox(height: 16.0),
      ],
    );
  }

  Widget _buildTitleInfo() {
    if (widget.state.activity.title == '') {
      return const SizedBox();
    }

    return Column(
      children: <Widget>[
        Text(
          'title: ${widget.state.activity.title}',
          style: SnTextStyles.dMSansSmall14.copyWith(
            color: SnColors.textColor,
          ),
        ),
        const SizedBox(height: 16.0),
      ],
    );
  }

  Widget _buildContentInfo() {
    if (widget.state.activity.content == '') {
      return const SizedBox();
    }

    return Column(
      children: <Widget>[
        Text(
          'content: ${widget.state.activity.content}',
          style: SnTextStyles.dMSansSmall14.copyWith(
            color: SnColors.textColor,
          ),
        ),
        const SizedBox(height: 16.0),
      ],
    );
  }

  Widget _buildLabelInfo() {
    if (widget.state.activity.label == '') {
      return const SizedBox();
    }

    return Column(
      children: <Widget>[
        Text(
          'label: ${widget.state.activity.label}',
          style: SnTextStyles.dMSansSmall14.copyWith(
            color: SnColors.textColor,
          ),
        ),
        const SizedBox(height: 16.0),
      ],
    );
  }

  Widget _buildProfileInfo() {
    if (widget.state.activity.profile == '') {
      return const SizedBox();
    }

    return Column(
      children: <Widget>[
        Text(
          'profile: ${widget.state.activity.profile}',
          style: SnTextStyles.dMSansSmall14.copyWith(
            color: SnColors.textColor,
          ),
        ),
        const SizedBox(height: 16.0),
      ],
    );
  }

  Widget _buildObservingSiteInfo() {
    if (widget.state.activity.observingSite == null || widget.state.activity.observingSite == '') {
      return const SizedBox();
    }

    return Column(
      children: <Widget>[
        Text(
          'observing site: ${widget.state.activity.observingSite}',
          style: SnTextStyles.dMSansSmall14.copyWith(
            color: SnColors.textColor,
          ),
        ),
        const SizedBox(height: 16.0),
      ],
    );
  }

  Widget _buildTelescopeInfo() {
    if (widget.state.activity.telescope == null || widget.state.activity.telescope == '') {
      return const SizedBox();
    }

    return Column(
      children: <Widget>[
        Text(
          'telescope: ${widget.state.activity.telescope}',
          style: SnTextStyles.dMSansSmall14.copyWith(
            color: SnColors.textColor,
          ),
        ),
        const SizedBox(height: 16.0),
      ],
    );
  }

  Widget _buildInstrumentInfo() {
    if (widget.state.activity.instrument == null || widget.state.activity.instrument == '') {
      return const SizedBox();
    }

    return Column(
      children: <Widget>[
        Text(
          'instrument: ${widget.state.activity.instrument}',
          style: SnTextStyles.dMSansSmall14.copyWith(
            color: SnColors.textColor,
          ),
        ),
        const SizedBox(height: 16.0),
      ],
    );
  }

  Widget _buildProgrammeInfo() {
    if (widget.state.activity.programme == null || widget.state.activity.programme == '') {
      return const SizedBox();
    }

    return Column(
      children: <Widget>[
        Text(
          'programme: ${widget.state.activity.programme}',
          style: SnTextStyles.dMSansSmall14.copyWith(
            color: SnColors.textColor,
          ),
        ),
        const SizedBox(height: 16.0),
      ],
    );
  }

  Widget _buildProgrammeTypeInfo() {
    if (widget.state.activity.programmeType == '') {
      return const SizedBox();
    }

    return Column(
      children: <Widget>[
        Text(
          'programmeType: ${widget.state.activity.programmeType}',
          style: SnTextStyles.dMSansSmall14.copyWith(
            color: SnColors.textColor,
          ),
        ),
        const SizedBox(height: 16.0),
      ],
    );
  }

  Widget _buildTargetNameInfo() {
    if (widget.state.activity.targetName == '') {
      return const SizedBox();
    }

    return Column(
      children: <Widget>[
        Text(
          'targetName: ${widget.state.activity.targetName}',
          style: SnTextStyles.dMSansSmall14.copyWith(
            color: SnColors.textColor,
          ),
        ),
        const SizedBox(height: 16.0),
      ],
    );
  }

  Widget _buildCoordinatesInfo() {
    if (widget.state.activity.coordinates == null || widget.state.activity.coordinates == '') {
      return const SizedBox();
    }

    return Column(
      children: <Widget>[
        Text(
          'coordinates: ${widget.state.activity.coordinates}',
          style: SnTextStyles.dMSansSmall14.copyWith(
            color: SnColors.textColor,
          ),
        ),
        const SizedBox(height: 16.0),
      ],
    );
  }

  Widget _buildOrganisationInfo() {
    if (widget.state.activity.organisation == '') {
      return const SizedBox();
    }

    return Column(
      children: <Widget>[
        Text(
          'organisation: ${widget.state.activity.organisation}',
          style: SnTextStyles.dMSansSmall14.copyWith(
            color: SnColors.textColor,
          ),
        ),
        const SizedBox(height: 16.0),
      ],
    );
  }

  Widget _buildCollaborationInfo() {
    if (widget.state.activity.collaboration == null || widget.state.activity.collaboration == '') {
      return const SizedBox();
    }

    return Column(
      children: <Widget>[
        Text(
          'collaboration: ${widget.state.activity.collaboration}',
          style: SnTextStyles.dMSansSmall14.copyWith(
            color: SnColors.textColor,
          ),
        ),
        const SizedBox(height: 16.0),
      ],
    );
  }

  Widget _buildLinksInfo() {
    if (widget.state.activity.links.isEmpty) {
      return const SizedBox();
    }

    return Column(
      children: <Widget>[
        Text(
          'links: ${widget.state.activity.links.join(', ')}',
          style: SnTextStyles.dMSansSmall14.copyWith(
            color: SnColors.textColor,
          ),
        ),
        const SizedBox(height: 16.0),
      ],
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
