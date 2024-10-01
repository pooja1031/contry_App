import 'dart:ffi';

import 'package:countryapp/models/contry.dart';
import 'package:countryapp/services/api_services.dart';
import 'package:countryapp/utils/constants.dart';
import 'package:countryapp/widgets/contry_card.dart';
import 'package:countryapp/widgets/loading.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<Country>> futureCountries;
  List<Country> countries = [];
  bool isSortedAlphabetically = false;


  @override
  void initState() {
    super.initState();
    futureCountries = ApiServices().fetchCountries();
    futureCountries.then((fetchedCountries) {
      setState(() {
        countries = fetchedCountries;
      });
    });
  }

  void sortCountriesAlphabetically() {
    setState(() {
      isSortedAlphabetically = !isSortedAlphabetically;
      countries.sort((a, b) => isSortedAlphabetically
          ? a.commonName.compareTo(b.commonName)
          : b.commonName.compareTo(a.commonName));
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppConstants.primaryColor,
        appBar: AppBar( title: Center(child: Text('Country Info',style: TextStyle(fontSize: 26,fontWeight:FontWeight.bold ),)),
              backgroundColor: AppConstants.primaryColor,
      
          actions: [
            IconButton(
              icon: Icon(isSortedAlphabetically ? Icons.sort_by_alpha : Icons.sort),
              onPressed: sortCountriesAlphabetically,
            ),
          ],
        ),
      
      
        body:FutureBuilder<List<Country>>(
          future: futureCountries,
          builder: (context,snapshot){
            if(snapshot.connectionState == ConnectionState.waiting){
              return Center(child:LoadingDots(),);
      
            }else if (snapshot.hasError){
       return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Failed to load data.'),
                    SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          futureCountries = ApiServices().fetchCountries();
                        });
                      },
                      child: Text('Retry'),
                    ),
                  ],
                ),
              );          }else if (!snapshot.hasData || snapshot.data!.isEmpty) {
             return Center(child: Text("no countries found."),) ;
            }
      
            List<Country> countries = snapshot.data!;
             return ListView.builder(
              itemCount: countries.length,
              itemBuilder: (context, index) {
                return CountryCards(country: countries[index]);
            });
          },
        )
      ),
    );
  }
}