import 'package:flutter/material.dart';

/// Experiment 7(b): Form Validation and Robust Error Handling
class Exp7bFormValidationScreen extends StatefulWidget {
  const Exp7bFormValidationScreen({super.key});

  @override
  State<Exp7bFormValidationScreen> createState() => _Exp7bFormValidationScreenState();
}

class _Exp7bFormValidationScreenState extends State<Exp7bFormValidationScreen> {
  final _formKey = GlobalKey<FormState>();

  final _usernameController = TextEditingController(text: 'Rupali Singh');
  final _emailController = TextEditingController(text: 'invalid-email-format');
  final _passwordController = TextEditingController(text: 'Pass123!');
  bool _termsAccepted = false;
  bool _submittedOnce = false;

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _validateAndSubmit() {
    setState(() => _submittedOnce = true);

    if (_formKey.currentState!.validate()) {
      if (!_termsAccepted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Please accept terms of service to proceed.'),
            backgroundColor: Colors.red,
          ),
        );
        return;
      }

      // Success Modal
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          icon: const Icon(Icons.check_circle, color: Colors.green, size: 48),
          title: const Text('Validation Succeeded!'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Username : ${_usernameController.text}'),
              Text('Email    : ${_emailController.text}'),
              const Text('Status   : All field regex rules verified.'),
            ],
          ),
          actions: [
            TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Done')),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exp 7(b): Form Validation & Errors'),
        backgroundColor: Colors.rose.shade800,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 620),
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: Card(
              elevation: 3,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Form(
                  key: _formKey,
                  autovalidateMode: _submittedOnce
                      ? AutovalidateMode.onUserInteraction
                      : AutovalidateMode.disabled,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Text(
                        'Secure Account Verification',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        'Real-time regular expression checks and inline error styling.',
                        style: TextStyle(color: Colors.grey.shade600, fontSize: 13),
                      ),
                      const Divider(height: 28),

                      // 1. Username Validator
                      TextFormField(
                        controller: _usernameController,
                        decoration: const InputDecoration(
                          labelText: 'Username',
                          prefixIcon: Icon(Icons.person),
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Username cannot be blank';
                          }
                          if (value.trim().length < 3) {
                            return 'Must be at least 3 characters';
                          }
                          return null; // Valid
                        },
                      ),
                      const SizedBox(height: 18),

                      // 2. Email Regex Validator
                      TextFormField(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          labelText: 'Email Address',
                          prefixIcon: Icon(Icons.email),
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Email address is required';
                          }
                          final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                          if (!emailRegex.hasMatch(value.trim())) {
                            return 'Please enter a valid email address (e.g. name@domain.com)';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 18),

                      // 3. Password Strength Validator
                      TextFormField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: const InputDecoration(
                          labelText: 'Password',
                          prefixIcon: Icon(Icons.lock),
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Password is required';
                          }
                          if (value.length < 8) {
                            return 'Password must be at least 8 characters long';
                          }
                          if (!RegExp(r'[0-9]').hasMatch(value)) {
                            return 'Password must contain at least one digit';
                          }
                          if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
                            return 'Password must contain at least one special symbol';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 14),

                      // 4. Terms Checkbox with validation hint
                      CheckboxListTile(
                        contentPadding: EdgeInsets.zero,
                        title: const Text('I agree to developer security compliance standards', style: TextStyle(fontSize: 12)),
                        value: _termsAccepted,
                        onChanged: (val) => setState(() => _termsAccepted = val ?? false),
                      ),
                      const SizedBox(height: 16),

                      // Submit Trigger
                      ElevatedButton.icon(
                        icon: const Icon(Icons.verified_user),
                        label: const Text('Validate & Submit Form'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.rose.shade800,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 14),
                        ),
                        onPressed: _validateAndSubmit,
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
