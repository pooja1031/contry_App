import 'package:cached_network_image/cached_network_image.dart';
import 'package:countryapp/models/contry.dart';
import 'package:countryapp/utils/constants.dart';
import 'package:flutter/material.dart';

class CountryCards extends StatelessWidget {
  final Country country;

  const CountryCards({Key? key, required this.country}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: Duration(milliseconds: 500),
      opacity: 1.0,
      child: Card(
        elevation: 4,
        margin: EdgeInsets.all(AppConstants.defaultPadding),
        child: Padding(
          padding: const EdgeInsets.all(AppConstants.defaultPadding),
          child: Row(
            children: [
              CachedNetworkImage(
                imageUrl: country.flagUrl,
                width: 60,
                height: 40,
                placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
              SizedBox(width: 15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start, 
                  children: [
                    Text(
                      "Common Name: ${country.commonName}",
                      style: AppConstants.standardTextStyle.copyWith(fontWeight: FontWeight.bold), 
                    ),
                    SizedBox(height: 4), 
                    Text(
                      "Official Name: ${country.officialName}",
                      style: AppConstants.standardTextStyle.copyWith(fontWeight: FontWeight.bold), 
                    ),
                    SizedBox(height: 4), 
                    Text(
                      "Currency: ${country.currencyName} (${country.currencyCode})",
                      style: AppConstants.standardTextStyle.copyWith(fontWeight: FontWeight.bold), 
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
