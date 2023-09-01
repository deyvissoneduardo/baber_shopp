import 'package:barber/src/core/ui/helpers/form_helper.dart';
import 'package:barber/src/core/ui/widgets/hours_panel.dart';
import 'package:barber/src/core/ui/widgets/weekdays_page.dart';
import 'package:flutter/material.dart';

class BarbershopRegisterPage extends StatelessWidget {
  const BarbershopRegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Criar Estabelecimento'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextFormField(
                onTapOutside: (_) => context.unfocus(),
                decoration: const InputDecoration(label: Text('Nome')),
              ),
              const SizedBox(
                height: 24,
              ),
              TextFormField(
                onTapOutside: (_) => context.unfocus(),
                decoration: const InputDecoration(label: Text('E-mail')),
              ),
              const SizedBox(
                height: 24,
              ),
              const WeekdaysPage(),
              const SizedBox(
                height: 24,
              ),
              const HoursPanel(
                startTime: 6,
                endTime: 23,
              ),
              const SizedBox(
                height: 24,
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(56)),
                child: const Text('Cadastrar Estabelicimento'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
