# frozen_string_literal: true

class ChartsController < ApplicationController
  def home
    @base = params[:base] || 'BRL'
    other_currencies = Currency::CURRENCIES - [@base]

    # set default currency to compare with base currency
    @compare = params[:compare] || other_currencies.sample

    today = Date.today
    symbols = other_currencies.join(',')

    begin
      @response ||= HTTParty.get('https://api.exchangeratesapi.io/history?'\
      "start_at=#{today - 1.year}&end_at=#{today}&base=#{@base}&symbols=#{symbols}")
    rescue Errno::ECONNRESET => e
      count = 0
      count += 1
      retry unless count > 5
      puts "tried 5 times and couldn't get to api: #{e}"
    end

    respond_to do |f|
      f.js { render layout: false, content_type: 'text/javascript' }
      f.html
    end
  end
end
