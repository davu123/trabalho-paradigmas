(* Definir um novo tipo de dado para Yes e No *)
datatype result = Yes of int | No;

(* Definir a função bind para encadear operações seguras usando Yes e No *)
fun bind (No, _) = No
  | bind (Yes(x), f) = f(x);

(* Função que realiza uma divisão segura, retornando No se o divisor for 0 *)
fun safe_divide (x, 0) = No
  | safe_divide (x, y) = Yes(x div y);

(* Função que realiza uma subtração segura, retornando No se o resultado for negativo *)
fun safe_subtract (x, y) = 
    if x - y >= 0 then Yes(x - y) else No;

(* Função que compõe operações de divisão e subtração, propagando erros *)
fun compute (a, b, c) =
    bind (safe_divide (a, b), fn div_result =>
    bind (safe_subtract (div_result, c), fn final_result =>
    Yes(final_result)));

(* Testes *)
val result1 = compute(10, 2, 3);  (* Espera-se: Yes(2) *)
val result2 = compute(10, 0, 3);  (* Espera-se: No *)
val result3 = compute(10, 2, 10); (* Espera-se: No *)



(* Explicação do código:
Função bind: Controla o encadeamento de operações, verificando se o valor é Yes (rodou com sucesso) ou No (não rodou com sucesso). Se for No, a cadeia de operações é interrompida.

Funções safe_divide e safe_subtract: 
A função safe_divide realiza uma divisão segura entre dois números. Ela lida com o caso especial onde o divisor é zero: Se o divisor for 0, ela retorna No (erro).
Caso contrário, retorna Yes(x div y), onde x div y é o quociente da divisão.

A função safe_subtract realiza uma subtração segura:
Se o resultado da subtração for maior ou igual a 0, retorna Yes com o resultado.
Se o resultado for negativo, retorna No para indicar que a operação falhou.

Função compute: 
A função compute combina as operações de divisão e subtração, compondo as duas funções anteriores (safe_divide e safe_subtract) usando o bind.
Primeiro, tenta dividir a por b usando safe_divide.
Se a divisão for bem-sucedida (Yes(div_result)), o resultado é passado para safe_subtract, que tenta subtrair c de div_result.
Se ambas as operações forem bem-sucedidas, retorna Yes(final_result), que contém o valor final da composição.
Se qualquer uma das operações falhar, o "No" é retornado imediatamente. *)
