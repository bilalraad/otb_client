import 'package:otb_client/src/view/utils/app_assets.dart';

class Airport {
  final String code;
  final String name;
  final String provanceName;
  final String countryName;
  final String countryNameAr;
  final String countryImage;

  Airport({
    required this.code,
    required this.name,
    required this.countryName,
    required this.provanceName,
    required this.countryNameAr,
    required this.countryImage,
  });

  static final supportedAirports = [
    Airport(
      code: 'BGW',
      name: 'Baghdad International Airport',
      countryName: 'Iraq',
      countryNameAr: 'العراق',
      provanceName: 'بغداد',
      countryImage: AppAssets.iraqFlag,
    ),
    Airport(
      code: 'DAM',
      name: 'Damascus International Airport',
      countryName: 'sirya',
      countryNameAr: 'سوريا',
      provanceName: 'دمشق',
      countryImage: AppAssets.siryaFlag,
    ),
    Airport(
      code: 'BEY',
      name: 'Beirut Rafic Hariri International Airport',
      countryName: 'lebanon',
      countryNameAr: 'لبنان',
      provanceName: 'بيروت',
      countryImage: AppAssets.lebanonFlag,
    ),
    Airport(
      code: 'CAI',
      name: 'Cairo International Airport',
      countryName: 'eygpt',
      countryNameAr: 'مصر',
      provanceName: 'القاهرة',
      countryImage: AppAssets.egyptFlag,
    ),
    Airport(
      code: 'AMM',
      name: 'Queen Alia International Airport',
      countryName: 'jordan',
      countryNameAr: 'الاردن',
      provanceName: 'عمان',
      countryImage: AppAssets.jordanFlag,
    ),
    Airport(
      code: 'SAW',
      name: 'Sabiha Gokcen International Airport',
      countryName: 'turkey',
      countryNameAr: 'تركيا',
      provanceName: 'صبيحة',
      countryImage: AppAssets.turkeyFlag,
    ),
    Airport(
      code: 'IST',
      name: 'Istanbul Airport',
      countryName: 'turkey',
      countryNameAr: 'تركيا',
      provanceName: 'أتاتورك',
      countryImage: AppAssets.turkeyFlag,
    ),
  ];
}
