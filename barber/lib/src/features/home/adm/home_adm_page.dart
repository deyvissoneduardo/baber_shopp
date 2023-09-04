import 'package:barber/src/core/ui/barbershop_icons.dart';
import 'package:barber/src/core/ui/helpers/colors_constants.dart';
import 'package:barber/src/features/home/adm/widgets/home_employee_tile.dart';
import 'package:barber/src/features/home/widgets/home_header.dart';
import 'package:flutter/material.dart';

class HomeAdmPage extends StatelessWidget {
  const HomeAdmPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        shape: const CircleBorder(),
        backgroundColor: ColorsConstants.brow,
        child: const CircleAvatar(
          backgroundColor: Colors.white,
          maxRadius: 12,
          child: Icon(
            BarbershopIcons.addEmplyeee,
            color: ColorsConstants.brow,
          ),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
            child: HomeHeader(),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: 20,
              (context, index) {
                return const HomeEmployeeTile();
              },
            ),
          ),
        ],
      ),
    );
  }
}
