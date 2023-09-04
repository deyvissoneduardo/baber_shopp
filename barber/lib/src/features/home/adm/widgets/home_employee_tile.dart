import 'package:barber/src/core/ui/barbershop_icons.dart';
import 'package:barber/src/core/ui/helpers/colors_constants.dart';
import 'package:barber/src/core/ui/helpers/images_constants.dart';
import 'package:flutter/material.dart';

class HomeEmployeeTile extends StatelessWidget {
  final imageNetwork = false;
  const HomeEmployeeTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 100,
      margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(
          color: ColorsConstants.gray,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Container(
            height: 56,
            width: 56,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: switch (imageNetwork) {
                true => const NetworkImage('url'),
                false => const AssetImage(ImagesConstants.avatar),
              } as ImageProvider),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Nome Sobrenome',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(horizontal: 12)),
                      onPressed: () {},
                      child: const Text('AGENDAR'),
                    ),
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(horizontal: 12)),
                      onPressed: () {},
                      child: const Text('VER AGENDA'),
                    ),
                    const Icon(
                      BarbershopIcons.penEdit,
                      size: 16,
                      color: ColorsConstants.brow,
                    ),
                    const Icon(
                      BarbershopIcons.trash,
                      size: 16,
                      color: ColorsConstants.red,
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
