import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:softnauts/screens/exoplanets/exoplanets_body.dart';
import 'package:softnauts/softnauts.dart';

import 'cubit/exoplanets_cubit.dart';

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

            return const ErrorView();
          },
        ),
      ),
    );
  }
}
