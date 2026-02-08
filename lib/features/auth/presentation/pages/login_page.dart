import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/constants/app_colors.dart';
import 'signup_page.dart';
import 'forgot_password_page.dart';
import '../../../user_app/presentation/pages/access_location_page.dart';
import '../../../chef_app/presentation/pages/chef_dashboard.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class LoginPage extends StatefulWidget {
  final String? selectedRole;

  const LoginPage({super.key, this.selectedRole});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormBuilderState>();
  bool _obscurePassword = true;
  bool _rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              _buildHeader(),
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
                      const SizedBox(height: 16),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Checkbox(
                                value: _rememberMe,
                                onChanged: (val) =>
                                    setState(() => _rememberMe = val!),
                                activeColor: AppColors.primary,
                              ),
                              const Text(
                                "Remember me",
                                style: TextStyle(
                                  color: Color(0xFF7E8389),
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                          TextButton(
                            onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const ForgotPasswordPage(),
                              ),
                            ),
                            child: const Text(
                              "Forgot Password",
                              style: TextStyle(
                                color: AppColors.primary,
                                fontSize: 13,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 32),

                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState?.saveAndValidate() ??
                              false) {
                            // Navigate based on selected role
                            if (widget.selectedRole == 'chef') {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const ChefDashboard(),
                                ),
                              );
                            } else {
                              // Default to customer flow
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const AccessLocationPage(),
                                ),
                              );
                            }
                          }
                        },
                        child: const Text("LOG IN"),
                      ),
                      const SizedBox(height: 24),

                      _buildSignupPrompt(),
                      const SizedBox(height: 32),

                      _buildDivider(),
                      const SizedBox(height: 32),

                      _buildSocialButtons(),
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

  Widget _buildHeader() {
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
            top: 0,
            right: 0,
            child: SvgPicture.asset(
              'assets/icons/splash_page_01.svg',
              width: 150,
              colorFilter: ColorFilter.mode(
                Colors.white.withValues(alpha: 0.08),
                BlendMode.srcIn,
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                const Text(
                  "Log In",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  "Please sign in to your existing account",
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

  Widget _buildSignupPrompt() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Don't have an account? ",
          style: TextStyle(color: Color(0xFF7E8389)),
        ),
        GestureDetector(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  SignupPage(selectedRole: widget.selectedRole),
            ),
          ),
          child: const Text(
            "SIGN UP",
            style: TextStyle(
              color: AppColors.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDivider() {
    return Row(
      children: [
        const Expanded(child: Divider()),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            "Or",
            style: TextStyle(color: AppColors.grey.withValues(alpha: 0.5)),
          ),
        ),
        const Expanded(child: Divider()),
      ],
    );
  }

  Widget _buildSocialButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildSocialButton('assets/icons/facebook.svg'),
        const SizedBox(width: 24),
        _buildSocialButton('assets/icons/twitter.svg'),
        const SizedBox(width: 24),
        _buildSocialButton('assets/icons/apples.svg'),
      ],
    );
  }

  Widget _buildSocialButton(String assetPath) {
    return Container(
      height: 60,
      width: 60,
      decoration: const BoxDecoration(shape: BoxShape.circle),
      child: SvgPicture.asset(assetPath, fit: BoxFit.cover),
    );
  }
}
