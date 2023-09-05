import 'dart:developer';

import 'package:barber/src/core/ui/barbershop_icons.dart';
import 'package:barber/src/core/ui/helpers/colors_constants.dart';
import 'package:barber/src/features/home/adm/home_adm_state.dart';
import 'package:barber/src/features/home/adm/home_adm_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/ui/widgets/babershop_loader.dart';
import '../widgets/home_header.dart';
import 'widgets/home_employee_tile.dart';

class HomeAdmPage extends ConsumerWidget {
  const HomeAdmPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeState = ref.watch(homeAdmVmProvider);

    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          shape: const CircleBorder(),
          backgroundColor: ColorsConstants.brow,
          onPressed: () async {
            await Navigator.of(context).pushNamed('/employee/register');
            ref.invalidate(homeAdmVmProvider);
          },
          child: const CircleAvatar(
            backgroundColor: Colors.white,
            maxRadius: 12,
            child: Icon(
              BarbershopIcons.addEmplyeee,
              color: ColorsConstants.brow,
            ),
          ),
        ),
        body: homeState.when(
          data: (HomeAdmState data) {
            return CustomScrollView(
              slivers: [
                const SliverToBoxAdapter(
                  child: HomeHeader(),
                ),
                SliverList(
                    delegate: SliverChildBuilderDelegate(
                  (context, index) =>
                      HomeEmployeeTile(employee: data.employees[index]),
                  childCount: data.employees.length,
                )),
              ],
            );
          },
          error: (error, stackTrace) {
            log('Erro ao carregar colaboradores',
                error: error, stackTrace: stackTrace);
            return const Center(
              child: Text('Erro ao carregar pagina '),
            );
          },
          loading: () {
            return const BarbershopLoader();
          },
        ),
      ),
    );
  }
}
