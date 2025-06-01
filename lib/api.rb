# frozen_string_literal: true

require 'json'

class Api

  def routes
    get('/ping') { ping }
  end

  def ping
    { result: :pong }
  end

  def call(env)
    begin
      @response = nil
      @env = env
      routes
    rescue StandardError => e
      @response = error_response(e)
    end
    @response || not_found_response
  end

  private

  def get(path)
    return unless @env['REQUEST_METHOD'] == 'GET'
    return unless @env['REQUEST_PATH'] == path

    @response = valid_response(yield)
  end

  def valid_response(msg)
    [
      200,
      { 'Content-Type' => 'application/json' },
      [msg.to_json]
    ]
  end

  def error_response(error)
    [
      500,
      { 'Content-Type' => 'application/json' },
      [{ error: "#{error.exception.class}: #{error.message}" }.to_json]
    ]
  end

  def not_found_response
    [
      404,
      { 'Content-Type' => 'application/json' },
      [{ error: 'Not Found' }.to_json]
    ]
  end
end
