type aTrain = { nome: string, velocidade: int ref, saude: int ref, limiteSaude: int, usoCompostoV: int };

(* Função que atualiza a condição de A-Train com base no uso de velocidade e Composto V *)
fun atualizarCondicao (heroi: aTrain) =
    let
        (* Se A-Train está usando muita velocidade, a saúde diminui *)
        val novaSaude = if !(#velocidade heroi) > 80 then !(#saude heroi) - 20 else !(#saude heroi) - 10
        (* Quanto mais ele usa Composto V, mais sua saúde é prejudicada *)
        val novaSaudeComCompostoV = novaSaude - (#usoCompostoV heroi * 5)
        (* Garantindo que a saúde nunca caia abaixo de 0 *)
        val saudeFinal = Int.max(0, novaSaudeComCompostoV)
    in
        (* Atualizando a referência de saúde *)
        #saude heroi := saudeFinal;
        heroi  (* Retorna o herói atualizado *)
    end;

(* Função que sugere uma ação para A-Train com base na saúde e no uso de velocidade *)
fun sugerirAcao (heroi: aTrain) =
    if !(#saude heroi) < (#limiteSaude heroi div 2) then
        if #usoCompostoV heroi > 0 then
            print(#nome heroi ^ " precisa parar de usar Composto V e descansar para se recuperar!\n")
        else
            print(#nome heroi ^ " precisa diminuir sua velocidade para não colapsar!\n")
    else
        print(#nome heroi ^ " está em boas condições para continuar correndo!\n");

(* Exemplo de execução do programa para A-Train *)
val aTrain = {nome = "A-Train", velocidade = ref 90, saude = ref 70, limiteSaude = 100, usoCompostoV = 3};
val aTrainAtualizado = atualizarCondicao aTrain;  (* Condição atualizada após monitoramento *)
val _ = sugerirAcao aTrainAtualizado;
