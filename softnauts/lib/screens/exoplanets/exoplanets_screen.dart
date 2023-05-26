import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:softnauts/core/_core.dart';
import 'package:softnauts/widgets/_widgets.dart';

import 'cubit/exoplanets_cubit.dart';
import 'exoplanets_body.dart';

class ExoplanetsScreen extends StatelessWidget {
  const ExoplanetsScreen({
    super.key,
    required this.searchController,
  });

  final TextEditingController searchController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<ExoplanetsCubit>(
        create: (_) => sl()..init(searchController),
        child: BlocBuilder<ExoplanetsCubit, ExoplanetsState>(
          builder: (BuildContext context, ExoplanetsState state) {
            if (state is ExoplanetsLoadingState) {
              return const LoadingView();
            }

            if (state is ExoplanetsLoadedState) {
              return ExoplanetsBody(state: state);
            }

            return ErrorView.unhandledState(state);
          },
        ),
      ),
    );
  }
}
