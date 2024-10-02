(* Função que calcula o Fibonacci *)
fun fib n =
  (* Array para guardar valores calculados *)
  let
    val memo = Array.array(n + 1, 0)
    
    fun fib_memo 0 = 0
      | fib_memo 1 = 1
      | fib_memo k =
          (* Se o resultado já foi calculado, retorna o valor na lista *)  
          if Array.sub(memo, k) <> 0 then
            Array.sub(memo, k)
          else
            let
              val result = fib_memo(k - 1) + fib_memo(k - 2)
            in
              Array.update(memo, k, result);
              result
            end
  in
    fib_memo n
  end

(* Imprimir *)
val n = 10
val result = fib n
val () = print (Int.toString result ^ "\n");
