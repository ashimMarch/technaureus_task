part of 'router.dart';

class AppRouter {
  static Route<dynamic>? generateRouter(RouteSettings settings) {
    switch (settings.name) {
      case Dashboard.routeName || '/':
        return MaterialPageRoute(
          builder: (context) => BlocProvider<CustomerBloc>(
            create: (context) => sl()..add(const GetAllCustomerEvent()),
            child: const Dashboard(),
          ),
        );
      case ProductScreen.routeName:
        return MaterialPageRoute(
          builder: (context) => BlocProvider<ProductBloc>(
            create: (context) => sl()..add(const GetAllProductEvent()),
            child: const ProductScreen(),
          ),
        );
      default:
        null;
    }
    return null;
  }
}
