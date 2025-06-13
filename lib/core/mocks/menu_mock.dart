import 'package:treinamento_mvvm/core/navigation/models/menu_model.dart';
import 'package:treinamento_mvvm/core/navigation/models/submenu_model.dart';

List<MenuModel> menuMock = [
  MenuModel(
    name: "CADASTRO",
    icon: "library_books", // Corresponde a Icons.library_books
    listSubMenu: [
      SubMenuModel(name: "HOME", route: "/"),
      SubMenuModel(name: "CARGO", route: "/position"),
      SubMenuModel(name: "POLÍTICA", route: "/policy"),
      SubMenuModel(name: "HORÁRIO", route: "/cadastro/horario"),
      SubMenuModel(name: "FUNCIONÁRIO", route: "/cadastro/funcionario"),
      SubMenuModel(name: "DEPARTAMENTO", route: "/cadastro/departamento"),
      SubMenuModel(name: "CARGO", route: "/cadastro/cargo"),
      SubMenuModel(name: "FERIADO", route: "/cadastro/feriado"),
      SubMenuModel(name: "JUSTIFICATIVA", route: "/cadastro/justificativa"),
      SubMenuModel(name: "AFASTAMENTO", route: "/cadastro/afastamento"),
    ],
  ),
  MenuModel(
    name: "COMUNICAÇÃO",
    icon: "account_tree",
    listSubMenu: [
      SubMenuModel(name: "EQUIPAMENTO", route: "/comunicacao/equipamento"),
      SubMenuModel(name: "ENVIAR/RECEBER DADOS", route: "/comunicacao/enviar_receber_dados"),
      SubMenuModel(name: "STATUS DO EQUIPAMENTO", route: "/comunicacao/status_equipamento"),
      SubMenuModel(name: "DADOS RECEBIDOS", route: "/comunicacao/dados_recebidos"),
      SubMenuModel(name: "TAREFAS DO EQUIPAMENTO", route: "/comunicacao/tarefas_equipamento"),
      SubMenuModel(name: "ADF MOVIMENTO", route: "/comunicacao/adf_movimento"),
    ],
  ),
  MenuModel(
    name: "MOVIMENTAÇÃO",
    icon: "multiple_stop",
    listSubMenu: [
      SubMenuModel(name: "ESPELHO PONTO", route: "/movimentacao/espelho_ponto"),
      SubMenuModel(name: "MARCAÇÕES DESCONSIDERADAS", route: "/movimentacao/marcacoes_desconsideradas"),
      SubMenuModel(name: "IMPORTAÇÃO ADF", route: "/movimentacao/importacao_adf"),
      SubMenuModel(name: "BANCO DE HORAS", route: "/movimentacao/banco_de_horas"),
      SubMenuModel(name: "JUSTIFICAR EM LOTE", route: "/movimentacao/justificar_em_lote"),
      SubMenuModel(name: "ZERAR BH EM LOTE", route: "/movimentacao/zerar_bh_em_lote"),
      SubMenuModel(name: "CÁLCULO EM LOTE", route: "/movimentacao/calculo_em_lote"),
      SubMenuModel(name: "IMPORTAÇÃO CSV", route: "/movimentacao/importacao_csv"),
      SubMenuModel(name: "SOLICITAÇÕES", route: "/movimentacao/solicitacoes"),
      SubMenuModel(name: "HISTÓRICO DE SOLICITAÇÕES", route: "/movimentacao/historico_solicitacoes"),
    ],
  ),
];
