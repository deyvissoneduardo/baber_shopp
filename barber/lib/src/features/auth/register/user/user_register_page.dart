// ignore_for_file: unused_local_variable

import 'package:barber/src/core/ui/helpers/context_extension.dart';
import 'package:barber/src/core/ui/helpers/form_helper.dart';
import 'package:barber/src/features/auth/register/user/user_register_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:validatorless/validatorless.dart';

import '../../../../core/ui/helpers/messages.dart';

class UserRegisterPage extends ConsumerStatefulWidget {
  const UserRegisterPage({super.key});

  @override
  ConsumerState<UserRegisterPage> createState() => _UserRegisterPageState();
}

class _UserRegisterPageState extends ConsumerState<UserRegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameEC = TextEditingController();
  final _emailEC = TextEditingController();
  final _passwordEC = TextEditingController();

  @override
  void dispose() {
    _nameEC.dispose();
    _emailEC.dispose();
    _passwordEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final userRegisterVM = ref.watch(userRegisterVmProvider.notifier);

    ref.listen(userRegisterVmProvider, (_, state) {
      switch (state) {
        case UserRegisterStateStatus.inital:
          break;
        case UserRegisterStateStatus.success:
          Messages.showSuccess('ADM Cadastrado', context);
          context.pushNamed('/auth/register/babershop');
        case UserRegisterStateStatus.error:
          Messages.showError(
              'Error ao registrar usuário adminstrador', context);
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('Criar Conta'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(children: [
              const SizedBox(height: 20),
              TextFormField(
                onTapOutside: (_) => context.unfocus(),
                controller: _nameEC,
                validator: Validatorless.required('Nome obrigatório'),
                decoration: const InputDecoration(
                  label: Text('Nome'),
                ),
              ),
              const SizedBox(height: 24),
              TextFormField(
                onTapOutside: (_) => context.unfocus(),
                controller: _emailEC,
                validator: Validatorless.multiple([
                  Validatorless.required('E-mail obrigatório'),
                  Validatorless.email('E-mail obrigatório')
                ]),
                decoration: const InputDecoration(
                  label: Text('E-mail'),
                ),
              ),
              const SizedBox(height: 24),
              TextFormField(
                onTapOutside: (_) => context.unfocus(),
                controller: _passwordEC,
                validator: Validatorless.multiple([
                  Validatorless.required('Senha Obrigatório'),
                  Validatorless.min(6, 'Senha deve ter no minimo 6 caracteres'),
                ]),
                obscureText: true,
                decoration: const InputDecoration(
                  label: Text('Senha'),
                ),
              ),
              const SizedBox(height: 24),
              TextFormField(
                onTapOutside: (_) => context.unfocus(),
                validator: Validatorless.multiple([
                  Validatorless.required('Confirma Senha Obrigatório'),
                  Validatorless.compare(
                      _passwordEC, 'Senha diferente de confirma senha'),
                ]),
                obscureText: true,
                decoration: const InputDecoration(
                  label: Text('Confirmar Senha'),
                ),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(56)),
                onPressed: () {
                  switch (_formKey.currentState?.validate()) {
                    case null || false:
                      Messages.showError('Formulário invalido', context);
                    case true:
                      userRegisterVM.register(
                        name: _nameEC.text.trim(),
                        email: _emailEC.text.trim(),
                        password: _passwordEC.text.trim(),
                      );
                  }
                },
                child: const Text('CRIAR CONTA'),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
