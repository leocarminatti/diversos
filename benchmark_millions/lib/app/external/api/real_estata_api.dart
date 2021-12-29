import 'package:benchmark_millions/app/domain/model/real_estate.dart';
import 'package:benchmark_millions/app/infra/datasource/real_estate_datasource.dart';
import 'package:http/http.dart';
import 'package:html/parser.dart';

class RealEstateApi implements RealEstateDataSource {
  final Client client;

  RealEstateApi(this.client);

  @override
  Future<List<RealEstate>> getRealEstates() async {
    final response = await client.get(Uri.parse('https://www.fundsexplorer.com.br/ranking'));

    if (response.statusCode == 200) {
      var document = parse(response.body);

      final t = document.querySelectorAll('table > tbody > tr');

      final List<RealEstate> list = [];

      for (var valor in t) {
        final currentPrice = valor.getElementsByTagName('td')[2].text != 'N/A'
            ? double.parse(valor
                .getElementsByTagName('td')[2]
                .text
                .replaceAll('R\$', '')
                .replaceAll('.', '')
                .replaceAll(',', '.'))
            : 0.0;

        final dailyLiquidity = valor.getElementsByTagName('td')[3].text != 'N/A'
            ? double.parse(valor.getElementsByTagName('td')[3].text.replaceAll(',', '.'))
            : 0.0;

        final dividendYieldPercent = valor.getElementsByTagName('td')[5].text != 'N/A'
            ? double.parse(
                valor.getElementsByTagName('td')[5].text.replaceAll('%', '').replaceAll(',', '.'))
            : 0.0;

        final dividendYieldAccumulated = valor.getElementsByTagName('td')[8].text != 'N/A'
            ? double.parse(
                valor.getElementsByTagName('td')[8].text.replaceAll('%', '').replaceAll(',', '.'))
            : 0.0;

        final dividendYieldMedia = valor.getElementsByTagName('td')[11].text != 'N/A'
            ? double.parse(
                valor.getElementsByTagName('td')[11].text.replaceAll('%', '').replaceAll(',', '.'))
            : 0.0;

        final dividendYield = valor.getElementsByTagName('td')[12].text != 'N/A'
            ? double.parse(
                valor.getElementsByTagName('td')[12].text.replaceAll('%', '').replaceAll(',', '.'))
            : 0.0;

        final marketValue = valor.getElementsByTagName('td')[16].text != 'N/A'
            ? double.parse(valor
                .getElementsByTagName('td')[16]
                .text
                .replaceAll('R\$', '')
                .replaceAll('.', '')
                .replaceAll(',', '.'))
            : 0.0;

        final vp = valor.getElementsByTagName('td')[17].text != 'N/A'
            ? double.parse(valor
                .getElementsByTagName('td')[17]
                .text
                .replaceAll('R\$', '')
                .replaceAll('.', '')
                .replaceAll(',', '.'))
            : 0.0;

        final pvp = valor.getElementsByTagName('td')[18].text != 'N/A'
            ? double.parse(valor.getElementsByTagName('td')[18].text.replaceAll(',', '.'))
            : 0.0;

        final fii = RealEstate(
          title: valor.getElementsByTagName('td')[0].text,
          sector: valor.getElementsByTagName('td')[1].text,
          currentPrice: currentPrice,
          dailyLiquidity: dailyLiquidity,
          dividendYieldPercent: dividendYieldPercent,
          dividendYieldAccumulated: dividendYieldAccumulated,
          dividendYield: dividendYield,
          dividendYieldMedia: dividendYieldMedia,
          marketValue: marketValue,
          vp: vp,
          pvp: pvp,
        );

        list.add(fii);
      }
      list.sort((a, b) => a.title.compareTo(b.title));

      return list;
    } else {
      throw Exception();
    }
  }
}
