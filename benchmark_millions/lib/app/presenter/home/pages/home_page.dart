import 'package:benchmark_millions/app/routes/app_pages.dart';
import 'package:benchmark_millions/app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'package:rive/rive.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.transparent,
        backgroundColor: Colors.indigo[50],
        elevation: 0,
        title: const Text(
          'Benchmark Millions',
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.settings,
                color: Colors.black,
              ))
        ],
      ),
      body: Container(
        color: Colors.indigo[50],
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            SizedBox(
              height: 200,
              width: double.infinity,
              child: Card(
                elevation: 10,
                color: const Color(0xFF94936E),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const RiveAnimation.asset('assets/animation/celtic.riv'),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: const CardArca(
                      iconSvg: 'assets/icons/document.svg',
                      initials: 'A',
                      description: 'Ações',
                      color: Colors.blue,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Get.toNamed(Routes.REAL_ESTATE),
                    child: const CardArca(
                      iconSvg: 'assets/icons/building.svg',
                      initials: 'R',
                      description: 'Real Estate',
                      color: Colors.green,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: const CardArca(
                      iconSvg: 'assets/icons/fix.svg',
                      initials: 'C',
                      description: 'Caixa',
                      color: Colors.orange,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: const CardArca(
                      iconSvg: 'assets/icons/gold.svg',
                      initials: 'A',
                      description: 'Ativos internacionais',
                      color: Colors.amber,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CardArca extends StatelessWidget {
  final String iconSvg;
  final String initials;
  final String description;
  final Color color;

  const CardArca({
    Key? key,
    required this.iconSvg,
    required this.initials,
    required this.description,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SvgPicture.asset(
                  iconSvg,
                  color: color,
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      initials,
                      style: TextStyle(fontSize: 30, color: color),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              description,
              style: const TextStyle(fontSize: 12),
            ),
            const Spacer(),
            Container(
              height: 5,
              decoration: BoxDecoration(
                color: color,
                borderRadius: const BorderRadius.all(
                  Radius.circular(50),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
