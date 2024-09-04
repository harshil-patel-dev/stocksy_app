import 'package:dio/dio.dart';
import 'package:stock_trading_app/core/config/dependency_injector.dart';
import 'package:stock_trading_app/features/authentication/bloc/auth_bloc.dart';

class ApiInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // options.baseUrl = ApiUrl.baseUrl;
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (response.statusCode == 401) {
      getIt.get<AuthenticationBloc>().add(AuthenticationLogoutRequested());
    }
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // logger.e(err.response?.statusCode);
    super.onError(err, handler);
  }
}
