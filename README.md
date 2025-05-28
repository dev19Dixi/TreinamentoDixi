
# 📘 Proposta de Organização de Arquitetura - DIXI

Esta documentação define a estrutura sugerida para projetos Flutter utilizando uma arquitetura modular e escalável. O objetivo é promover padronização, legibilidade e facilidade de manutenção.

---

## 📂 Estrutura Principal

```
/core        → Recursos centrais e utilitários do sistema.
/models      → Modelos de dados do sistema.
/shared      → Widgets reutilizáveis e componentes visuais globais.
/modules     → Módulos independentes com suas páginas, lógicas e serviços.
```

---

## 🔹 `/core`

Contém recursos fundamentais usados globalmente no projeto. **Não deve conter Widgets**.

### Subpastas recomendadas:
- `/failure`: Gerencia falhas e exceções comuns.
- `/request`: Adapta dados entre a camada HTTP e os serviços.
- `/navigation`: Inicia e controla a navegação entre módulos.
- `/style`: Define temas, cores e estilos padrão.
- `/utils`: Funções utilitárias como manipulação de data/hora, conversões, etc.
- `/logs`: Utilitários para debug e rastreamento de logs.

📌 **Observações**:
- Não incluir Widgets aqui.
- Outras pastas podem ser adicionadas conforme necessário (ex: `web_workers`, `heavy_calculations`, etc.).

---

## 🔹 `/models`

Contém as classes responsáveis por representar dados da aplicação.

### Responsabilidades:
- Conversão de dados (API ↔ Objetos).
- Métodos recomendados: `fromJson`, `toJson`, `fromMap`, `toMap`.

### Convenções:
- Nome do arquivo: `nome_model.dart`.
- Nome da classe: `NomeModel`.

📌 **Dica**: Utilize a extensão [Dart Data Class Generator](https://marketplace.visualstudio.com/items?itemName=Kite.flutter-data-class-generator) para gerar os métodos automaticamente. Atenção: pode gerar `List<int>` ao invés de `List<Object>` em alguns casos.

---

## 🔹 `/shared`

Contém **widgets reutilizáveis** entre módulos/páginas.

### Exemplos:
- Botões padrão.
- Menus de navegação.
- Containers customizados.
- Cabeçalhos reutilizáveis.
- Layouts base de páginas.

📌 **Sugestão**: Defina em equipe a estrutura de pastas e nomes dentro de `/shared`.

---

## 🔹 `/modules`

Cada módulo representa uma **área funcional** da aplicação (ex: `home`, `position`, `policy_extra`).

### Estrutura interna sugerida:
```
/module_name
├── /controllers       → Providers ou controllers do módulo.
├── /pages             → Páginas e subdiretórios com estrutura por página.
│   └── /page_name
│       ├── /controllers → Providers/controllers locais da página.
│       ├── /widgets     → Componentes visuais da página.
│       └── page_name.dart
├── /services          → Serviços responsáveis por lógica e comunicação com backend.
└── module_name.dart   → Ponto de entrada do módulo (injeção de dependências).
```

---

## 📑 Exemplo de Módulo: `position_module`

```
position_module/
├── controllers/
│   ├── navigation_controller.dart
│   └── token_provider.dart
├── pages/
│   └── page_position_one/
│       ├── controllers/
│       │   ├── get_list_provider.dart
│       │   ├── delete_provider.dart
│       │   ├── filter_controller.dart
│       │   └── employee_controller.dart
│       ├── widgets/
│       │   ├── title_widget.dart
│       │   ├── filter_widget.dart
│       │   └── button_widget.dart
│       └── page_position_one.dart
├── services/
│   ├── position_service.dart
│   └── position_employee_service.dart
└── position_module.dart
```

---

## 🤔 Possíveis Dúvidas

### Sufixos: `Controller` vs `Provider`

| Termo       | Quando usar                                 | Exemplo                                |
|-------------|---------------------------------------------|----------------------------------------|
| `Controller`| Controle local, sem chamadas à API          | `filter_employee_controller.dart`      |
| `Provider`  | Controle com comunicação com backend/API     | `get_list_employee_provider.dart`      |

---

## 🛠 Ferramentas Recomendadas

- ✅ **Dart Data Class Generator**  
  Gera automaticamente `fromJson`, `toJson`, `copyWith`, etc.

- ✅ **Pubspec Assist**  
  Facilita adição de dependências ao `pubspec.yaml`.

- ✅ **Flutter Tree**  
  Visualiza a hierarquia de widgets no projeto.

---

## 📌 Convenções Gerais

- ✅ Utilizar **snake_case** para nomes de arquivos e pastas.
- ✅ Usar sufixos `_model.dart`, `_controller.dart`, `_provider.dart`, `_widget.dart`.
- ✅ Evitar lógica de negócio dentro de widgets ou pages.
- ✅ Manter widgets reutilizáveis fora de módulos, em `/shared`.

---

Se houver necessidade de adicionar outros tipos de estruturas (como testes, temas, middlewares), é recomendado seguir a mesma lógica modular.

--- 
## 🚀 Navegação

Em projetos Flutter, a navegação é um ponto crucial que pode facilitar ou complicar o desenvolvimento. Para resolver isso de forma mais robusta, criamos um `RouterProvider` com navegação baseada em **Keys** e o **Singleton Pattern**.

### 🧭 Navegação entre módulos

Esse modelo permite a navegação entre módulos distintos, sem acoplamento com o `BuildContext`.

**Exemplos:**

```dart
RoutesProvider().navigateTo('/policy');
RoutesProvider().navigateTo('/position');
```

---

### ❓ Mas e navegação *dentro* do módulo?

- Há **duas maneiras**:

- **1. Usar Chaves como navegação, sem criar Singleton**

    **No Módulo:**
    ```dart
    child: Scaffold(
      body: Consumer<NavigationHomeController>(builder: (context, provider, child) {
        return Navigator(
          key: provider.homeNavigatorKey,
          initialRoute: '/',
          onGenerateRoute: (RouteSettings settings) {
            return provider.provideRoutes(provider.routeName);
          },
        );
      }),
    ),
    ```

    **No Controller:**
    ```dart
    class NavigationHomeController extends ChangeNotifier {
      final GlobalKey<NavigatorState> homeNavigatorKey = GlobalKey<NavigatorState>();

      String routeName = '/';
      Route<dynamic> provideRoutes(String route) {
        switch (route) {
          case "/":
            return PageRouteBuilder(
              transitionDuration: Duration.zero,
              pageBuilder: (_, __, ___) => const InitialPage(),
            );
          case "/:id":
            return PageRouteBuilder(
              transitionDuration: Duration.zero,
              pageBuilder: (_, __, ___) => const DetailPage(),
            );
        }
      }
    }
    ```

---

- **2. Usar Troca de Widget Simples**
    - Usado para componentes mais simples, sem a necessidade de tratamento alto de `providers`.

    **Ex:**

    **No Módulo:**
    ```dart
    child: Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          const Text("Policy module opened :)"),
          Consumer<NavigationPolicyController>(
            builder: (context, navigation, child) {
              return navigation.currentWidget;
            },
          ),
        ],
      ),
    ),
    ```

    **No Controller:**
    ```dart
    class NavigationController extends ChangeNotifier {
      Widget currentWidget = const InitialPage();

      goToInitialPage() {
        currentWidget = const InitialPage();
        notifyListeners();
      }

      goToDetailPage() {
        currentWidget = const DetailPage();
        notifyListeners();
      }
    }
    ```
   
---


Autoria: Renan Volpe
--
Revisão/Formatação: Luiz Coelho

