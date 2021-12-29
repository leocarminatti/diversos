class RealEstate {
  String title;
  String sector;
  double currentPrice;
  double dailyLiquidity;
  double dividendYieldPercent;
  double dividendYieldAccumulated;
  double dividendYield;
  double dividendYieldMedia;
  double marketValue;
  double vp;
  double pvp;

  RealEstate({
    required this.title,
    required this.sector,
    required this.currentPrice,
    required this.dailyLiquidity,
    required this.dividendYieldPercent,
    required this.dividendYieldAccumulated,
    required this.dividendYield,
    required this.dividendYieldMedia,
    required this.marketValue,
    required this.vp,
    required this.pvp,
  });
}
