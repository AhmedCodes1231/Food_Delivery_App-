import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'otp_page.dart';
import '../../../../core/constants/app_colors.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class SignupPage extends StatefulWidget {
  final String? selectedRole;

  const SignupPage({super.key, this.selectedRole});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormBuilderState>();
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              _buildHeader(context),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 32,
                ),
                child: FormBuilder(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildLabel("NAME"),
                      _buildFormTextField(
                        name: "name",
                        hint: "John Doe",
                        icon: Icons.person_outline,
                        validators: [FormBuilderValidators.required()],
                      ),
                      const SizedBox(height: 24),

                      _buildLabel("EMAIL"),
                      _buildFormTextField(
                        name: "email",
                        hint: "example@gmail.com",
                        icon: Icons.email_outlined,
                        keyboardType: TextInputType.emailAddress,
                        validators: [
                          FormBuilderValidators.required(),
                          FormBuilderValidators.email(),
                        ],
                      ),
                      const SizedBox(height: 24),

                      _buildLabel("PASSWORD"),
                      _buildFormTextField(
                        name: "password",
                        hint: "••••••••",
                        icon: Icons.lock_outline,
                        isPassword: true,
                        obscureText: _obscurePassword,
                        onToggle: () => setState(
                          () => _obscurePassword = !_obscurePassword,
                        ),
                        validators: [
                          FormBuilderValidators.required(),
                          FormBuilderValidators.minLength(10),
                          FormBuilderValidators.match(
                            RegExp(
                              r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[\W_]).{10,}$',
                            ),
                            errorText:
                                "Must contain uppercase, lowercase, number and symbol",
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),

                      _buildLabel("RE-TYPE PASSWORD"),
                      _buildFormTextField(
                        name: "confirm_password",
                        hint: "••••••••",
                        icon: Icons.lock_outline,
                        isPassword: true,
                        obscureText: _obscureConfirmPassword,
                        onToggle: () => setState(
                          () => _obscureConfirmPassword =
                              !_obscureConfirmPassword,
                        ),
                        validators: [
                          FormBuilderValidators.required(),
                          (val) {
                            if (val !=
                                _formKey
                                    .currentState
                                    ?.fields['password']
                                    ?.value) {
                              return "Passwords do not match";
                            }
                            return null;
                          },
                        ],
                      ),
                      const SizedBox(height: 40),

                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState?.saveAndValidate() ??
                              false) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const OTPPage(),
                              ),
                            );
                          }
                        },
                        child: const Text("SIGN UP"),
                      ),
                      const SizedBox(height: 24),

                      _buildLoginPrompt(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      height: 250,
      width: double.infinity,
      color: AppColors.secondary,
      child: Stack(
        children: [
          // Top Left Pattern (Splash Page_01)
          Positioned(
            top: 10,
            left: 10,
            child: Transform.flip(
              flipX: true, // هذا الخيار يقلب الصورة من فوق لتحت
              flipY: true, // هذا الخيار يقلب الصورة من فوق لتحت
              child: SvgPicture.asset(
                'assets/icons/splash_page_02.svg',
                width: 150,
                colorFilter: ColorFilter.mode(
                  Colors.white.withValues(alpha: 0.08),
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),

          // Top Right Pattern (Splash Page_02)
          Positioned(
            top: 50,
            left: 24,
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.arrow_back,
                  color: AppColors.secondary,
                  size: 20,
                ),
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                const Text(
                  "Sign Up",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  "Please sign up to get started",
                  style: TextStyle(color: Colors.white70, fontSize: 16),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0, left: 4),
      child: Text(
        text,
        style: const TextStyle(
          color: AppColors.secondary,
          fontSize: 12,
          fontWeight: FontWeight.bold,
          letterSpacing: 1,
        ),
      ),
    );
  }

  Widget _buildFormTextField({
    required String name,
    required String hint,
    required IconData icon,
    bool isPassword = false,
    bool obscureText = false,
    VoidCallback? onToggle,
    TextInputType? keyboardType,
    List<String? Function(String?)>? validators,
  }) {
    return FormBuilderTextField(
      name: name,
      obscureText: obscureText,
      keyboardType: keyboardType,
      validator: FormBuilderValidators.compose(validators ?? []),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: AppColors.grey),
        filled: true,
        fillColor: const Color(0xFFF6F6F6),
        prefixIcon: Icon(icon, color: AppColors.grey),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 20,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: AppColors.primary, width: 1),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Colors.red, width: 1),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Colors.red, width: 1),
        ),
        suffixIcon: isPassword
            ? IconButton(
                icon: Icon(
                  obscureText ? Icons.visibility_off : Icons.visibility,
                  color: AppColors.grey,
                ),
                onPressed: onToggle,
              )
            : null,
      ),
    );
  }

  Widget _buildLoginPrompt() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Already have an account? ",
          style: TextStyle(color: Color(0xFF7E8389)),
        ),
        GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Text(
            "LOG IN",
            style: TextStyle(
              color: AppColors.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
