require 'sinatra'
require 'exoteric/counter'

module Exoteric
  class API < Sinatra::Application

    get "/count.json" do
      content_type "application/json"

      begin
        networks = (params[:n] || '').split(',')
        counter  = Counter.new(params)
        
        counter.count(*networks).to_json
      rescue => e
        status 500
        return { :error => e.to_s }.to_json
      end
    end

    get "/count.js" do
      content_type "text/javascript"

      begin 
        networks  = (params[:n] || '').split(',')
        @callback = params[:cb].to_s
        counter   = Counter.new(params)
        @count    = counter.count(*networks)

        erb <<-SCRIPT
var Exoteric={c:<%= @count.to_json %>, count: function(sn){return this.c[sn] || 0;}};
<% unless @callback.empty? %><%= @callback %>();<% end %>
SCRIPT
      rescue => e
        status 500
        return { :error => e.to_s }.to_json
      end
    end

  end
end
