import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:softnauts/softnauts.dart';

import 'activities_list_body.dart';
import 'cubit/activities_cubit.dart';

class ActivitiesListScreen extends StatelessWidget {
  const ActivitiesListScreen({
    super.key,
    required this.searchController,
  });

  final TextEditingController searchController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<ActivitiesListCubit>(
        create: (_) => sl()..init(searchController),
        child: BlocBuilder<ActivitiesListCubit, ActivitiesListState>(
          builder: (BuildContext context, ActivitiesListState state) {
            if (state is ActivitiesListLoadingState) {
              return const LoadingView();
            }

            if (state is ActivitiesListLoadedState) {
              return ActivitiesListBody(state: state);
            }

            return const ErrorView();
          },
        ),
      ),
    );
  }
}
