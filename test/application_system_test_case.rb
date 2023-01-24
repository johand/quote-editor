# frozen_string_literal: true

require 'test_helper'

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  include Warden::Test::Helpers

  if ENV['SELENIUM_HUB_URL']
    Capybara.server_host = IPSocket.getaddress(Socket.gethostname)

    options = {
      browser: :remote,
      url: ENV['SELENIUM_HUB_URL']
    }
  end

  driven_by :selenium, using: :headless_chrome, screen_size: [1400, 1400], options:
end
