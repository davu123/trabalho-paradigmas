(* Função que divide a lista em duas partes: menores e maiores que o pivô *)
fun partition (pivot, []) = ([], [])
  | partition (pivot, x::xs) =
      let
        val (less, greater) = partition (pivot, xs)
      in
        if x < pivot then (x::less, greater)
        else (less, x::greater)
      end

(* Função principal do quicksort *)
fun quicksort [] = []
  | quicksort (x::xs) =
      let
        val (less, greater) = partition (x, xs)
      in
        quicksort less @ (x :: quicksort greater)
      end

(* Função que retorna uma função que só ordena a lista quando necessário *)
fun lazy_quicksort lst =
    let
        val sorted = quicksort lst
    in
        fn () => sorted
    end

(* Função para imprimir uma lista *)
fun printList [] = ()
  | printList (x::xs) =
      (print (Int.toString x ^ " "); printList xs)

(* Exemplo de uso *)
val lazy_sorted_list = lazy_quicksort [3, 1, 4, 1, 5, 9, 2, 6]

(* Para calcular a lista ordenada, basta chamar a função *)
val final_sorted_list = lazy_sorted_list ()

(* Imprimir a lista ordenada *)
val _ = printList final_sorted_list;
