import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:softnauts/core/_core.dart';
import 'package:softnauts/widgets/_widgets.dart';

import 'cubit/activities_cubit.dart';
import 'activities_body.dart';

class ActivitiesScreen extends StatelessWidget {
  const ActivitiesScreen({
    super.key,
    required this.searchController,
  });

  final TextEditingController searchController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<ActivitiesCubit>(
        create: (_) => sl()..init(searchController),
        child: BlocBuilder<ActivitiesCubit, ActivitiesState>(
          builder: (BuildContext context, ActivitiesState state) {
            if (state is ActivitiesLoadingState) {
              return const LoadingView();
            }

            if (state is ActivitiesLoadedState) {
              return ActivitiesBody(state: state);
            }

            return ErrorView.unhandledState(state);
          },
        ),
      ),
    );
  }
}
