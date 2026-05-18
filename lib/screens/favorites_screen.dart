
import 'package:flutter/material.dart';
import '../data/app_data.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final favorites =
        allTrips.where((e) => e.favorite).toList();

    return favorites.isEmpty
        ? const Center(
            child: Text(
              'No favorite trips yet.',
            ),
          )
        : ListView.builder(
            padding: const EdgeInsets.all(20),
            itemCount: favorites.length,
            itemBuilder: (context, index) {

              final trip = favorites[index];

              return Card(
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage:
                        NetworkImage(trip.image),
                  ),
                  title: Text(trip.city),
                  subtitle: Text(trip.description),
                  trailing: Text('\$${trip.price}'),
                ),
              );
            },
          );
  }
}
