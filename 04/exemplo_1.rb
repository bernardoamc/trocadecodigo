class BancoDeDados
  #Eu conecto no banco e retorno os registros encontrados.

  def find(tabela, coluna, busca)
    puts "select #{coluna} from #{tabela} where #{coluna} = '#{busca}';"
  end
end

class Usuario < BancoDeDados
  attr_reader :tabela

  def initialize(tabela)
    @tabela = tabela
  end

  def busca_nome(nome)
    find(tabela, "nome", nome)
  end

  def busca_cpf(cpf)
    find(tabela, "cpf", cpf)
  end

  #busca_endereco(endereco)
  #busca_telefone(telefone)
  #muitas outras buscas...
end

u = Usuario.new("usuarios")
u.busca_nome("teste")
u.busca_cpf(1234)
