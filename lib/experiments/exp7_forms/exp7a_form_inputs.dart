import 'package:flutter/material.dart';

/// Experiment 7(a): Design a Form with Various Input Fields
class Exp7aFormInputsScreen extends StatefulWidget {
  const Exp7aFormInputsScreen({super.key});

  @override
  State<Exp7aFormInputsScreen> createState() => _Exp7aFormInputsScreenState();
}

class _Exp7aFormInputsScreenState extends State<Exp7aFormInputsScreen> {
  final _formKey = GlobalKey<FormState>();

  // Form Field States
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;
  String _selectedRole = 'Mobile Engineer (Flutter)';
  double _experienceYears = 3.0;
  bool _notificationsEnabled = true;
  String _employmentType = 'Full-Time';
  bool _termsAccepted = false;
  DateTime? _selectedDate = DateTime(2000, 1, 1);

  final List<String> _roles = [
    'Mobile Engineer (Flutter)',
    'Frontend Developer (React/Vue)',
    'Backend Engineer (Go/Node)',
    'DevOps & Cloud Architect',
  ];

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exp 7(a): Interactive Form Input Fields'),
        backgroundColor: Colors.teal.shade800,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 680),
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: Card(
              elevation: 3,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Text(
                        'Developer Profile Registration',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        'Demonstrates diverse Flutter input controls and form state handling.',
                        style: TextStyle(color: Colors.grey.shade600, fontSize: 13),
                      ),
                      const Divider(height: 28),

                      // 1. Text Field: Full Name
                      TextFormField(
                        controller: _nameController,
                        decoration: const InputDecoration(
                          labelText: 'Full Name',
                          hintText: 'Enter your legal name',
                          prefixIcon: Icon(Icons.person_outline),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 16),

                      // 2. Text Field: Email
                      TextFormField(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          labelText: 'Email Address',
                          hintText: 'name@example.com',
                          prefixIcon: Icon(Icons.email_outlined),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 16),

                      // 3. Text Field: Password with toggle
                      TextFormField(
                        controller: _passwordController,
                        obscureText: _obscurePassword,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          prefixIcon: const Icon(Icons.lock_outline),
                          suffixIcon: IconButton(
                            icon: Icon(_obscurePassword ? Icons.visibility_off : Icons.visibility),
                            onPressed: () => setState(() => _obscurePassword = !_obscurePassword),
                          ),
                          border: const OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 16),

                      // 4. Dropdown Selection
                      DropdownButtonFormField<String>(
                        value: _selectedRole,
                        decoration: const InputDecoration(
                          labelText: 'Primary Technical Role',
                          prefixIcon: Icon(Icons.work_outline),
                          border: OutlineInputBorder(),
                        ),
                        items: _roles.map((r) => DropdownMenuItem(value: r, child: Text(r))).toList(),
                        onChanged: (val) {
                          if (val != null) setState(() => _selectedRole = val);
                        },
                      ),
                      const SizedBox(height: 20),

                      // 5. Slider Input
                      Text(
                        'Years of Experience: ${_experienceYears.toInt()} years',
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                      Slider(
                        value: _experienceYears,
                        min: 0,
                        max: 15,
                        divisions: 15,
                        label: '${_experienceYears.toInt()} yrs',
                        onChanged: (val) => setState(() => _experienceYears = val),
                      ),
                      const SizedBox(height: 10),

                      // 6. Switch Toggle
                      SwitchListTile(
                        contentPadding: EdgeInsets.zero,
                        title: const Text('Email Notifications'),
                        subtitle: const Text('Receive digest updates and release alerts'),
                        value: _notificationsEnabled,
                        onChanged: (val) => setState(() => _notificationsEnabled = val),
                      ),
                      const Divider(),

                      // 7. Radio Group
                      const Text('Employment Preference:', style: TextStyle(fontWeight: FontWeight.w600)),
                      Row(
                        children: [
                          Expanded(
                            child: RadioListTile<String>(
                              title: const Text('Full-Time', style: TextStyle(fontSize: 13)),
                              value: 'Full-Time',
                              groupValue: _employmentType,
                              onChanged: (val) => setState(() => _employmentType = val!),
                            ),
                          ),
                          Expanded(
                            child: RadioListTile<String>(
                              title: const Text('Contract', style: TextStyle(fontSize: 13)),
                              value: 'Contract',
                              groupValue: _employmentType,
                              onChanged: (val) => setState(() => _employmentType = val!),
                            ),
                          ),
                        ],
                      ),

                      // 8. Checkbox
                      CheckboxListTile(
                        contentPadding: EdgeInsets.zero,
                        title: const Text('I accept the terms of service and privacy policy', style: TextStyle(fontSize: 13)),
                        value: _termsAccepted,
                        onChanged: (val) => setState(() => _termsAccepted = val ?? false),
                      ),
                      const SizedBox(height: 20),

                      // Submit Button
                      ElevatedButton.icon(
                        icon: const Icon(Icons.send),
                        label: const Text('Register Developer Profile'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.teal.shade800,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 14),
                        ),
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Form Submitted: ${_nameController.text.isEmpty ? "Rupali" : _nameController.text} ($_selectedRole)'),
                              backgroundColor: Colors.teal,
                            ),
                          );
                        },
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
