
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
## 🧩 Uso do Novo Menu e AppBar

No nosso projeto, o **Menu lateral** é considerado (quase) estático após ser carregado com um `getMenus()`, ou seja, ele **não se altera durante a navegação** do sistema. Por outro lado, o **AppBar** é **dinâmico** e **adaptável a cada módulo**, podendo ser personalizado de acordo com a página ativa, controlado via `RoutesProvider()`.

Para isso, é necessário que cada **módulo** siga algumas convenções e implementações específicas.

> ⚠️ Importante: o `AppBarCustom` é sempre chamado dentro do **Widget do menu lateral fixo**.

---

### 🛠️ Requisitos para usar o AppBar dinâmico

Para permitir a navegação e alteração do AppBar conforme o módulo, é necessário:

1. O módulo **deve ser um `StatefulWidget`**
2. O módulo **deve implementar `IHomeModule`** com `implements IHomeModule`
3. O módulo **deve sobrescrever `appBarModel`** retornando um `AppBarModel` com o título e ações desejadas
4. A **classe de estado** do módulo deve utilizar o **mixin `AppBarCustomMixin`**

---

### 📦 Exemplo de implementação

```dart
class PolicyModule extends StatefulWidget implements IHomeModule {
  const PolicyModule({super.key});

  @override
  State<PolicyModule> createState() => _PolicyModuleState();

  @override
  AppBarModel get appBarModel => AppBarModel(
        title: '123',
        listActions: [
          const Text("test2"),
        ],
      );
}

class _PolicyModuleState extends State<PolicyModule> with AppBarCustomMixin {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NavigationPolicyController()),
      ],
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
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
    );
  }
}
```

---


## 🛰️ Nova função `request()` e tratamento de erros

Em nossa arquitetura, foi introduzida a função `request()` para centralizar chamadas HTTP e o tratamento de falhas. Essa abordagem facilita a manutenção, melhora a legibilidade e padroniza o fluxo de erros na aplicação.


### ✅ Sucesso — Código 200

- Em casos de sucesso, o `request()` retorna um `Map<String, dynamic>`, contendo os dados da requisição.
- Nenhuma exceção é lançada nesse cenário.


### ❌ Tratamento de Erros com `ErrorHandler.checkError()`

Quando o status code da resposta não for 200, usamos `ErrorHandler.checkError(statusCode)` para lançar falhas específicas que implementam a interface `IDixiFailure`.

Essa função verifica o código HTTP e lança uma das seguintes falhas:


### 📦 `400` — `FormatFailure`

- Indica que houve uma **requisição malformada** ou erro de validação no body.
- É lançada automaticamente quando o `statusCode == 400`.

**Comportamento esperado:**
- Lança: `FormatFailure`
- Mensagem: `FormatFailure().message`


### 🔒 `401` — `NoAccessFailure`

- Indica que o usuário **não possui permissão** ou está **não autenticado**.
- Lançada quando o `statusCode == 401`.

**Comportamento esperado:**
- Lança: `NoAccessFailure`
- Mensagem: `NoAccessFailure().message`


### 📭 `404` — `FormatFailure`

- Indica que o endpoint **não foi encontrado**.
- Lançada quando o `statusCode == 404`.

**Comportamento esperado:**
- Lança: `FormatFailure`
- Mensagem: `FormatFailure().message`


### 💥 `500` — `ServerFailure`

- Indica que houve um erro no **servidor**.
- Lançada quando o `statusCode == 500`.

**Comportamento esperado:**
- Lança: `ServerFailure`
- Mensagem: `ServerFailure().message`


### 🧪 Benefícios da abordagem

- ✅ **Centralização** do tratamento de erro via `ErrorHandler`.
- ✅ Todo erro ocorrido na API será tratado no front, caso não seja (200 - 299)
- ✅ Redução de duplicação de código.
- ✅ Facilidade para log e rastreio de falhas específicas.

---

### 🧱 Exemplo de uso 

```dart
try {
  final result = await requestApiService.request(RequestsType.get, someUri);
  // usar result normalmente...
} on IDixiFailure catch (e) {
  // tratar falha específica: FormatFailure, ServerFailure...
  // Ou retona mensagem automáticamente do Failure encontrado
  log(e.message);
}
```


Autoria: Renan Volpe
--
Revisão/Formatação: Luiz Coelho

