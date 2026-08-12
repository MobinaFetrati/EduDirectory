import 'package:edudirectory3/features/admin/presentation/screens/add_employee_screen.dart';
import 'package:edudirectory3/features/admin/presentation/screens/admin_panel_screen.dart';
import 'package:edudirectory3/features/auth/presentation/screens/admin_login_screen.dart';
import 'package:edudirectory3/shared/models/employee_model.dart';
import 'package:go_router/go_router.dart';

import '../features/home/presentation/screens/home_screen.dart';
import '../features/groups/presentation/screens/groups_screen.dart';
import '../features/statistics/presentation/screens/statistics_screen.dart';
import '../features/settings/presentation/screens/settings_screen.dart';
import '../features/import_export/presentation/screens/import_screen.dart';
import '../features/import_export/presentation/screens/export_screen.dart';

final router = GoRouter(
  initialLocation: '/',

  routes: [
    GoRoute(path: '/', builder: (context, state) => const HomeScreen()),

    GoRoute(
      path: '/admin-login',
      builder: (context, state) => const AdminLoginScreen(),
    ),

    GoRoute(
      path: '/admin',
      builder: (context, state) => const AdminPanelScreen(),
    ),
    GoRoute(
      path: '/admin/add',
      builder: (context, state) => const AddEmployeeScreen(),
    ),

    GoRoute(
      path: '/admin/edit',
      builder: (context, state) {
        final employee = state.extra as EmployeeModel;

        return AddEmployeeScreen(employee: employee);
      },
    ),

    GoRoute(path: '/groups', builder: (context, state) => const GroupsScreen()),

    GoRoute(
      path: '/statistics',
      builder: (context, state) => const StatisticsScreen(),
    ),

    GoRoute(
      path: '/settings',
      builder: (context, state) => const SettingsScreen(),
    ),

    GoRoute(path: '/import', builder: (context, state) => const ImportScreen()),

    GoRoute(path: '/export', builder: (context, state) => const ExportScreen()),
  ],
);
