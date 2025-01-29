import 'package:flutter/material.dart';
import 'package:flutter_debouncer/flutter_debouncer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nes_kanban_app/features/auth/signin_viewmodel.dart';
import 'package:nes_ui/nes_ui.dart';

class SigninScreen extends ConsumerWidget {
  SigninScreen({super.key});

  final formKey = GlobalKey<FormState>();
  final debouncer = Debouncer();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.read(signinScreenViewModel.notifier);
    final state = ref.watch(signinScreenViewModel);
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: NesScaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Center(
              child: Form(
                key: formKey,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(20, screenHeight * 0.2, 20, 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      NesPulser(
                        duration: const Duration(milliseconds: 400),
                        interval: const Duration(milliseconds: 500),
                        child: const Text(
                          'NES Kanban',
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.1),
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Username',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Enter your username';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          viewModel.saveFields(username: value);
                        },
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        keyboardType: state.isPasswordVisible
                            ? TextInputType.visiblePassword
                            : null,
                        autofillHints: const [AutofillHints.password],
                        decoration: InputDecoration(
                          labelText: 'Password',
                          suffixIcon: IconButton(
                            icon: Icon(
                              state.isPasswordVisible
                                  ? Icons.visibility_rounded
                                  : Icons.visibility_off_rounded,
                            ),
                            onPressed: viewModel.togglePasswordVisibility,
                          ),
                        ),
                        obscureText: !state.isPasswordVisible,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Enter your password';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          viewModel.saveFields(password: value);
                        },
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Forgot password?',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      state.signinState.when(
                        data: (_) => const SizedBox.shrink(),
                        loading: () => const NesTerminalLoadingIndicator(),
                        error: (e, s) => Text(
                          e is ArgumentError
                              ? e.message
                              : 'Failed to sign in. Please try again.',
                          style: const TextStyle(
                            color: Colors.red,
                            fontSize: 10,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(height: 45),
                      Column(
                        spacing: 20,
                        children: [
                          NesButton.text(
                            type: NesButtonType.normal,
                            onPressed: () {
                              viewModel.reset();
                              if (formKey.currentState!.validate()) {
                                debouncer.debounce(
                                  duration: Durations.medium2,
                                  onDebounce: () {
                                    formKey.currentState!.save();
                                    viewModel.submit();
                                  },
                                );
                              } else {
                                debouncer.cancel();
                              }
                            },
                            text: 'Sign in',
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: NesContainer(height: 3),
                                ),
                              ),
                              const Text('or'),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: NesContainer(height: 3),
                                ),
                              ),
                            ],
                          ),
                          NesButton.text(
                            type: NesButtonType.normal,
                            onPressed: () {},
                            text: 'Create an account',
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
