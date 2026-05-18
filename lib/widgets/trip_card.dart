
import 'package:flutter/material.dart';

import '../models/trip.dart';
import '../data/app_data.dart';

class TripCard extends StatelessWidget {

  final Trip trip;
  final VoidCallback refresh;

  const TripCard({
    super.key,
    required this.trip,
    required this.refresh,
  });

  @override
  Widget build(BuildContext context) {

    return ClipRRect(
      borderRadius: BorderRadius.circular(24),
      child: Stack(
        fit: StackFit.expand,
        children: [

          Image.network(
            trip.image,
            fit: BoxFit.cover,
          ),

          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.transparent,
                  Colors.black.withOpacity(0.85),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [

                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    onPressed: () {
                      trip.favorite = !trip.favorite;
                      refresh();
                    },
                    icon: Icon(
                      trip.favorite
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: Colors.white,
                    ),
                  ),
                ),

                const Spacer(),

                Text(
                  trip.city,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),

                Text(
                  '\$${trip.price}',
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 18,
                  ),
                ),

                const SizedBox(height: 10),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {

                      showDialog(
                        context: context,
                        builder: (_) {
                          return AlertDialog(
                            title: Text(trip.city),
                            content: Column(
                              mainAxisSize:
                                  MainAxisSize.min,
                              crossAxisAlignment:
                                  CrossAxisAlignment.start,
                              children: [

                                ClipRRect(
                                  borderRadius:
                                      BorderRadius.circular(16),
                                  child: Image.network(
                                    trip.image,
                                    height: 160,
                                    fit: BoxFit.cover,
                                  ),
                                ),

                                const SizedBox(height: 16),

                                Text(trip.description),

                                const SizedBox(height: 12),

                                Text(
                                  'Price: \$${trip.price}',
                                ),
                              ],
                            ),
                            actions: [

                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text('Close'),
                              ),

                              ElevatedButton(
                                onPressed: () {

                                  bookedTrips.add(trip);

                                  Navigator.pop(context);

                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        '${trip.city} booked!',
                                      ),
                                    ),
                                  );
                                },
                                child: const Text('Book'),
                              )
                            ],
                          );
                        },
                      );
                    },
                    child: const Text('View'),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
