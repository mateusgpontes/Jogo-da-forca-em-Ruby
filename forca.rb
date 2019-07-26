require_relative "ui"

def conta_letra(palavra, letra)
  total = 0
  for caractere in palavra.chars
    if caractere == letra
      total = total + 1
    end
  end
  total
end

def jogar(nome)

  palavra_secreta = escolhe_palavra_secreta

  erros = 0
  tentativa = 5
  chutes = []
  pontos = 0

  while erros < tentativa
    chute = pede_chute(chutes, erros, tentativa)

    if chutes.include?(chute)
      chutou_o_mesmo
      next
    end

    chutes << chute

    chutou_uma_letra = chute.size == 1

    if chutou_uma_letra
      procura_letra = chute[0]
      total_encontrado = conta_letra(palavra_secreta, procura_letra) 
      #palavra_secreta.count(procura_letra)
      
      if total_encontrado == 0
        errou_letra_menos_5
        pontos = pontos - 5
        erros = erros + 1
      else
        pontos = pontos + 5
        letra_encontrada_mais_5(total_encontrado)
      end

    elsif chute == palavra_secreta
      pontos = pontos + 100   
      acertou_palavra(pontos)
      break
    else
      pontos = pontos - 30
      erros = erros + 1
      errou_palavra_menos_30           
    end   
      pontos_ate_agora(pontos)
  end
end

def jogo
  nome = boas_vindas

  loop do
    jogar(nome)
    if !jogar_novamente?
      break
    end
  end
end