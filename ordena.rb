def count_sort(arr)
  # Encontrar o elemento máximo no array
  max_value = arr.max

  # Inicializar o array de contagem com zeros
  count_array = Array.new(max_value + 1, 0)

  # Mapeando cada elemento do array de entrada no array de contagem
  arr.each do |num|
    count_array[num] += 1
  end

  # Calculando a soma prefixada no array de contagem
  (1..max_value).each do |i|
    count_array[i] += count_array[i - 1]
  end

  # Criando o array de saída
  output_array = Array.new(arr.length)

  # Colocando os elementos na posição correta
  arr.reverse_each do |num|
    output_array[count_array[num] - 1] = num
    count_array[num] -= 1
  end

  # Copiando os elementos ordenados de volta para o array original
  output_array
end

# Código de teste
input_array = [4, 3, 12, 1, 5, 7, 3, 9]
sorted_array = count_sort(input_array)

# Exibir array ordenado
puts "Array ordenado: #{sorted_array.join(' ')}"
