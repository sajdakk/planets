import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:softnauts/softnauts.dart';

import 'cubit/activities_details_cubit.dart';

class ActivitiesBody extends StatefulWidget {
  const ActivitiesBody({
    super.key,
    required this.state,
  });

  final ActivitiesDetailsLoadedState state;

  @override
  State<ActivitiesBody> createState() => AactivitiesBodyState();
}

class AactivitiesBodyState extends State<ActivitiesBody> {
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
              children: [
                IconButton(
                  onPressed: () => _onHeartPress(context),
                  icon: widget.state.isActivitiesInFavourites
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
      children: [
        Text(
          'ID: ${widget.state.activities.id}',
          style: SnTextStyles.dMSansSmall14.copyWith(
            color: SnColors.textColor,
          ),
        ),
        const SizedBox(height: 16.0),
      ],
    );
  }

  Widget _buildCreationDateInfo() {
    if (widget.state.activities.creationDate == null) {
      return const SizedBox();
    }

    return Column(
      children: [
        Text(
          'creation date: ${widget.state.activities.creationDate!.readable()}',
          style: SnTextStyles.dMSansSmall14.copyWith(
            color: SnColors.textColor,
          ),
        ),
        const SizedBox(height: 16.0),
      ],
    );
  }

  Widget _buildDateInfo() {
    if (widget.state.activities.date == null) {
      return const SizedBox();
    }

    return Column(
      children: [
        Text(
          'date: ${widget.state.activities.date!.readable()}',
          style: SnTextStyles.dMSansSmall14.copyWith(
            color: SnColors.textColor,
          ),
        ),
        const SizedBox(height: 16.0),
      ],
    );
  }

  Widget _buildTitleInfo() {
    if (widget.state.activities.title == '') {
      return const SizedBox();
    }

    return Column(
      children: [
        Text(
          'title: ${widget.state.activities.title}',
          style: SnTextStyles.dMSansSmall14.copyWith(
            color: SnColors.textColor,
          ),
        ),
        const SizedBox(height: 16.0),
      ],
    );
  }

  Widget _buildContentInfo() {
    if (widget.state.activities.content == '') {
      return const SizedBox();
    }

    return Column(
      children: [
        Text(
          'content: ${widget.state.activities.content}',
          style: SnTextStyles.dMSansSmall14.copyWith(
            color: SnColors.textColor,
          ),
        ),
        const SizedBox(height: 16.0),
      ],
    );
  }

  Widget _buildLabelInfo() {
    if (widget.state.activities.label == '') {
      return const SizedBox();
    }

    return Column(
      children: [
        Text(
          'label: ${widget.state.activities.label}',
          style: SnTextStyles.dMSansSmall14.copyWith(
            color: SnColors.textColor,
          ),
        ),
        const SizedBox(height: 16.0),
      ],
    );
  }

  Widget _buildProfileInfo() {
    if (widget.state.activities.profile == '') {
      return const SizedBox();
    }

    return Column(
      children: [
        Text(
          'profile: ${widget.state.activities.profile}',
          style: SnTextStyles.dMSansSmall14.copyWith(
            color: SnColors.textColor,
          ),
        ),
        const SizedBox(height: 16.0),
      ],
    );
  }

  Widget _buildObservingSiteInfo() {
    if (widget.state.activities.observingSite == null || widget.state.activities.observingSite == '') {
      return const SizedBox();
    }

    return Column(
      children: [
        Text(
          'observing site: ${widget.state.activities.observingSite}',
          style: SnTextStyles.dMSansSmall14.copyWith(
            color: SnColors.textColor,
          ),
        ),
        const SizedBox(height: 16.0),
      ],
    );
  }

  Widget _buildTelescopeInfo() {
    if (widget.state.activities.telescope == null || widget.state.activities.telescope == '') {
      return const SizedBox();
    }

    return Column(
      children: [
        Text(
          'telescope: ${widget.state.activities.telescope}',
          style: SnTextStyles.dMSansSmall14.copyWith(
            color: SnColors.textColor,
          ),
        ),
        const SizedBox(height: 16.0),
      ],
    );
  }

