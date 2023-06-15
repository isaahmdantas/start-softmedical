class MenuGenerator < Rails::Generators::NamedBase
  source_root File.expand_path("templates", __dir__)


  def create_header_file
    header_file_path = "app/views/layouts/partials/_menu.html.erb"
    
    if File.exist?(header_file_path)
      append_menu_to_file(header_file_path)
    end
  end
  
  private

    def append_menu_to_file(file_path)
      menu_content = menu_content_to_append
    
      File.open(file_path, "a") do |file|
        file.puts(menu_content)
      end
    end
  
    def menu_content_to_append
      <<~HTML
      <div data-kt-menu-trigger="click" class='menu-item menu-accordion <%= active_collapse_menu?([["#{plural_table_name}", "*"]]) %>'>
        <!--begin:Menu link-->
        <span class="menu-link">
          <span class="menu-icon">
            <i class="ki-duotone ki-call fs-2">
              <span class="path1"></span>
              <span class="path2"></span>
              <span class="path3"></span>
              <span class="path4"></span>
              <span class="path5"></span>
              <span class="path6"></span>
              <span class="path7"></span>
              <span class="path8"></span>
            </i>
          </span>
          <span class="menu-title">#{human_name}</span>
          <span class="menu-arrow"></span>
        </span>
        <!--end:Menu link-->
        <!--begin:Menu sub-->
        <div class="menu-sub menu-sub-accordion">
          <!--begin:Menu item-->
          <div class="menu-item">
            <!--begin:Menu link-->
            <a class="menu-link" href='<%= #{plural_table_name}_path %>'>
              <span class="menu-bullet">
                <span class="bullet bullet-dot"></span>
              </span>
              <span class="menu-title">Lista</span>
            </a>
            <!--end:Menu link-->
          </div>
          <!--end:Menu item-->
          <!--begin:Menu item-->
          <div class="menu-item">
            <!--begin:Menu link-->
            <a class="menu-link" href='<%= new_#{singular_table_name}_path %>'>
              <span class="menu-bullet">
                <span class="bullet bullet-dot"></span>
              </span>
              <span class="menu-title">Novo(a)</span>
            </a>
            <!--end:Menu link-->
          </div>
          <!--end:Menu item-->
        </div>
        <!--end:Menu sub-->
      </div>
      HTML
    end


end
