require_relative "forca.rb"

def boas_vindas
  puts "***************"
  puts "*Jogo da forca*"
  puts "***************"
  puts "Qual é o seu nome?"
  
  nome = gets.strip
  puts "\n\n"
  puts "Bem vindo ao jogo #{nome} :)"
  nome
end
  
def jogar_novamente?
  puts "Quer jogar novamente? (S/N)"
  puts "\n"
  jogar = gets.strip
  verifica_jogar_denovo(jogar, "S", "N")
end
  
def desenha_jogo_da_velha(palavra, erros)
  cabeca = erros_corpo(erros, 1, cabeca, "(_)")
  bracos = erros_corpo(erros, 2, bracos, "\\|/")
  corpo = erros_corpo(erros, 3, corpo, " | ")
  pernas = erros_corpo(erros, 4, pernas, "/ \\")

  puts "   _______"
  puts "  |/      |"
  puts "  |      #{cabeca}"  
  puts "  |      #{bracos}"  
  puts "  |      #{corpo}"  
  puts "  |      #{pernas}"
  puts "  |  "
  puts "  |  "
  puts "__|__    #{palavra}"
end

def pede_chute(chutes, erros, tenta, mascara)
  puts "\n"
  desenha_jogo_da_velha(mascara, erros)
  puts "Erros até agora #{erros}/#{tenta}"
  puts "\n"
  puts "Chutes até agora #{chutes}"
  puts "\n"
  puts "Entre com uma letra ou palavra"
  chute = gets.strip.downcase
  puts "\n"
  puts "Você chutou #{chute}"
  puts "\n"
  
  chute
end

def escolhendo_palavra(palavra)
  puts "Escolhendo uma palavra..."
  puts "Palavra escolida."
  puts "A palavra escolida tem #{palavra.size} letras."
  puts "\n"
  palavra
end

def avisa_pontos_totais(pontos_totais)
  puts "Você tem #{pontos_totais} pontos no total"
end

def passou_rank(melhor)
  puts "Você passou o rank do #{melhor}"
end

def list_rank(rank)
  puts "\n"
  puts "Melhor Rank foi do #{rank[0]} com #{rank[1]} pontos"
  puts "\n"
end

def chutou_o_mesmo
  puts "Você já chutou essa letra"
end

def pontos_ate_agora(pontos)
  puts "Você fez #{pontos} pontos até agora"
  pontos
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