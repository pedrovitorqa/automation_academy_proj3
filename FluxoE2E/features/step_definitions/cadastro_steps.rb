# frozen_string_literal: true

require_relative '../pages/landing_page'

Dado('que eu acesso a página de cadastro') do
  visit 'https://magento.nublue.co.uk/customer/account/create/'
end

Quando('cadastro com {string} e {string} e {string} e {string} e {string}') do |primeiro_nome, final_nome, email, senha, senha_confirme|
  @email = email
  @cadastro = LandingPage.new
  @cadastro.preencher_cadastro(primeiro_nome, final_nome, email, senha, senha_confirme)
end

Então('devo ser cadastrado com sucesso') do
  expect(page).to have_content @email
end

Então('devo ver a mensagem {string}') do |mensagem|
  expect(page).to have_content mensagem
end
