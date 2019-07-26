def chutou_o_mesmo
  puts "Você já chutou essa letra"
end

def pontos_ate_agora(pontos)
  puts "Você tem #{pontos} pontos até agora"
end

def errou_letra_menos_5
  puts "Nenhuma letra encontrada"
  puts "Você perdeu 5 pontos"
end

def letra_encontrada_mais_5(total_encontrado)
  puts "Você ganhou 5 pontos por cada"
  puts "Foram encontradas #{total_encontrado} letras."
  puts "\n"
end

def acertou_palavra(pontos)
  puts "Parabens Acertou!"
  puts "Você ganhou #{pontos} pontos"
  puts "\n"
end

def errou_palavra_menos_30
  puts "Você errou tente novamente"
  puts "Você perdeu 30 pontos"
  puts "\n"
end


def boas_vindas
  puts "Bem vindo ao jogo da forca"
  puts "Qual é o seu nome?"
  
  nome = gets.strip
  puts "\n\n"
  puts "Bem vindo ao jogo #{nome}."
  nome
end
  
def escolhe_palavra_secreta
  puts "Escolhendo uma palavra..."
  palavra = "programar"
  puts "Palavra escolida."
  puts "A palavra escolida tem #{palavra.size} letras."
  puts "\n"

  palavra
end
  
def jogar_novamente?
  puts "Quer jogar novamente? (S/N)"
  puts "\n"
  jogar = gets.strip
  case jogar.upcase
  when "S"
    jogar = true
  else
    jogar = false
  end
end
  
def pede_chute(chutes, erros, tenta)
  puts "\n"
  puts "Erros até agora #{erros}/#{tenta}"
  puts "\n"
  puts "Chutes até agora #{chutes}"
  puts "\n"
  puts "Entre com uma letra ou palavra"
  chute = gets.strip
  puts "\n"
  puts "Você chutou #{chute}"
  puts "\n"
  
  chute
end