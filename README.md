
# Proposta de recomendação de Arquitetura DIXI 


## /Core

* Responsável por gerenciar arquivos utilizados em todo o projeto.
* **`/Failure`:** Gerencia falhas e erros.
* **`/Request`:** Intermedia e adapta dados entre as camadas Http (lib) e Service.
* **`/Navigation`:** Inicia e gerencia a navegação do sistema.
* **`/Style`:** Define a estilização padrão (cores, estilos de texto, etc.).
* **`/Utils`:** Agrupa funções comuns (Data, Hora, etc.).
* **`/Logs`:** Facilita a impressão de logs do sistema.
* **Obs:** Não incluir Widgets comuns do sistema em `/Core`.
* **Obs2:** Outras pastas podem ser adicionadas conforme necessário (webWorkers, cálculos pesados, etc.).

## /Models

* Gerencia classes Model do sistema.
* Realiza conversões `fromJson`, `toJson`, `fromMap`, `toMap` para integração de dados da API em objetos.
* **Recomendação:** Use o sufixo `_model.dart` em arquivos e "Model" em classes.
* **Recomendação:** Use a extensão "Dart Data Class Generator" do VS Code para gerar funções de integração (atenção: pode gerar `List<int>` em vez de `List<Object>`).

## /Shared

* Gerencia Widgets comuns do sistema.
* Contém botões, menus, Containers, cabeçalhos, padrões de páginas, etc.
* **Recomendação:** Definir a organização de pastas/arquivos em conjunto com a equipe.

## /Modules

* Gerencia módulos do sistema (Ex: Position, Home, PolicyExtra).
* Cada módulo representa uma seção do sistema.
* **`/Module`:** Contém os componentes de um módulo.
    * **`/Controllers`:** Controladores/Providers do módulo.
    * **`/Pages`:** Páginas do módulo.
        * **`/Controllers`:** Controladores/Providers exclusivos da página.
        * **`/Widgets`:** Widgets da página.
        * `page.dart`: Gerencia e unifica controladores e widgets da página.
    * **`/Services`:** Services do módulo.
    * `module.dart`: Gerencia as dependências do módulo.

### Visualização .MD
* **`position_module` (Root Directory):** This is the main directory for the module.
* **`/controllers`:** This directory contains controller files, including:
    * `navigation_controller.dart`: Likely handles navigation logic within the module.
    * `token_provider.dart`: Probably manages authentication tokens or related data.
* **`/pages`:** This directory holds the module's pages.
    * **`/page_position_one`:** A subdirectory representing a specific page related to positions.
        * **`/controllers` (within `page_position_one`):** Controllers specific to `page_position_one`.
            * `get_list_provider.dart`: Fetches and provides data for a list of positions.
            * `delete_provider.dart`: Handles deletion operations related to positions.
            * `filter_controller.dart`: Manages filtering of position data.
            * `employee_controller.dart`: Manages employee-related logic within the context of positions.
        * **`/widgets` (within `page_position_one`):** Reusable UI components for `page_position_one`.
            * `title_widget.dart`: A widget for displaying a title.
            * `filter_widget.dart`: A widget for filtering position data.
            * `button_widget.dart`: A widget for creating buttons.
        * `page_position_one.dart`: The main file defining the `page_position_one` screen.
* **`/services`:** This directory contains service files that provide data or perform specific tasks.
    * `position_service.dart`: Likely handles location or position-related data.
    * `position_employee_service.dart`: Possibly provides employee position data or performs related logic.
* **`position_module.dart`:** The main entry point for the `position_module`.



### Visualização no VsCode
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

### Sufixos Controller x Provider
- Para fins de controle de dados, o controlador pode ser sufixo "Controller" e sufixo "Provider"
- 1. Para uso de controladores locais, usa-se "Controller" ex: "filtro_employee_controller.dart"
    - Esse exemplo seria para aplicação de filtro em uma propria página a qual nao precisaria requisição ao backend
- 2. Para uso de controladores de API, usa-se "Provider" ex: "get_list_employee_provider.dart"
    - Esse exemplo seria para pegar os funcionários vindo da API

by: Renan Volpe