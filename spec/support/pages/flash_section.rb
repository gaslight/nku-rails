class FlashSection
  include Capybara::DSL

  def has_flash?
    has_css?(".flash")
  end

  def has_message?(message)
    has_css?(".flash", text: message)
  end
end
