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

def pede_chute(chutes, erros)
  puts "\n"
  puts "Erros até agora #{erros}"
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

def jogar(nome)

  palavra_secreta = escolhe_palavra_secreta

  erros = 0
  tentativa = 5
  chutes = []
  pontos = 0

  while erros < tentativa
    chute = pede_chute(chutes, erros)
    chutes << chute
    chutou_uma_letra = chute.size == 1

    if chutou_uma_letra
      procura_letra = chute[0]
      total_encontrado = 0
            
      for i in 0..(palavra_secreta.size - 1)
        if palavra_secreta[i] == procura_letra
          pontos = pontos + 5
          total_encontrado = total_encontrado + 1
        end
      end

      if total_encontrado != 0
        puts "Você ganhou 5 pontos por cada letra encontrada"
        puts "Foram encontradas #{total_encontrado} letras."
      else    
        puts "Nenhuma letra encontrada"
        puts "Você perdeu 5 pontos"
        pontos = pontos - 5
        erros = erros + 1
      end

    elsif chute == palavra_secreta
      puts "Parabens Acertou!"
      pontos = pontos + 100   
      puts "Você ganhou #{pontos} pontos"
      puts "\n"
      break
    else
      puts "Você errou tente novamente"
      puts "Você perdeu 30 pontos"
      puts "\n"
      pontos = pontos - 30
      erros = erros + 1           
    end   
      puts "Você tem #{pontos} pontos até agora"
    end
end

nome = boas_vindas

loop do
  jogar(nome)
  if !jogar_novamente?
    break
  end
end