# frozen_string_literal: true

require_relative '../pages/landing_page'

Dado('que acesso a pagina de login e digito {string} e {string}') do |email, senha|
  visit 'https://magento.nublue.co.uk/customer/account/login/referer/aHR0cHM6Ly9tYWdlbnRvLm51Ymx1ZS5jby51ay8%2C/'
  @login = LandingPage.new
  @login.login(email, senha)
end

Quando('autentico, busco o produto, adiciono o produto no carrinho, finalizo a compra e gero o pedido') do
  @e2e = LandingPage.new
  @e2e.fluxo_e2e
end

Então('a compra deve ser realizada com sucesso e receber a seguinte mensagem {string}') do |mensagem|
  sleep 12
  expect(page).to have_content mensagem
end
