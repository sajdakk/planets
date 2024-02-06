import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:planets/screens/exoplanets/exoplanets_body.dart';
import 'package:planets/planets.dart';

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
        create: (_) => ExoplanetsCubit()..init(searchController),
        child: BlocBuilder<ExoplanetsCubit, ExoplanetsState>(
          builder: (BuildContext context, ExoplanetsState state) {
            switch (state) {
              case ExoplanetsLoadingState():
                return const LoadingView();

              case ExoplanetsLoadedState():
                return ExoplanetsBody(state: state);
            }
          },
        ),
      ),
    );
  }
}
