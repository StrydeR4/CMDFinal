
import 'package:flutter/material.dart';

import '../data/app_data.dart';
import '../services/unsplash_service.dart';
import '../widgets/trip_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  bool loading = true;

  final search = TextEditingController();

  @override
  void initState() {
    super.initState();
    load();
  }

  Future<void> load() async {

    if (allTrips.isEmpty) {
      allTrips = await UnsplashService.initialTrips();
    }

    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {

    final filtered = allTrips.where((e) {
      return e.city.toLowerCase().contains(
        search.text.toLowerCase(),
      );
    }).toList();

    return loading
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [

                TextField(
                  controller: search,
                  onChanged: (_) {
                    setState(() {});
                  },
                  decoration: InputDecoration(
                    hintText: 'Search destinations...',
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                Align(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton.icon(
                    onPressed: () {

                      final cityController =
                          TextEditingController();

                      showDialog(
                        context: context,
                        builder: (_) {
                          return AlertDialog(
                            title: const Text('Add New City'),
                            content: TextField(
                              controller: cityController,
                              decoration: const InputDecoration(
                                hintText: 'Enter city name',
                              ),
                            ),
                            actions: [

                              ElevatedButton(
                                onPressed: () async {

                                  final city = cityController.text;

                                  final trip =
                                      await UnsplashService
                                          .getCityTrip(city);

                                  if (trip != null) {

                                    allTrips.add(trip);

                                    setState(() {});
                                  }

                                  if (mounted) {
                                    Navigator.pop(context);
                                  }
                                },
                                child: const Text('Add'),
                              )
                            ],
                          );
                        },
                      );
                    },
                    icon: const Icon(Icons.add),
                    label: const Text('Add City'),
                  ),
                ),

                const SizedBox(height: 12),

                Expanded(
                  child: GridView.builder(
                    itemCount: filtered.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      crossAxisSpacing: 18,
                      mainAxisSpacing: 18,
                      childAspectRatio: 0.68,
                    ),
                    itemBuilder: (context, index) {

                      return TripCard(
                        trip: filtered[index],
                        refresh: () {
                          setState(() {});
                        },
                      );
                    },
                  ),
                )
              ],
            ),
          );
  }
}
