import 'package:flutter/material.dart';
import 'package:softnauts/screens/activities/activities_list/activities_list_screen.dart';
import 'package:softnauts/screens/exoplanets/exoplanets_screen.dart';
import 'package:softnauts/softnauts.dart';

class InitScreen extends StatefulWidget {
  const InitScreen({super.key});

  @override
  State<InitScreen> createState() => _InitScreenState();
}

class _InitScreenState extends State<InitScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(
          'Softnauts',
          style: SnTextStyles.dMSansLarge24.copyWith(
            color: SnColors.basicBlack,
          ),
        ),
      ),
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: <Widget>[
            const SizedBox(height: 16.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: SnTextInput(
                controller: _searchController,
                labelText: 'Search',
              ),
            ),
            TabBar(
              labelColor: Colors.deepPurple,
              indicatorColor: Colors.purple,
              labelPadding: const EdgeInsets.all(4.0),
              indicatorWeight: 1.0,
              indicatorPadding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 4.0),
              tabs: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'exoplanets',
                    style: SnTextStyles.dMSansSmall14.copyWith(
                      color: SnColors.gray,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'activities',
                    style: SnTextStyles.dMSansSmall14.copyWith(
                      color: SnColors.gray,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                physics: const NeverScrollableScrollPhysics(),
                children: <Widget>[
                  ExoplanetsScreen(searchController: _searchController),
                  ActivitiesListScreen(searchController: _searchController),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
