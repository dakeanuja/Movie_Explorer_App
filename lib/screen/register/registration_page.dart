import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/registration/registration_bloc.dart';
import '../../bloc/registration/registration_event.dart';
import '../../bloc/registration/registration_state.dart';
import '../../utils/constants/colors.dart';
import '../../utils/widget/custom_textfield.dart';
import '../login/login_page.dart';

class RegistrationPage extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final _formKey = GlobalKey<FormState>();

  RegistrationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Registration'),
        backgroundColor: Colors.deepPurple,
      ),
      body: BlocProvider(
        create: (context) => RegistrationBloc(),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: BlocConsumer<RegistrationBloc, RegistrationState>(
              listener: (context, state) {
                if (state is RegistrationSuccess) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(state.message)),
                  );
                  Navigator.pop(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                } else if (state is RegistrationFailure) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(state.error)),
                  );
                }
              },
              builder: (context, state) {
                if (state is RegistrationLoading) {
                  return const Center(child: CircularProgressIndicator());
                }
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Text(
                        'Registration ',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepPurple.shade500,
                          shadows: [
                            Shadow(
                              color:
                                  Colors.black.withOpacity(0.3), // Shadow color
                              offset: const Offset(3,
                                  3), // Horizontal and vertical offset of the shadow
                              blurRadius: 5, // Blur radius of the shadow
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [Colors.white, Color(0xFFEEEEEE)],
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        children: [
                          CustomTextField(
                            controller: _nameController,
                            labelText: 'Name',
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your name';
                              }
                              return null;
                            },
                          ),
                          Divider(),
                          CustomTextField(
                            controller: _emailController,
                            labelText: 'Email',
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your email';
                              } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                                  .hasMatch(value)) {
                                return 'Please enter a valid email';
                              }
                              return null;
                            },
                          ),
                          Divider(),
                          CustomTextField(
                            controller: _passwordController,
                            labelText: 'Password',
                            obscureText: true,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your password';
                              } else if (value.length < 6) {
                                return 'Password must be at least 6 characters long';
                              }
                              return null;
                            },
                          ),
                          Divider(),
                          CustomTextField(
                            controller: _confirmPasswordController,
                            labelText: 'Confirm Password',
                            obscureText: true,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please confirm your password';
                              } else if (value != _passwordController.text) {
                                return 'Passwords do not match';
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                    ),
                    // CustomTextField(
                    //   controller: _emailController,
                    //   labelText: 'Email',
                    //   keyboardType: TextInputType.emailAddress,
                    //   validator: (value) {
                    //     if (value == null || value.isEmpty) {
                    //       return 'Please enter your email';
                    //     } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                    //         .hasMatch(value)) {
                    //       return 'Please enter a valid email';
                    //     }
                    //     return null;
                    //   },
                    // ),
                    // CustomTextField(
                    //   controller: _passwordController,
                    //   labelText: 'Password',
                    //   obscureText: true,
                    //   validator: (value) {
                    //     if (value == null || value.isEmpty) {
                    //       return 'Please enter your password';
                    //     } else if (value.length < 6) {
                    //       return 'Password must be at least 6 characters long';
                    //     }
                    //     return null;
                    //   },
                    // ),
                    // CustomTextField(
                    //   controller: _confirmPasswordController,
                    //   labelText: 'Confirm Password',
                    //   obscureText: true,
                    //   validator: (value) {
                    //     if (value == null || value.isEmpty) {
                    //       return 'Please confirm your password';
                    //     } else if (value != _passwordController.text) {
                    //       return 'Passwords do not match';
                    //     }
                    //     return null;
                    //   },
                    // ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          //backgroundColor: Colors.deepPurple,
                          foregroundColor: Appcolor.white),
                      onPressed: () {
                        if (_formKey.currentState?.validate() ?? false) {
                          final name = _nameController.text;
                          final email = _emailController.text;
                          final password = _passwordController.text;
                          final confirmPassword =
                              _confirmPasswordController.text;

                          context.read<RegistrationBloc>().add(
                                RegisterUser(
                                  name: name,
                                  email: email,
                                  password: password,
                                  confirmPassword: confirmPassword,
                                ),
                              );
                        }
                      },
                      child: const Text('Register'),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Already have an account?',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w700),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginPage()),
                            );
                          },
                          child: const Text('Login',
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                              )),
                        )
                      ],
                    )
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
