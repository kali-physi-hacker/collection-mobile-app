class BaseCollector {
  BaseCollector({
    required this.date,
    required this.bacenta,
    required this.center,
    required this.region,
    required this.shepherdName,
    required this.shepherdContactMobile,
    required this.shepherdContactWhatsapp,
    required this.soulName,
    required this.soulContactMobile,
    required this.soulContactWhatsapp,
    required this.soulGPSLocation
  });

  final DateTime date;
  final String bacenta;
  final String center;
  final String region;
  final String shepherdName;
  final String shepherdContactMobile;
  final String shepherdContactWhatsapp;
  final String soulName;
  final String soulContactMobile;
  final String soulContactWhatsapp;
  final String soulGPSLocation;

  void save() {
    /*
    This is where I'll be doing the API call to send the data to the server
    * */
    print("Data Saved");
  }
}