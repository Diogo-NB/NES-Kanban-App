import 'package:flutter/material.dart';
import 'package:flutter_debouncer/flutter_debouncer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nes_kanban_app/features/auth/presentation/signin_viewmodel.dart';
import 'package:nes_ui/nes_ui.dart';

class SigninScreen extends ConsumerWidget {
  SigninScreen({super.key});

  final formKey = GlobalKey<FormState>(debugLabel: 'signin_screen_form');
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
                        autofillHints: const [AutofillHints.email],
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(labelText: 'Email'),
                        style: const TextStyle(fontSize: 12),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Enter your email';
                          }
                          return null;
                        },
                        onSaved: viewModel.saveEmail,
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        autofillHints: const [AutofillHints.password],
                        obscureText: !state.isPasswordVisible,
                        keyboardType: state.isPasswordVisible
                            ? TextInputType.visiblePassword
                            : null,
                        style: const TextStyle(fontSize: 12),
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
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Enter your password';
                          }
                          return null;
                        },
                        onSaved: viewModel.savePassword,
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
                          e.toString(),
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
                              viewModel.resetErrorMessage();
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
                                    horizontal: 10,
                                  ),
                                  child: NesContainer(height: 3),
                                ),
                              ),
                              const Text('or'),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 10,
                                  ),
                                  child: NesContainer(height: 3),
                                ),
                              ),
                            ],
                          ),
                          NesButton.text(
                            type: NesButtonType.normal,
                            text: 'Create an account',
                            onPressed: () {},
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
