class BancoDeDados
  #Eu conecto no banco e retorno os registros encontrados.

  def find(tabela, coluna, busca)
    puts "select #{coluna} from #{tabela} where #{coluna} = '#{busca}';"
  end
end

class Usuario < BancoDeDados
  attr_reader :tabela

  def initialize(tabela, colunas)
    @tabela = tabela
    colunas.each { |coluna| self.class.define_campo(coluna) }
  end

  def self.define_campo(coluna)
    define_method("busca_#{coluna}") do |busca|
      find(tabela, coluna, busca)
    end
  end
end

u = Usuario.new("usuarios", %w(nome cpf endereco))
u.busca_nome("teste")
u.busca_cpf(1234)
puts u.respond_to?(:busca_nome)
