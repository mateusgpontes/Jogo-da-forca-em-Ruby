require_relative "ui"


#Modo que usa mais memoria
def escolhe_palavra_secreta
  palavras = File.read("dicionario.txt")
  todas_as_palavras = palavras.split("\n")
  percorre_dicionario = rand(todas_as_palavras.size)
  palavra_secreta = todas_as_palavras[percorre_dicionario].downcase
  escolhendo_palavra(palavra_secreta)
end

def escolhe_palavra_secreta_sem_muita_memoria
  palavras = File.new("dicionario.txt")
  todas_as_palavras = palavras.gets.to_i
  percorre_dicionario = rand(todas_as_palavras)
  for linha in 1..(percorre_dicionario)
    palavras.gets
  end
  palavra_secreta = palavras.gets.strip.downcase
  palavras.close
  escolhendo_palavra(palavra_secreta)
end

def conta_letra(palavra, letra)
  total = 0
  for caractere in palavra.chars
    if caractere == letra
      total = total + 1
    end
  end
  total
end

def palavra_mascara(chutes, palavra_secreta)
  mascara = ""
  for letra in palavra_secreta.chars
    if chutes.include?(letra)
      mascara << letra
    else
      mascara << "_"
    end
  end
  mascara
end

def jogar(nome)

  palavra_secreta = escolhe_palavra_secreta_sem_muita_memoria

  erros = 0
  tentativa = 5
  chutes = []
  pontos = 0

  while erros < tentativa
    mascara = palavra_mascara(chutes, palavra_secreta)
    chute = pede_chute(chutes, erros, tentativa, mascara)

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