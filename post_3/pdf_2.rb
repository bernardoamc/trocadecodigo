class PDF
  def gerar(&block)
    instance_eval &block
  end

  def ajustar_pagina(tipo)
    puts "Pagina do tipo #{tipo}"
  end

  def criar_texto(texto)
    puts "Novo texto gerado!"
  end

  def nova_pagina
    puts "Nova pagina gerada!"
  end

  #Muitos outros métodos...
end

pdf = PDF.new

pdf.gerar do
  ajustar_pagina(:a4)
  criar_texto("Gerador de PDF")
  nova_pagina
end
