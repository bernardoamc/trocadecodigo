class ClassEval
end

ClassEval.class_eval do
  def diga_oi
   puts "Oi!"
  end
end

ce = ClassEval.new
ce.diga_oi

ce.instance_eval do
  def meu_metodo
    puts "Respondo apenas ao ce"
  end
end

ce.meu_metodo

ce2 = ClassEval.new
ce2.meu_metodo
