# frozen_string_literal: true

class ChartsController < ApplicationController
  def home
    base = params[:base] || 'BRL'
    compare = params[:compare] || 'USD'
    today = Date.today

    # the API can not compare EUR
    return nil if base == compare

    begin
      @response ||= HTTParty.get('https://api.exchangeratesapi.io/history?'\
      "start_at=#{today - 1.year}&end_at=#{today}&base=#{base}&symbols=#{compare}")
    rescue Errno::ECONNRESET => e
      count += 1
      retry unless count > 5
      puts "tried 10 times and couldn't get #{url}: #{e}"
    end
  end
end
