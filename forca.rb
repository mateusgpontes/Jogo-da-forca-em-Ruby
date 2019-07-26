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
      puts "Você já chutou essa letra"
      next
    end

    chutes << chute

    chutou_uma_letra = chute.size == 1

    if chutou_uma_letra
      procura_letra = chute[0]
      total_encontrado = conta_letra(palavra_secreta, procura_letra) 
      #palavra_secreta.count(procura_letra)
      
      if total_encontrado == 0
        puts "Nenhuma letra encontrada"
        puts "Você perdeu 5 pontos"
        pontos = pontos - 5
        erros = erros + 1
      else
        pontos = pontos + 5
        puts "Você ganhou 5 pontos por cada"
        puts "Foram encontradas #{total_encontrado} letras."
        puts "\n"
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