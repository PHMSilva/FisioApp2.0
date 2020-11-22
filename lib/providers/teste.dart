class Teste {
  int id;
  String nomeTeste;
  String valor1 = '';
  String valor2 = '';
  String valor3 = '';
  String valor4 = '';
  String valor5 = '';
  String valor6 = '';
  String valor7 = '';
  String valor8 = '';
  String resultado1;
  String resultado2;
  bool status = false;

  Teste(
      {this.id,
      this.nomeTeste,
      this.status = false,
      this.valor1,
      this.valor2,
      this.valor3,
      this.valor4,
      this.valor5,
      this.valor6,
      this.valor7,
      this.valor8,
      this.resultado1 = '',
      this.resultado2 = ''});

  bool foiRealizado() {
    if (valor1 == null)
      return false;
    else
      return true;
  }

  bool nCampos() {
    if (valor3.isEmpty)
      return true;
    else
      return false;
  }
}
