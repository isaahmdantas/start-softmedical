directory "app/assets/stylesheets", force: true
directory "app/assets/javascripts", force: true
directory "app/assets/images", force: true
copy_file "app/javascript/controllers/remote_modal_controller.js", force: true

copy_file "app/assets/config/manifest.js", force: true

directory "vendor/assets", force: true    


insert_into_file "config/initializers/assets.rb", <<-RUBY, after: "# Rails.application.config.assets.precompile += %w( admin.js admin.css )"
    Rails.application.config.assets.precompile << ["*.svg", "*.png", "*.jpeg", "*.jpg", "*.woff", "*.ttf"]
    Rails.application.config.assets.paths << Rails.root.join('vendor', 'assets', 'fonts')
    Rails.application.config.assets.paths << Rails.root.join('vendor', 'assets', 'plugins')
    Rails.application.config.assets.precompile += %w( metronic.js )
RUBY