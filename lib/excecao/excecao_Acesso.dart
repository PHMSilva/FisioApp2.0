class ExcecaoAcesso implements Exception {
  static const Map<String, String> errors = {
    'EMAIL_EXISTS': 'E-mail já usado por outra conta',
    'OPERATION_NOT_ALLOWED': ' Operação não permitida',
    'TOO_MANY_ATTEMPTS_TRY_LATER': 'Tente mais tarde',
    'EMAIL_NOT_FOUND': 'E-mail não encontrado',
    'INVALID_PASSWORD': 'Senha inválida',
    'USER_DISABLED': 'Conta desativada',
  };

  final String key;

  const ExcecaoAcesso(this.key);

  @override
  String toString() {
    if (errors.containsKey(key)) {
      return errors[key];
    } else {
      return 'Ocorreu um erro na autenticação';
    }
  }
}
