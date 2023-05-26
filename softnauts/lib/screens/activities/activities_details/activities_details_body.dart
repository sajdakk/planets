import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:softnauts/extensions/_extensions.dart';

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
                  onPressed: () {
                    ActivitiesDetailsCubit cubit = context.read();

                    if (widget.state.isActivitiesInFavourites) {
                      cubit.removeActivities(widget.state.activities.id);

                      return;
                    }

                    cubit.addActivities(widget.state.activities.id);
                  },
                  icon: widget.state.isActivitiesInFavourites
                      ? const Icon(Icons.favorite_rounded)
                      : const Icon(Icons.favorite_outline_rounded),
                ),
                const Text('favourite'),
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
        Text('ID: ${widget.state.activities.id}'),
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
        Text('creation date: ${widget.state.activities.creationDate!.readable()}'),
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
        Text('date: ${widget.state.activities.date!.readable()}'),
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
        Text('title: ${widget.state.activities.title}'),
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
        Text('content: ${widget.state.activities.content}'),
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
        Text('label: ${widget.state.activities.label}'),
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
        Text('profile: ${widget.state.activities.profile}'),
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
        Text('observing site: ${widget.state.activities.observingSite}'),
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
        Text('telescope: ${widget.state.activities.telescope}'),
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
        Text('instrument: ${widget.state.activities.instrument}'),
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
        Text('programme: ${widget.state.activities.programme}'),
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
        Text('programmeType: ${widget.state.activities.programmeType}'),
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
        Text('targetName: ${widget.state.activities.targetName}'),
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
        Text('coordinates: ${widget.state.activities.coordinates}'),
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
        Text('organisation: ${widget.state.activities.organisation}'),
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
        Text('collaboration: ${widget.state.activities.collaboration}'),
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
        Text('links: ${widget.state.activities.links.join(', ')}'),
        const SizedBox(height: 16.0),
      ],
    );
  }
}

  // final List<String> links;
