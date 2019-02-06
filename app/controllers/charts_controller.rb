# frozen_string_literal: true

class ChartsController < ApplicationController
  def home
    base = params[:cur] || 'BRL'
    today = Date.today
    @response ||= HTTParty.get('https://api.exchangeratesapi.io/history?'\
    "start_at=#{today - 1.year}&end_at=#{today}&base=#{base}&symbols=USD,EUR,AUD")

    # one base three other currencies
    # base can be changed
    # you can't compare base with itself OR you'll get 1
    # symbols will have to be dynamic
  end
end
