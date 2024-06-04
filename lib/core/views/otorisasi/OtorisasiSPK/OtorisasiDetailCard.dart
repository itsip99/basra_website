import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:stsj/core/controller/Otorisasi_Controller.dart';
import 'package:stsj/core/models/SPKModel/SpkOverDiscModel.dart';
import 'package:stsj/core/views/Otorisasi/component/StyleService.dart';
import 'package:flutter/material.dart';

class OtorisasiDetailCard extends HookWidget {
  OtorisasiDetailCard({required this.spkOverDisc, required this.userID});

  SpkOverDisc spkOverDisc;
  String userID;

  @override
  Widget build(BuildContext context) {
    final _isLoading = useState<bool>(false);
    final hidebackbutton = useState<bool>(false);
    // return Container(
    //   child: Text(widget.spkOverDisc.transNO.toString()),
    // );
    print(StyleService.convertToIdr(spkOverDisc.hargaKosong, 2));
    return WillPopScope(
      onWillPop:
          hidebackbutton.value == true ? () async => false : () async => true,
      child: Scaffold(
        appBar: AppBar(
          title: Text("OTORISASI SPK (" + spkOverDisc.bSName.toString() + ")"),
          automaticallyImplyLeading:
              hidebackbutton.value == true ? false : true,
        ),
        body: SingleChildScrollView(
          child: Container(
            color: Color.fromARGB(255, 212, 212, 212),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  padding: const EdgeInsets.fromLTRB(5, 25, 5, 5),
                  child: Row(
                    children: [
                      Expanded(
                          flex: 3,
                          child: Text(
                            "Nomor SPK",
                            style: StyleService.headLine2
                                .copyWith(color: StyleService.textColor),
                          )),
                      Text(":   ",
                          style: StyleService.headLine2
                              .copyWith(color: StyleService.textColor)),
                      Expanded(
                          flex: 6,
                          child: Text(spkOverDisc.transNO.toString(),
                              style: StyleService.headLine1
                                  .copyWith(color: StyleService.textColor)))
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(5),
                  child: Row(
                    children: [
                      Expanded(
                          flex: 3,
                          child: Text("Tanggal",
                              style: StyleService.headLine2
                                  .copyWith(color: StyleService.textColor))),
                      Text(":   ",
                          style: StyleService.headLine2
                              .copyWith(color: StyleService.textColor)),
                      Expanded(
                          flex: 6,
                          child: Text(spkOverDisc.transDate.toString(),
                              style: StyleService.headLine1
                                  .copyWith(color: StyleService.textColor)))
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(5),
                  child: Row(
                    children: [
                      Expanded(
                          flex: 3,
                          child: Text("Jenis Motor",
                              style: StyleService.headLine2
                                  .copyWith(color: StyleService.textColor))),
                      Text(":   ",
                          style: StyleService.headLine2
                              .copyWith(color: StyleService.textColor)),
                      Expanded(
                          flex: 6,
                          child: Text(spkOverDisc.itemName.toString(),
                              style: StyleService.headLine1
                                  .copyWith(color: StyleService.textColor)))
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(5),
                  child: Row(
                    children: [
                      Expanded(
                          flex: 3,
                          child: Text("Harga Kosong",
                              style: StyleService.headLine2
                                  .copyWith(color: StyleService.textColor))),
                      Text(":   ",
                          style: StyleService.headLine2
                              .copyWith(color: StyleService.textColor)),
                      Expanded(
                          flex: 6,
                          child: Text(
                              StyleService.convertToIdr(
                                  spkOverDisc.hargaKosong, 0),
                              style: StyleService.headLine1
                                  .copyWith(color: StyleService.textColor)))
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(5),
                  child: Row(
                    children: [
                      Expanded(
                          flex: 3,
                          child: Text("BBN",
                              style: StyleService.headLine2
                                  .copyWith(color: StyleService.textColor))),
                      Text(":   ",
                          style: StyleService.headLine2
                              .copyWith(color: StyleService.textColor)),
                      Expanded(
                          flex: 6,
                          child: Text(
                              StyleService.convertToIdr(spkOverDisc.bBN, 0),
                              style: StyleService.headLine1
                                  .copyWith(color: StyleService.textColor)))
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(5),
                  child: Row(
                    children: [
                      Expanded(
                          flex: 3,
                          child: Text("Potongan Toko",
                              style: StyleService.headLine2
                                  .copyWith(color: StyleService.textColor))),
                      Text(":   ",
                          style: StyleService.headLine2
                              .copyWith(color: StyleService.textColor)),
                      Expanded(
                          flex: 6,
                          child: Text(
                              StyleService.convertToIdr(
                                  spkOverDisc.potonganToko, 0),
                              style: StyleService.headLine1
                                  .copyWith(color: StyleService.textColor)))
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(5),
                  child: Row(
                    children: [
                      Expanded(
                          flex: 3,
                          child: Text("Subsidi Leasing",
                              style: StyleService.headLine2
                                  .copyWith(color: StyleService.textColor))),
                      Text(":   ",
                          style: StyleService.headLine2
                              .copyWith(color: StyleService.textColor)),
                      Expanded(
                          flex: 6,
                          child: Text(spkOverDisc.subsidiLeasing.toString(),
                              style: StyleService.headLine1
                                  .copyWith(color: StyleService.textColor)))
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(5),
                  child: Row(
                    children: [
                      Expanded(
                          flex: 3,
                          child: Text("Campaign",
                              style: StyleService.headLine2
                                  .copyWith(color: StyleService.textColor))),
                      Text(":   ",
                          style: StyleService.headLine2
                              .copyWith(color: StyleService.textColor)),
                      Expanded(
                          flex: 6,
                          child: Text(
                              StyleService.convertToIdr(
                                  spkOverDisc.campaign, 0),
                              style: StyleService.headLine1
                                  .copyWith(color: StyleService.textColor)))
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(5),
                  child: Row(
                    children: [
                      Expanded(
                          flex: 3,
                          child: Text("BC",
                              style: StyleService.headLine2
                                  .copyWith(color: StyleService.textColor))),
                      Text(":   ",
                          style: StyleService.headLine2
                              .copyWith(color: StyleService.textColor)),
                      Expanded(
                          flex: 6,
                          child: Text(
                              StyleService.convertToIdr(spkOverDisc.bC, 0),
                              style: StyleService.headLine1
                                  .copyWith(color: StyleService.textColor)))
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(5),
                  child: Row(
                    children: [
                      Expanded(
                          flex: 3,
                          child: Text("uang muka",
                              style: StyleService.headLine2
                                  .copyWith(color: StyleService.textColor))),
                      Text(":   ",
                          style: StyleService.headLine2
                              .copyWith(color: StyleService.textColor)),
                      Expanded(
                          flex: 6,
                          child: Text(
                              StyleService.convertToIdr(
                                  spkOverDisc.subsidiLeasing, 0),
                              style: StyleService.headLine1
                                  .copyWith(color: StyleService.textColor)))
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(5),
                  child: Row(
                    children: [
                      Expanded(
                          flex: 3,
                          child: Text("Leasing Tipe",
                              style: StyleService.headLine2
                                  .copyWith(color: StyleService.textColor))),
                      Text(":   ",
                          style: StyleService.headLine2
                              .copyWith(color: StyleService.textColor)),
                      Expanded(
                          flex: 6,
                          child: Text(spkOverDisc.leasingID.toString(),
                              style: StyleService.headLine1
                                  .copyWith(color: StyleService.textColor)))
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(5),
                  child: Row(
                    children: [
                      Expanded(
                          flex: 3,
                          child: Text("Memo",
                              style: StyleService.headLine2
                                  .copyWith(color: StyleService.textColor))),
                      Text(":   ",
                          style: StyleService.headLine2
                              .copyWith(color: StyleService.textColor)),
                      Expanded(
                          flex: 6,
                          child: Text(spkOverDisc.memo.toString(),
                              style: StyleService.headLine1
                                  .copyWith(color: StyleService.textColor)))
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(5),
                  child: Row(
                    children: [
                      Expanded(
                          flex: 3,
                          child: Text("Sisa",
                              style: StyleService.headLine2
                                  .copyWith(color: StyleService.textColor))),
                      Text(":   ",
                          style: StyleService.headLine2
                              .copyWith(color: StyleService.textColor)),
                      Expanded(
                          flex: 6,
                          child: Text(
                              StyleService.convertToIdr(spkOverDisc.sisa, 0),
                              style: StyleService.headLine1
                                  .copyWith(color: StyleService.textColor)))
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                  child: Divider(
                    color: Colors.grey,
                    thickness: 2,
                    indent: 50,
                    endIndent: 50,
                  ),
                ),
                (_isLoading.value == false)
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: const EdgeInsets.fromLTRB(5, 5, 50, 5),
                            child: TextButton(
                                // style: ElevatedButton.styleFrom(
                                //     primary: Colors.white,
                                //     side: const BorderSide(
                                //         width: 2, color: Colors.green)),
                                onPressed: () {
                                  // showDialogChangePassword(
                                  //     MediaQuery.of(context).size.width * 0.008);

                                  _isLoading.value = true;
                                  hidebackbutton.value = true;

                                  ServiceOtorisasi.spkOverDiscSave(
                                      spkOverDisc, "1", userID, context);

                                  //Navigator.pop(context, 'back');
                                },
                                child:
                                    //const Text("APPROVE")
                                    const Image(
                                        width: 100,
                                        height: 100,
                                        image: AssetImage(
                                            'assets/imageS/accept.png'))),
                          ),
                          Container(
                            padding: const EdgeInsets.all(5),
                            child: TextButton(
                                onPressed: () {
                                  // showDialogChangePassword(
                                  //     MediaQuery.of(context).size.width * 0.008);

                                  _isLoading.value = true;
                                  hidebackbutton.value = true;

                                  ServiceOtorisasi.spkOverDiscSave(
                                      spkOverDisc, "0", userID, context);
                                },
                                child:
                                    //const Text("TOLAK")
                                    const Image(
                                        width: 100,
                                        height: 100,
                                        image: AssetImage(
                                            'assets/imageS/unchecked.png'))),
                          ),
                        ],
                      )
                    : Center(
                        child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          SizedBox(
                            height: 40,
                            width: 40,
                            child: CircularProgressIndicator(
                                backgroundColor: Colors.amberAccent,
                                strokeWidth: 10),
                          ),
                          Text("Loading Data ...")
                        ],
                      )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
