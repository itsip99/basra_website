import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:stsj/router/router_const.dart';

class LeftDrawer extends HookWidget {
  final Function onItemSelected;
  final int currentPage; // Add currentPage as a parameter

  const LeftDrawer({
    Key? key,
    required this.currentPage,
    required this.onItemSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    var selectedIndex = useState<int>(0);

    // callback
    void onMenuItemSelected(int index) {
      onItemSelected(index);
      selectedIndex.value = index;
    }

    Widget _drawerItem(String label, int index, IconData icon) {
      final isSelected = index == currentPage;

      return ListTile(
        onTap: () {
          onMenuItemSelected(
              index); // Call the callback with the selected index.
          Navigator.of(context).pop(); // Tutup drawer setelah memilih item.
        },
        leading: Icon(
          icon,
          color:
              isSelected ? Colors.blue : null, // Ganti warna ikon jika dipilih
        ),
        title: Text(
          label,
          style: TextStyle(
            color: isSelected
                ? Colors.blue
                : null, // Ganti warna teks jika dipilih
          ),
        ),
      );
    }

    return Container(
      height: screenHeight,
      color: Theme.of(context).cardColor,
      child: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      margin: EdgeInsets.only(
                          left: 0, top: 0), // Atur margin sesuai kebutuhan
                      child: IconButton(
                        icon: Icon(Icons.arrow_back),
                        color: Colors.white,
                        onPressed: () {
                          // DataLoginController.removeDataUser();
                          context.replaceNamed(RoutesConstant.menu);
                        },
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      'REPORT',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                      ),
                    ),
                  ),
                  // Tambahkan widget lain di dalam Stack jika diperlukan.
                ],
              ),
            ),
            _drawerItem('Pembelian', 0, Icons.shopping_cart),
            _drawerItem('Penjualan', 1, Icons.store),
            _drawerItem('Service', 2, Icons.miscellaneous_services),
            _drawerItem('Inventory', 3, Icons.inventory),
            _drawerItem('Registrasi', 4, Icons.app_registration),
            _drawerItem('Finance', 5, Icons.money),
            _drawerItem('Accounting', 6, Icons.account_balance),
            _drawerItem('Master', 7, Icons.data_exploration),
            _drawerItem('Faktur Polisi', 8, Icons.print_rounded),
            _drawerItem('Bea Balik Nama', 9, Icons.document_scanner),
            _drawerItem('Faktur Pajak', 10, Icons.money),
            _drawerItem('Lain-lain', 11, Icons.devices_other),
          ],
        ),
      ),
    );
  }
}
