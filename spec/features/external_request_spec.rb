# frozen_string_literal: true

require 'rails_helper'

describe 'external request', type: :feature do
  it 'queries exchangerate api' do
    uri = URI('https://api.exchangeratesapi.io/latest?base=USD')
    response = Net::HTTP.get(uri)
    expect(response).to be_an_instance_of(String)
  end
end
