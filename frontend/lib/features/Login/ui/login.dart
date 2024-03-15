import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/features/Home/ui/Home.dart';
import 'package:frontend/features/Login/bloc/login_bloc.dart';
import 'package:frontend/services/loginFunction.dart';
import 'package:frontend/utils/formfieldslogin.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPageStudent extends StatefulWidget {
  const LoginPageStudent({super.key});

  @override
  State<LoginPageStudent> createState() => _LoginPageStudentState();
}

class _LoginPageStudentState extends State<LoginPageStudent> {
  final LoginBloc loginBloc = new LoginBloc();
  bool isLoading = false;

  final TextEditingController _passwordEditingController =
      TextEditingController();
  final TextEditingController _emailEditingController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    loginBloc.add(LoginInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/4689.jpg'),
                  fit: BoxFit.cover,
                  opacity: 0.1)),
          child: Stack(
            children: [
              Positioned(
                top: 75,
                left: 0,
                right: 0,
                child: Center(
                  child: RichText(
                    textScaleFactor: 1.1,
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Ai",
                          style: GoogleFonts.urbanist(
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                            fontSize: 42,
                            letterSpacing: 2,
                          ),
                        ),
                        TextSpan(
                          text: "F",
                          style: GoogleFonts.urbanist(
                              fontWeight: FontWeight.w700,
                              fontSize: 42,
                              letterSpacing: 2,
                              color: const Color.fromRGBO(
                                  199, 178, 253, 1)), // Change color as needed
                        ),
                        TextSpan(
                          text: "usion",
                          style: GoogleFonts.urbanist(
                            fontWeight: FontWeight.w700,
                            fontSize: 42,
                            color: Colors.black,
                            letterSpacing: 2,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 0,
                right: 0,
                left: 0,
                bottom: 0,
                child: Center(
                  child: Container(
                    height: 350,
                    width: 350,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(
                        colors: [
                          Colors.grey.shade900,
                          Colors.black
                        ], // Adjust these colors
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black38.withOpacity(0.4),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset:
                              const Offset(0, 3), // changes the shadow position
                        ),
                      ],
                    ),
                    child: BlocConsumer<LoginBloc, LoginState>(
                      bloc: loginBloc,
                      listenWhen: ((previous, current) =>
                          current is LoginActionState),
                      buildWhen: (previous, current) =>
                          current is! LoginActionState,
                      listener: (context, state) {
                        if (state is LoginNavigateToHomeScreenActionState) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MyHomePage()));
                        }
                      },
                      builder: (context, state) {
                        switch (state.runtimeType) {
                          case LoginLoadingState:
                            return const Center(
                              child: CircularProgressIndicator(
                                color: Colors.white,
                              ),
                            );

                          case LoginLoadedSuccessState:
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const SizedBox(
                                  height: 20,
                                ),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    NewFormFields(
                                        'Email', _emailEditingController),
                                    NewFormFields(
                                        'Password', _passwordEditingController),
                                  ],
                                ),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: ElevatedButton(
                                    onPressed: () {
                                      loginBloc.add(LoginButtonClickedEvent(
                                          email: _emailEditingController.text,
                                          password:
                                              _passwordEditingController.text));
                                      // loginUser(_emailEditingController.text,
                                      //     _passwordEditingController.text);
                                    },
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Colors.white),
                                    ),
                                    child: Container(
                                      padding: const EdgeInsets.fromLTRB(
                                          40, 25, 40, 25),
                                      child: isLoading
                                          ? const CircularProgressIndicator(
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                      Colors.black),
                                            )
                                          : Text(
                                              "Login!",
                                              style: GoogleFonts.montserrat(
                                                color: Colors.black,
                                                fontSize: 22,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                              ],
                            );

                          default:
                            return Container();
                        }
                      },
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 20,
                left: 0,
                right: 0,
                child: Center(
                  child: Text(
                    "Generate , Classify , Ask!",
                    style: GoogleFonts.urbanist(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
