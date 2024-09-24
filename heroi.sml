type spiderMan = { nome: string, fadiga: int, limiteFadiga: int, alimentacao: int, status: string };

(* função que atualiza a condição do Homem-Aranha baseado na alimentação e cansaço *)
fun atualizarCondicao (heroi: spiderMan) =
    let
        (* Se a alimentação for alta (>50), fadiga diminui, caso contrário, aumenta *)
        val novaFadiga = if #alimentacao heroi > 50 then #fadiga heroi - 10 else #fadiga heroi + 10
        val novaFadigaFinal = Int.max(0, Int.min(#limiteFadiga heroi, novaFadiga))
    in
        (* atualiza o status do herói com base no novo nível de fadiga *)
        {nome = #nome heroi, fadiga = novaFadigaFinal, limiteFadiga = #limiteFadiga heroi, 
         alimentacao = #alimentacao heroi, 
         status = if novaFadigaFinal = 0 then "Completamente Descansado" else "Cansado"}
    end;

(* função que sugere uma ação para o Homem-Aranha baseada no nível de fadiga e alimentação *)
fun sugerirAcao (heroi: spiderMan) =
    if #fadiga heroi > (#limiteFadiga heroi div 2) then
        if #alimentacao heroi < 30 then
            print(#nome heroi ^ " precisa comer e descansar para se recuperar!\n")
        else
            print(#nome heroi ^ " precisa de uma pausa para se recuperar do cansaço!\n")
    else
        print(#nome heroi ^ " está em boas condições para continuar lutando!\n");

(* exemplo de execução do programa para o Homem-Aranha *)
val spiderMan = {nome = "Homem-Aranha", fadiga = 40, limiteFadiga = 100, alimentacao = 25, status = "Cansado"};
val spiderManAtualizado = atualizarCondicao spiderMan;  
val _ = sugerirAcao spiderManAtualizado;

