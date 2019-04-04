require_relative  '../../spec/spec_helper'


describe 'GoogleSingin' do
  it 'should singin password not true' do
    visit "https://accounts.google.com"
    find(:xpath, "//*[@id='lang-chooser']").click
    find(:xpath, "//div[@role='option' and contains(.,'English (United Kingdom)')]").click
    find(:xpath, "//*[@id='identifierId']").set("shapovalovii2000@gmail.com")
    find(:xpath, "//*[@id='identifierNext']").click
    find(:xpath, "//*[@id='password']/div[1]/div/div[1]/input").set("123")
    find(:xpath, "//*[@id='passwordNext']").click

    actualError = find(:xpath, "//div[contains(@class, 'RxsGPe')]").text
    expect('Wrong password. Try again or click Forgot password to reset it.').to eq(actualError)
  end
end
