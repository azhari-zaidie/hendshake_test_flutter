import 'package:flutter/material.dart';
import 'package:hendshake_test_flutter/core/route/route.dart';
import 'package:hendshake_test_flutter/core/shared/theme/app_theme.dart';
import 'package:hendshake_test_flutter/core/shared/widgets/app_bar_widget.dart';
import 'package:hendshake_test_flutter/core/shared/widgets/app_button.dart';
import 'package:hendshake_test_flutter/core/shared/widgets/app_loading_indicator.dart';
import 'package:hendshake_test_flutter/features/home/presentation/provider/home_provider.dart';
import 'package:hendshake_test_flutter/features/home/presentation/widget/activity_type_selector.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<HomeProvider>(context, listen: false).getDetails();
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, homeProvider, child) {
        return Scaffold(
          appBar: const AppBarWidget(
            title: 'Hendshake',
            showBackButton: false,
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Welcome section
                  const Text(
                    'Welcome to Hendshake',
                    style: AppTheme.headingStyle,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Find activities to do when you\'re bored',
                    style: AppTheme.bodyStyle,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 48),
                  
                  // Activity type selector
                  const Text(
                    'Select Activity Type',
                    style: AppTheme.subheadingStyle,
                  ),
                  const SizedBox(height: 16),
                  
                  homeProvider.isLoading 
                      ? const AppLoadingIndicator(size: 30)
                      : ActivityTypeSelector(
                          selectedType: homeProvider.selectedActivityType,
                          onTypeChanged: (String? newValue) {
                            homeProvider.setSelectedActivityType(newValue ?? '');
                          },
                        ),
                  
                  const Spacer(),
                  
                  // Button to navigate to the activity page
                  AppButton(
                    text: 'Next',
                    icon: Icons.search,
                    onPressed: () => Navigator.pushNamed(
                      context, 
                      AppRoute.activity,
                      arguments: homeProvider.selectedActivityType,   
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}