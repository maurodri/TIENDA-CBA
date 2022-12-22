import 'package:flutter/material.dart';
import 'package:shop_app/screens/home/components/search/services/country_services.dart';

import '../body.dart';
import '../produccion.dart';
import 'country/country.dart';

class CountrySearchDelegrate extends SearchDelegate<Country> {
  final List<Country> countries;
  late List<Country> _filter = [];
  CountrySearchDelegrate(this.countries);

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(onPressed: () => this.query = "", icon: Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          this.close(context, Country(name: ''));
        },
        icon: Icon(Icons.arrow_back_ios));
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query.trim().length == 0) {
      return Center(child: Text('Escribe un Producto'));
    }
    return Plantas();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    _filter = countries.where((country) {
      return country.name.toLowerCase().contains(query.trim().toLowerCase());
    }).toList();
    return ListView.builder(
      itemCount: _filter.length,
      itemBuilder: (_, index) {
        return ListTile(
          title: Text(_filter[index].name),
        );
      },
    );
  }
}
