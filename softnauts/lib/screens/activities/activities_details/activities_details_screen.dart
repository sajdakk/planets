import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:softnauts/softnauts.dart';

import 'activities_details_body.dart';
import 'cubit/activities_details_cubit.dart';

class ActivitiesDetailsScreen extends StatelessWidget {
  const ActivitiesDetailsScreen({
    super.key,
    required this.id,
  });

  final int id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ActivitiesDetailsCubit>(
      create: (_) => sl()..init(id),
      child: BlocBuilder<ActivitiesDetailsCubit, ActivitiesDetailsState>(
        builder: (BuildContext context, ActivitiesDetailsState state) {
          if (state is ActivitiesDetailsLoadedState) {
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Theme.of(context).colorScheme.inversePrimary,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('activities details'),
                    IconButton(
                      onPressed: () {
                        ActivitiesDetailsCubit cubit = context.read();

                        if (state.isActivitiesInFavourites) {
                          cubit.removeActivities(state.activities.id);

                          return;
                        }

                        cubit.addActivities(state.activities.id);
                      },
                      icon: state.isActivitiesInFavourites
                          ? const Icon(Icons.favorite_rounded)
                          : const Icon(Icons.favorite_outline_rounded),
                    ),
                  ],
                ),
                leading: GestureDetector(
                  child: IconButton(
                      icon: const Icon(
                        Icons.arrow_back_ios_new_outlined,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      }),
                ),
              ),
              body: ActivitiesBody(state: state),
            );
          }

          return const ErrorView();
        },
      ),
    );
  }
}
