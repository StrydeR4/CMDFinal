
import 'package:flutter/material.dart';
import '../data/app_data.dart';

class BookingsScreen extends StatelessWidget {
  const BookingsScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return bookedTrips.isEmpty
        ? const Center(
            child: Text(
              'No bookings yet.',
            ),
          )
        : ListView.builder(
            padding: const EdgeInsets.all(20),
            itemCount: bookedTrips.length,
            itemBuilder: (context, index) {

              final trip = bookedTrips[index];

              return Card(
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage:
                        NetworkImage(trip.image),
                  ),
                  title: Text(trip.city),
                  subtitle: Text(
                    trip.description,
                  ),
                  trailing: Text(
                    '\$${trip.price}',
                  ),
                ),
              );
            },
          );
  }
}
