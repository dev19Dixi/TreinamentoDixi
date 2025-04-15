
Proposta de recomendação de Arquitetura DIXI 

- /Core: -> Responsável por gerencias arquivos que vao ser usados durante todo o projeto
    - /Failure -> Responsável por determinar as falhas e gerenciá-las
    - /Request -> Responsável por intermediar e adequar dados entre as camadas Http(lib) e a Sevice
    - /Navigation -> Responsável por iniciar e gerenciar a navegação do sistema
    - /Style -> Reponsável por estilização como a regrar as cores e estilos de texto padão do sistema
    - /Utils -> Responsável por juntar funções comuns do nosso sistema, como de Data e Hora
    - /Logs -> Responsável por realizar Prints do sistema de maneira intuitiva
- Obs: Em "/Core" não é recomendado Widgets comuns ao sistema
- Obs2: Em "/Core" mais pastas podem ser adicionadas conforme a necessidade gerada, como webWorkers, cálculos pesados, entre outras demandas

- /Models: -> Responsável por gerenciar classes Models do nosso sistema
           -> Responsável por realizar fromJson, ToJson, FromMap, ToMap para funções de integração de dados da api em objeto
           -> Recomendação: Utilize sufixo '_model.dart' em arquivos e "Model" em classes
           -> Recomendação: Extensão VScode "Dart Data Class Generator" para gerar funções de integração (obs: ela é incompleta, para List<Object> ela pode gerar List<int>)

- /Shared: -> Responsável por gerenciar Widgets comunns ao nosso sistema
           -> Responsável por conter botões, menus, Containers, cabeçalhos, padrões de páginas entre outros Widgets
           -> Nessa camada, vale uma conversa entre os interessados para determinar melhores maneiras de organização de pastas/arquivos



- /Modules: -> Responsável por Gerenciar os módulos do sistema, Ex: Positon, Home, PolicyExtra
            -> Responsável por incluir cada seção que o cliente quiser incluir
    -/Module: -> Responsável por incluir controllers, widgets desse módulo
        - /Controllers -> Responsável por incluir todos controladores/providers do módulo
        - /Pages -> Responsável por incluir todas as páginas que vao aparecer no mmódulo
            -/Controllers -> Responsável por incluir todos controladores/providers EXCLUSIVOS da página
            -/Widgets -> Responsável por incluir todas os Widges que vao aparecer na página
            - page.dart -> Responsável por gerenciar e unificar controladores e widgets
        - /Service -> Responsável por incluir todos os services do módulo
        - module.dart -> Responsável por gerenciar todas depedencias do módulo


Example strucutre with "Position Module":
        /position_module
        ├── /controllers
        │   ├── navigation_controller.dart
        │   └── token_provider.dart
        ├── /pages
        │   └── /page_position_one
        │       ├── /controllers
        │       │   ├── get_list_provider.dart
        │       │   ├── delete_provider.dart
        │       │   ├── filter_controller.dart
        │       │   └── employee_controller.dart
        │       ├── /widgets
        │       │   ├── title_widget.dart
        |       |   ├── filter_widget.dart
        │       │   └── button_widget.dart
        │       └── page_position_one.dart
        ├── /services
        │   ├── position_service.dart
        │   └── position_employee_service.dart
        └── position_module.dart

Possíveis dúvidas: 

# Controller x Provider
- Para fins de controle de dados, o controlador pode ser sufixo "Controller" e sufixo "Provider"
- 1. Para uso de controladores locais, usa-se "Controller" ex: "filtro_employee_controller.dart"
    - Esse exemplo seria para aplicação de filtro em uma propria página a qual nao precisaria requisição ao backend
- 2. Para uso de controladores de API, usa-se "Provider" ex: "get_list_employee_provider.dart"
    - Esse exemplo seria para pegar os funcionários vindo da API

by: Renan Volpe