class Atleta {
  String idServer;
  String nome;
  String celular;
  bool selecionado;
  String email;
  String ladoDominante;
  String numero;
  String posicao;
  String peso;
  String altura;
  String profissao;

  Atleta({
    this.idServer,
    this.nome,
    this.selecionado = false,
    this.celular,
    this.email,
    this.ladoDominante,
    this.numero,
    this.posicao,
    this.peso,
    this.altura,
    this.profissao,
  });
}
