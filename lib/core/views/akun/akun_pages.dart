import 'package:flutter/material.dart';
import 'package:simple_grid/simple_grid.dart';
import 'package:stsj/global/widget/app_bar.dart';

class AkunPage extends StatefulWidget {
  const AkunPage({super.key});

  @override
  State<AkunPage> createState() => _AkunPageState();
}

class _AkunPageState extends State<AkunPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // Controller untuk mengendalikan nilai-nilai bidang input teks
  TextEditingController currentPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    const double spacing = 8.0;
    const double hintSize = 12.0;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: CustomAppBar(goBack: '/menu'),
      ),
      body: Center(
        child: SpGrid(
          children: [
            SpGridItem(
                xs: 12,
                sm: 12,
                md: 12,
                lg: 12,
                child: Column(
                  children: [
                    SingleChildScrollView(
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 15),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 255, 255,
                              255), // Add your desired background color here
                          border: Border.all(
                            color: Colors
                                .grey, // You can choose the border color you want
                            width: 1.0, // Adjust the border width as needed
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey
                                  .withOpacity(0.5), // Warna bayangan
                              spreadRadius: 5, // Menyebar lebar bayangan
                              blurRadius: 7, // Blur bayangan
                              offset: Offset(0, 3), // Offset bayangan
                            ),
                          ],
                          // Add border radius
                        ),
                        width: 1000,
                        height: 470,
                        child: Form(
                          key: _formKey,
                          child: ListView(
                            shrinkWrap: true,
                            padding: EdgeInsets.all(16.0),
                            children: [
                              const Text(
                                'Pengaturan',
                                style: TextStyle(
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              SizedBox(height: spacing),

                              // Bidang input teks untuk TOKEN
                              SizedBox(height: 8.0),
                              const Text(
                                'Current Password',
                                style: TextStyle(
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 8.0),

                              TextFormField(
                                controller: currentPasswordController,
                                decoration: const InputDecoration(
                                  hintStyle: TextStyle(
                                    fontSize:
                                        hintSize, // Ganti ukuran font sesuai keinginan Anda
                                  ),
                                  border: OutlineInputBorder(),
                                  hintText: 'Current Password',
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Harap masukkan Password sekarang';
                                  }
                                  return null;
                                },
                              ),

                              SizedBox(height: spacing),
                              const Text(
                                'New Password',
                                style: TextStyle(
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextFormField(
                                controller: newPasswordController,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: 'New Password',
                                  hintStyle: TextStyle(
                                    fontSize:
                                        hintSize, // Ganti ukuran font sesuai keinginan Anda
                                  ),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Harap masukkan Password baru';
                                  }
                                  return null;
                                },
                              ),

                              SizedBox(height: spacing),

                              Text(
                                'Konfirmasi Password',
                                style: TextStyle(
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 8.0),

                              TextFormField(
                                controller: confirmPasswordController,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: 'Confirm Password',
                                  hintStyle: TextStyle(
                                    fontSize:
                                        hintSize, // Ganti ukuran font sesuai keinginan Anda
                                  ),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Harap masukkan Konfirmasi Password';
                                  }
                                  return null;
                                },
                              ),

                              // Tombol untuk mengirimkan formulir
                              Container(
                                margin: const EdgeInsets.only(top: 10),
                                child: FilledButton(
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      print('success');
                                    }
                                  },
                                  child: Text('Generate'),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
