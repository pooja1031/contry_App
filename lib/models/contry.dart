class Country {
  final String  commonName;
  final String  officialName;
  final String  currencyName;
  final String  currencyCode;
  final String  flagUrl;

Country({
  required this.commonName,
  required this.officialName ,
    required this.currencyName, 
  required this.currencyCode,
  required this.flagUrl,

});
factory Country.fromJson(Map<String,dynamic>json){
  final  name =json['name'];
  final currencies =json['currencies'];

  return Country(commonName: name['common'],
   officialName: name['official'],
    currencyName: currencies.isNotEmpty ? currencies.values.first['name'] : 'N/A',
      currencyCode: currencies.isNotEmpty ? currencies.keys.first : 'N/A',
      flagUrl: json['flags']['png'],
  );
}
}