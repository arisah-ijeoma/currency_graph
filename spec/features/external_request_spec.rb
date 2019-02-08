# frozen_string_literal: true

require 'rails_helper'

describe 'external request', type: :feature do
  let(:api) { 'https://api.exchangeratesapi.io/latest?base=USD' }

  it 'queries exchangerate api' do
    uri = URI(api)
    response = Net::HTTP.get(uri)
    expect(response).to be_an_instance_of(String)
  end

  it 'can timeout' do
    stub_request(:any, api).to_timeout
  end

  it 'can raise errors' do
    stub_request(:any, api).to_raise(Errno::ECONNRESET)
  end
end
