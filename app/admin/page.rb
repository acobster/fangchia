ActiveAdmin.register Page do

  permit_params :title, :slug, :content

  index do
    column :title do |page|
      link_to page.title, edit_admin_page_path(page)
    end
    column :slug
    column :content do |page|
      # TODO html_safe
      words = page.content.split(' ')
      words.count > 25 ?
        words.first(25).join(' ')+'...' : # excerpt
        page.content
    end
    actions
  end

end
