import 'dart:developer';

import 'package:barber/src/core/providers/application_providers.dart';
import 'package:barber/src/core/ui/helpers/colors_constants.dart';
import 'package:barber/src/core/ui/helpers/form_helper.dart';
import 'package:barber/src/core/ui/helpers/messages.dart';
import 'package:barber/src/core/ui/widgets/avatar_widget.dart';
import 'package:barber/src/core/ui/widgets/babershop_loader.dart';
import 'package:barber/src/core/ui/widgets/hours_panel.dart';
import 'package:barber/src/core/ui/widgets/weekdays_page.dart';
import 'package:barber/src/features/employee/register/employee_register_state.dart';
import 'package:barber/src/features/employee/register/employee_register_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:validatorless/validatorless.dart';

class EmployeeRegisterPage extends ConsumerStatefulWidget {
  const EmployeeRegisterPage({super.key});

  @override
  ConsumerState<EmployeeRegisterPage> createState() =>
      _EmployeeRegisterPageState();
}

class _EmployeeRegisterPageState extends ConsumerState<EmployeeRegisterPage> {
  var registerADM = false;
  final nameEC = TextEditingController();
  final emailEC = TextEditingController();
  final passwordEC = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    nameEC.dispose();
    emailEC.dispose();
    passwordEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final employeeeRegisterVM = ref.watch(employeeRegisterVmProvider.notifier);
    final barbershopAsyncValue = ref.watch(getMyBarbershopProvider);

    ref.listen(employeeRegisterVmProvider.select((state) => state.status),
        (_, status) {
      switch (status) {
        case EmployeeRegisterStateStatus.initial:
          break;
        case EmployeeRegisterStateStatus.success:
          Messages.showSuccess('Colaborador cadastrado com sucesso', context);
          Navigator.pop(context);
        case EmployeeRegisterStateStatus.error:
          Messages.showError('Erro ao registrar colaborador', context);
      }
    });
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastrar Colaborador'),
      ),
      body: barbershopAsyncValue.when(
        data: (data) => SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Center(
              child: Column(
                children: [
                  const AvatarWidget(),
                  const SizedBox(
                    height: 32,
                  ),
                  Row(
                    children: [
                      Checkbox.adaptive(
                          activeColor: ColorsConstants.brow,
                          value: registerADM,
                          onChanged: (value) {
                            setState(() {
                              registerADM = !registerADM;
                              employeeeRegisterVM.setRegisterADM(registerADM);
                            });
                          }),
                      const Expanded(
                        child: Text(
                          'Sou adminstrador e quero me cadastrar como colaborador',
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      )
                    ],
                  ),
                  Offstage(
                    offstage: registerADM,
                    child: Form(
                      key: formKey,
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 24,
                          ),
                          TextFormField(
                            controller: nameEC,
                            onTapOutside: (_) => context.unfocus(),
                            decoration:
                                const InputDecoration(label: Text('Nome')),
                            validator: Validatorless.required('obrigatorio'),
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          TextFormField(
                            controller: emailEC,
                            onTapOutside: (_) => context.unfocus(),
                            decoration:
                                const InputDecoration(label: Text('E-mail')),
                            validator: Validatorless.multiple([
                              Validatorless.required('obrigatorio'),
                              Validatorless.email('e-mail invalido'),
                            ]),
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          TextFormField(
                            controller: passwordEC,
                            onTapOutside: (_) => context.unfocus(),
                            obscureText: true,
                            decoration:
                                const InputDecoration(label: Text('Senha')),
                            validator: Validatorless.multiple([
                              Validatorless.required('obrigatorio'),
                              Validatorless.min(6, 'minimo 6'),
                            ]),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  WeekdaysPanel(
                    enabledDays: barbershopAsyncValue.value!.openingDays,
                    onDayPressed: employeeeRegisterVM.addOrRemoveWorkdays,
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  HoursPanel(
                    startTime: 6,
                    endTime: 23,
                    onHourPressed: employeeeRegisterVM.addOrRemoveWorkhours,
                    enabledTimes: barbershopAsyncValue.value!.openingHours,
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size.fromHeight(56)),
                    child: const Text('Cadastrar Colaborador'),
                  )
                ],
              ),
            ),
          ),
        ),
        error: (error, stackTrace) {
          log('Error ao carregar pagina', error: error, stackTrace: stackTrace);
          return const Center(
            child: Text('Error ao carregar pagina'),
          );
        },
        loading: () => const Center(
          child: BarbershopLoader(),
        ),
      ),
    );
  }
}