  Widget _buildInstrumentInfo() {
    if (widget.state.activities.instrument == null || widget.state.activities.instrument == '') {
      return const SizedBox();
    }

    return Column(
      children: [
        Text(
          'instrument: ${widget.state.activities.instrument}',
          style: SnTextStyles.dMSansSmall14.copyWith(
            color: SnColors.textColor,
          ),
        ),
        const SizedBox(height: 16.0),
      ],
    );
  }

  Widget _buildProgrammeInfo() {
    if (widget.state.activities.programme == null || widget.state.activities.programme == '') {
      return const SizedBox();
    }

    return Column(
      children: [
        Text(
          'programme: ${widget.state.activities.programme}',
          style: SnTextStyles.dMSansSmall14.copyWith(
            color: SnColors.textColor,
          ),
        ),
        const SizedBox(height: 16.0),
      ],
    );
  }

  Widget _buildProgrammeTypeInfo() {
    if (widget.state.activities.programmeType == '') {
      return const SizedBox();
    }

    return Column(
      children: [
        Text(
          'programmeType: ${widget.state.activities.programmeType}',
          style: SnTextStyles.dMSansSmall14.copyWith(
            color: SnColors.textColor,
          ),
        ),
        const SizedBox(height: 16.0),
      ],
    );
  }

  Widget _buildTargetNameInfo() {
    if (widget.state.activities.targetName == '') {
      return const SizedBox();
    }

    return Column(
      children: [
        Text(
          'targetName: ${widget.state.activities.targetName}',
          style: SnTextStyles.dMSansSmall14.copyWith(
            color: SnColors.textColor,
          ),
        ),
        const SizedBox(height: 16.0),
      ],
    );
  }

  Widget _buildCoordinatesInfo() {
    if (widget.state.activities.coordinates == null || widget.state.activities.coordinates == '') {
      return const SizedBox();
    }

    return Column(
      children: [
        Text(
          'coordinates: ${widget.state.activities.coordinates}',
          style: SnTextStyles.dMSansSmall14.copyWith(
            color: SnColors.textColor,
          ),
        ),
        const SizedBox(height: 16.0),
      ],
    );
  }

  Widget _buildOrganisationInfo() {
    if (widget.state.activities.organisation == '') {
      return const SizedBox();
    }

    return Column(
      children: [
        Text(
          'organisation: ${widget.state.activities.organisation}',
          style: SnTextStyles.dMSansSmall14.copyWith(
            color: SnColors.textColor,
          ),
        ),
        const SizedBox(height: 16.0),
      ],
    );
  }

  Widget _buildCollaborationInfo() {
    if (widget.state.activities.collaboration == null || widget.state.activities.collaboration == '') {
      return const SizedBox();
    }

    return Column(
      children: [
        Text(
          'collaboration: ${widget.state.activities.collaboration}',
          style: SnTextStyles.dMSansSmall14.copyWith(
            color: SnColors.textColor,
          ),
        ),
        const SizedBox(height: 16.0),
      ],
    );
  }

  Widget _buildLinksInfo() {
    if (widget.state.activities.links.isEmpty) {
      return const SizedBox();
    }

    return Column(
      children: [
        Text(
          'links: ${widget.state.activities.links.join(', ')}',
          style: SnTextStyles.dMSansSmall14.copyWith(
            color: SnColors.textColor,
          ),
        ),
        const SizedBox(height: 16.0),
      ],
    );
  }

  void _onHeartPress(BuildContext context) {
    ActivitiesDetailsCubit cubit = context.read();

    if (widget.state.isActivitiesInFavourites) {
      cubit.removeActivities(widget.state.activities.id);

      return;
    }

    cubit.addActivities(widget.state.activities.id);
  }
}
