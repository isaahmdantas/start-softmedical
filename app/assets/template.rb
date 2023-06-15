directory "app/assets/stylesheets", force: true
directory "app/assets/javascripts", force: true
copy_file "app/javascript/controllers/remote_modal_controller.js", force: true

directory "vendor/assets", force: true
directory "app/assets/config", force: true       


insert_into_file "config/initializers/assets.rb", <<-RUBY, before: "# Rails.application.config.assets.precompile += %w( admin.js admin.css )"
    Rails.application.config.assets.precompile << ["*.svg", "*.png", "*.jpeg", "*.jpg", "*.woff", "*.ttf"]
    Rails.application.config.assets.paths << Rails.root.join('vendor', 'assets', 'fonts')
    Rails.application.config.assets.precompile += %w( metronic.js )
RUBY