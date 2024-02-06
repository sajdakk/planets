import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:planets/planets.dart';

import 'activity_details_body.dart';
import 'cubit/activity_details_cubit.dart';

class ActivityDetailsScreen extends StatelessWidget {
  const ActivityDetailsScreen({
    super.key,
    required this.id,
  });

  final int id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ActivityDetailsCubit>(
      create: (_) => ActivityDetailsCubit()..init(id),
      child: BlocBuilder<ActivityDetailsCubit, ActivityDetailsState>(
        builder: (BuildContext context, ActivityDetailsState state) {
          switch (state) {
            case ActivityDetailsLoadingState():
              return const LoadingView();

            case ActivityDetailsNoDataState():
              return const NoDataView();

            case ActivityDetailsLoadedState():
              return Scaffold(
                appBar: AppBar(
                  backgroundColor: Theme.of(context).colorScheme.inversePrimary,
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'activity details',
                        style: MyTextStyles.dMSansLarge24.copyWith(
                          color: MyColors.basicBlack,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          final ActivityDetailsCubit cubit = context.read();

                          if (state.isActivityInFavorites) {
                            cubit.removeActivity(state.activity.id);

                            return;
                          }

                          cubit.addActivity(state.activity.id);
                        },
                        icon: state.isActivityInFavorites
                            ? const Icon(
                                Icons.favorite_rounded,
                                color: Colors.purple,
                              )
                            : const Icon(
                                Icons.favorite_outline_rounded,
                                color: MyColors.basicBlack,
                              ),
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
                      },
                    ),
                  ),
                ),
                body: ActivityBody(state: state),
              );
          }
        },
      ),
    );
  }
}
