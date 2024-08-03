import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart'; // Import the flutter_svg package
import 'package:pct_mark/core/common/resources/asset_manager.dart';
import 'package:pct_mark/core/providers/tenant_bottom_navigation_provider.dart';
import 'package:pct_mark/features/tenant_features/help_screen/presentation/help_screen.dart';
import 'package:pct_mark/features/tenant_features/information_screen/presentation/information_screen.dart';
import 'package:provider/provider.dart';

import 'ledger_screen/presentation/ledger_screen.dart';

class TenantHomeScreen extends StatelessWidget {
  final List<Widget> _screens = [
    const InformationScreen(),
    const LedgerScreen(),
    const HelpScreen(),
  ];

  TenantHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TenantBottomNavigationProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          body: IndexedStack(
            index: provider.selectedIndex,
            children: _screens,
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(
                icon: ColorFiltered(
                  colorFilter: ColorFilter.mode(
                    provider.selectedIndex == 0 ? Colors.black : Colors.grey,
                    BlendMode.srcIn,
                  ),
                  child: SvgPicture.asset(PctImages.tbottom_info),
                ),
                label: 'Information',
              ),
              BottomNavigationBarItem(
                icon: ColorFiltered(
                  colorFilter: ColorFilter.mode(
                    provider.selectedIndex == 1 ? Colors.black : Colors.grey,
                    BlendMode.srcIn,
                  ),
                  child: SvgPicture.asset(PctImages.tbottom_ledger),
                ),
                label: 'Ledger',
              ),
              BottomNavigationBarItem(
                icon: ColorFiltered(
                  colorFilter: ColorFilter.mode(
                    provider.selectedIndex == 2 ? Colors.black : Colors.grey,
                    BlendMode.srcIn,
                  ),
                  child: SvgPicture.asset(PctImages.tbottomHelp),
                ),
                label: 'Help',
              ),
            ],
            currentIndex: provider.selectedIndex,
            onTap: provider.updateIndex,
            // fixedColor: Colors.black,
            // unselectedItemColor: Colors.grey,
            showUnselectedLabels: true,
          ),
        );
      },
    );
  }
}
