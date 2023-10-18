abstract class AuthCacheDatasource {
  const AuthCacheDatasource();

  Future<void> saveJwtToken(String jwtToken);
}

class AuthCacheDatasourceImpl extends AuthCacheDatasource {
  const AuthCacheDatasourceImpl();

  @override
  Future<void> saveJwtToken(String jwtToken) async {
    await Future.delayed(const Duration(milliseconds: 200));
    print('jwt token saved');
  }
}
