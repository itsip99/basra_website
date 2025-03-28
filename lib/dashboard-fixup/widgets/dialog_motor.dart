import 'package:flutter/material.dart';
import 'package:stsj/dashboard-fixup/models/dashboard5_model.dart';
import 'package:stsj/dashboard-fixup/widgets/button_custom.dart';

class DialogMotor extends StatefulWidget {
  const DialogMotor(this.data, {super.key});
  final Dashboard5 data;

  @override
  State<DialogMotor> createState() => _DialogMotorState();
}

class _DialogMotorState extends State<DialogMotor> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actionsPadding:
          const EdgeInsets.only(bottom: 15, top: 15, left: 40, right: 40),
      contentPadding: const EdgeInsets.only(top: 30, right: 50, left: 50),
      content: SizedBox(
        width: MediaQuery.of(context).size.width * 0.3,
        height: MediaQuery.of(context).size.height * 0.7,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(widget.data.memberId,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold)),
              const Text('DETAIL MOTOR',
                  style: TextStyle(fontSize: 15, color: Colors.grey)),
              const SizedBox(height: 20),
              ...widget.data.detail.map((e) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.23,
                        width: MediaQuery.of(context).size.height * 0.23,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/images/no-image.png'),
                                fit: BoxFit.cover)),
                      ),
                      const SizedBox(width: 30),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            text: TextSpan(children: [
                              const TextSpan(
                                  text: 'Plat : ',
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold)),
                              TextSpan(
                                  text: e.plateNo,
                                  style: const TextStyle(fontSize: 13))
                            ]),
                          ),
                          const SizedBox(height: 10),
                          RichText(
                            text: TextSpan(children: [
                              const TextSpan(
                                  text: 'Tipe : ',
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold)),
                              TextSpan(
                                  text: e.unitId,
                                  style: const TextStyle(fontSize: 13))
                            ]),
                          ),
                          const SizedBox(height: 10),
                          RichText(
                            text: TextSpan(children: [
                              const TextSpan(
                                  text: 'Tahun : ',
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold)),
                              TextSpan(
                                  text: e.year,
                                  style: const TextStyle(fontSize: 13))
                            ]),
                          ),
                          const SizedBox(height: 10),
                          RichText(
                            text: TextSpan(children: [
                              const TextSpan(
                                  text: 'Warna : ',
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold)),
                              TextSpan(
                                  text: e.color,
                                  style: const TextStyle(fontSize: 13))
                            ]),
                          ),
                          const SizedBox(height: 10),
                          RichText(
                            text: TextSpan(children: [
                              const TextSpan(
                                  text: 'Noka : ',
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold)),
                              TextSpan(
                                  text: e.chasisNo,
                                  style: const TextStyle(fontSize: 13))
                            ]),
                          ),
                          const SizedBox(height: 10),
                          RichText(
                            text: TextSpan(children: [
                              const TextSpan(
                                  text: 'Nosin : ',
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold)),
                              TextSpan(
                                  text: e.engineNo,
                                  style: const TextStyle(fontSize: 13))
                            ]),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              })
            ],
          ),
        ),
      ),
      actions: [
        ButtonCustom('Tutup', () => Navigator.pop(context)),
      ],
    );
  }
}
