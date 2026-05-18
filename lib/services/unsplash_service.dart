
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/trip.dart';

class UnsplashService {

  static const accessKey = 'V4yj145uX3rralju8GoJPyHlhnX1NCRku5W9P-HM_k4';

  static Future<Trip?> getCityTrip(String city) async {

    final response = await http.get(
      Uri.parse(
        'https://api.unsplash.com/search/photos?page=1&query=$city city skyline&client_id=$accessKey',
      ),
    );

    final data = jsonDecode(response.body);

    if (data['results'].isEmpty) {
      return null;
    }

    final item = data['results'][0];

    return Trip(
      city: city,
      image: item['urls']['regular'],
      description: item['alt_description'] ?? 'Beautiful destination.',
      price: 1000 + city.length * 120,
    );
  }

  static Future<List<Trip>> initialTrips() async {

    final cities = [
      'Tokyo',
      'Paris',
      'Dubai',
      'Rome',
      'New York',
      'Barcelona',
      'London',
      'Singapore',
    ];

    List<Trip> result = [];

    for (final city in cities) {

      final trip = await getCityTrip(city);

      if (trip != null) {
        result.add(trip);
      }
    }

    return result;
  }
}
