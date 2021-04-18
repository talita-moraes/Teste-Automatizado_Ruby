Dir[File.join(File.dirname(__FILE__), './pages/*_page.rb')].each { |file| require file }

module Pages
  def geral
    @geral ||= GeralPage.new
  end

  def home
    @home ||= HomePage.new
  end

  def login
    @login ||= LoginPage.new
  end

  def alterar_conta
    @alterar_conta ||= AlterarContaPage.new
  end
end
