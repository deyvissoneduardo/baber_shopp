import 'package:barber/src/core/ui/helpers/colors_constants.dart';
import 'package:barber/src/core/ui/helpers/form_helper.dart';
import 'package:barber/src/core/ui/helpers/images_constants.dart';
import 'package:barber/src/core/ui/helpers/messages.dart';
import 'package:barber/src/features/auth/login/login_state.dart';
import 'package:barber/src/features/auth/login/login_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:validatorless/validatorless.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailEC = TextEditingController();
  final _passwordEC = TextEditingController();

  @override
  void dispose() {
    _emailEC.dispose();
    _passwordEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final LoginVM(:login) = ref.watch(loginVMProvider.notifier);
    ref.listen(loginVMProvider, (previous, state) {
      switch (state) {
        case LoginState(status: LoginStateStatus.initial):
          break;
        case LoginState(status: LoginStateStatus.error, :final errorMessage?):
          Messages.showError(errorMessage, context);
        case LoginState(status: LoginStateStatus.error):
          Messages.showError('Error ao realizar login.', context);
        case LoginState(status: LoginStateStatus.adminLogin):
          break;
        case LoginState(status: LoginStateStatus.employeelogin):
          break;
      }
    });
    return Scaffold(
      backgroundColor: Colors.black,
      body: Form(
        key: _formKey,
        child: DecoratedBox(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(ImagesConstants.backgroundChair),
              opacity: 0.5,
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: CustomScrollView(
              slivers: [
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            ImagesConstants.imgLogo,
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          TextFormField(
                            controller: _emailEC,
                            onTapOutside: (_) => context.unfocus(),
                            decoration: const InputDecoration(
                              label: Text('E-mail'),
                              hintText: 'E-mail',
                              labelStyle: TextStyle(color: Colors.black),
                              hintStyle: TextStyle(color: Colors.black),
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                            ),
                            validator: Validatorless.multiple([
                              Validatorless.required('obrigatorio'),
                              Validatorless.email('invalido')
                            ]),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          TextFormField(
                            controller: _passwordEC,
                            onTapOutside: (_) => context.unfocus(),
                            obscureText: true,
                            decoration: const InputDecoration(
                              label: Text('Senha'),
                              hintText: 'Senha',
                              labelStyle: TextStyle(color: Colors.black),
                              hintStyle: TextStyle(color: Colors.black),
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                            ),
                            validator: Validatorless.multiple([
                              Validatorless.required('obrigatorio'),
                              Validatorless.min(6, 'minimo seis')
                            ]),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: TextButton(
                              onPressed: () {},
                              child: const Text(
                                'Esqueceu a senha?',
                                style: TextStyle(
                                  color: ColorsConstants.brow,
                                  fontSize: 12.0,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              minimumSize: const Size.fromHeight(56),
                            ),
                            onPressed: () {
                              switch (_formKey.currentState?.validate()) {
                                case false || null:
                                  Messages.showError(
                                      'campos invalidos', context);
                                case true:
                                  login(_emailEC.text.trim(),
                                      _passwordEC.text.trim());
                                  break;
                              }
                            },
                            child: const Text(
                              'Acessar',
                            ),
                          )
                        ],
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Criar Conta',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
