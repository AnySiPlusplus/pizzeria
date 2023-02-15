module Pages
  module Dashboard
    class Index < SitePrism::Page
      set_url '/admin/dashboard'

      section :body, 'body' do
        element :title_dasboard, '#page_title', text: I18n.t('active_admin.dashboard')
      end
    end
  end
end
