Grupo 5 A-Train - ML


### 1. *Conceitos de Programação Funcional*

A *programação funcional* é baseada em *funções matemáticas* e trata a computação como a avaliação de expressões. Aqui estão alguns conceitos detalhados:

- *Funções puras*: Uma função pura não depende de variáveis externas ao seu escopo e sempre retorna o mesmo resultado para os mesmos argumentos. Além disso, não causa efeitos colaterais, ou seja, não modifica variáveis fora da função, nem interage com o "mundo externo" (como I/O, alterações de estado de objetos, etc.). Isso facilita o raciocínio sobre o código.
- Você sabe que uma função é pura quando, para um dado conjunto de entradas, ela sempre retorna a mesma saída e não afeta o estado externo.

- *Imutabilidade*: Em linguagens funcionais, os dados são imutáveis. Quando você "altera" um dado, na verdade está criando uma cópia modificada do dado original. Isso reduz a chance de bugs causados por alterações inesperadas de estado.
- Linguagens funcionais otimizam esse comportamento através de estruturas de dados persistentes, que reaproveitam partes imutáveis para evitar cópias desnecessárias.

- *Funções de ordem superior: São funções que recebem outras funções como argumento ou retornam uma função como resultado. Isso é possível porque funções são consideradas **cidadãos de primeira classe* (ou seja, podem ser manipuladas como qualquer outro dado).
- Elas permitem uma programação mais flexível e modular. Funções podem ser reutilizadas, passadas e combinadas para criar comportamentos complexos sem duplicar código.

- *Recursão*: Na programação funcional, a recursão substitui os laços tradicionais (como for e while). Isso porque a imutabilidade impede que se alterem variáveis de controle, como faria em um laço imperativo.
- Em linguagens que não otimizam recursão, o uso excessivo pode causar problemas de desempenho. Contudo, muitas linguagens funcionais otimizam recursões com *recursão em cauda* (tail recursion), eliminando esse custo.

---

### 2. *Funções Matemáticas*

A programação funcional deriva suas raízes na matemática, especialmente no *cálculo lambda*, uma formalização da noção de computação baseada na aplicação de funções.

- *Transparência referencial*: Uma função que, dada a mesma entrada, sempre retorna a mesma saída, independentemente de quantas vezes for chamada. Isso torna o código previsível e fácil de depurar.
- Ela facilita o raciocínio sobre o comportamento do código. Se uma função não altera o estado externo, você pode analisá-la isoladamente, sem se preocupar com o contexto onde ela é usada.

- *Composição de funções*: A ideia de compor funções consiste em pegar duas ou mais funções e combiná-las para criar uma nova. Isso é uma poderosa ferramenta para reutilização de código.

Exemplo em ML:
ml
fun square x = x * x
fun double x = x * 2
fun squareDouble x = square(double(x))

Aqui, squareDouble é uma composição das funções square e double. A função double é aplicada primeiro, e o resultado é passado para square.

- Ela permite criar comportamentos complexos a partir de funções simples e reutilizáveis, sem precisar reescrever lógica duplicada.

---

### 3. *Fundamentos das Linguagens de Programação Funcional*

As linguagens funcionais diferem das imperativas em vários aspectos. Aqui estão alguns fundamentos essenciais:

- *Avaliação preguiçosa (lazy evaluation): Em linguagens como Haskell, as expressões só são avaliadas quando seus resultados são necessários, o que permite a criação de **estruturas infinitas* (como listas infinitas).
- Não necessariamente. A avaliação preguiçosa pode evitar cálculos desnecessários, tornando o programa mais eficiente. Além disso, permite representar dados infinitos de forma limitada.

- *Inferência de tipos*: Em linguagens como ML, o compilador pode inferir o tipo de uma expressão com base no contexto, sem a necessidade de declarações explícitas. Isso torna o código mais conciso.
  - *Pergunta possível: *A inferência de tipos não pode gerar erros difíceis de detectar?
    - Em geral, a inferência de tipos é bastante robusta e, quando um erro acontece, o compilador avisa. Entretanto, pode ser necessário algum tempo para entender a mensagem de erro.

---

### 4. *Aplicação*

A programação funcional tem várias aplicações práticas:

- *Paralelismo e concorrência*: Como as funções puras não têm efeitos colaterais, é mais fácil paralelizar e distribuir a computação em vários núcleos de CPU ou máquinas.

- Sem estados mutáveis, não há problemas de sincronização entre threads ou processos, pois as funções puras não interferem umas nas outras.

- *Sistemas distribuídos*: Funções puras podem ser enviadas e executadas remotamente sem a preocupação de que o estado global do sistema seja afetado, o que facilita o desenvolvimento de sistemas distribuídos.

---

### 5. *Sintaxe, Semântica, Tipos de Dados, Controle de Fluxo, Funções e Modularidade*

#### *Sintaxe e Semântica*
A sintaxe de uma linguagem funcional é normalmente muito compacta e direta, evitando estruturas imperativas como loops ou modificações de variáveis.

Em ML, por exemplo:
ml
fun factorial 0 = 1
  | factorial n = n * factorial(n - 1)

Isso define uma função recursiva que calcula o fatorial. A recursão substitui o uso de um loop for.

#### *Tipos de Dados*
- *Tipos primitivos*: Inteiros, strings, floats, etc.
- *Tipos compostos*: Listas, tuplas, e registros.
- *Tipos algébricos*: Um conceito fundamental em ML, que permite combinar tipos de maneira flexível.

Exemplo de um *tipo algébrico* em ML:
ml
datatype shape = Circle of real | Rectangle of real * real

Aqui, shape pode ser um Circle com um raio (real) ou um Rectangle com uma largura e altura (real * real).

- Tipos algébricos permitem a combinação de valores de maneira mais simples e direta do que as classes. Em linguagens funcionais, eles são usados para representar opções distintas sem a sobrecarga de herança e métodos, como nas classes orientadas a objetos.

#### *Controle de Fluxo*
O controle de fluxo é feito usando *expressões condicionais* e recursão, em vez de loops imperativos como for e while.

#### *Modularidade*
A *modularidade* é um princípio fundamental, onde o código pode ser dividido em módulos. Isso melhora a organização e a reutilização do código.

Exemplo de um módulo em ML:
ml
structure Geometry = struct
  fun area (Circle r) = 3.14 * r * r
  | area (Rectangle (w, h)) = w * h
end
