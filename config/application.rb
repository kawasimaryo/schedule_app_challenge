require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module ScheduleAppChallenge
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1

    # デフォルトのロケールを日本語に設定
    config.i18n.default_locale = :ja

    # ロケールファイルの読み込みパスを追加（必要に応じて）
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}').to_s]

    # タイムゾーン設定（必要に応じて）
    # config.time_zone = "Tokyo"
  end
end
