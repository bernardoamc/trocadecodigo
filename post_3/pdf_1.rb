class PDF

  def gerar
    yield(self)
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

pdf.gerar do |pdf|
  pdf.ajustar_pagina(:a4)
  pdf.criar_texto("Gerador de PDF")
  pdf.nova_pagina
end
