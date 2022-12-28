module Pages
  module Homes
    class Index < ApplicationPrism
      set_url '/'

      section :header, 'header' do
        element :logo, 'a.navbar-brand', text: I18n.t('layouts.header_guess_user.pizzeria')
        element :button_home, 'a', text: I18n.t('layouts.header_guess_user.home')
        element :button_menu, 'a', text: I18n.t('layouts.header_guess_user.menu')
        element :button_sign_up, 'a', text: I18n.t('layouts.header_guess_user.sign_up')
        element :button_sign_in, 'a', text: I18n.t('layouts.header_guess_user.log_in')
      end

      section :body, 'body' do
        element :welcome_text, 'h2.h1', text: I18n.t('homes.index.welcome')
        element :button_get_started, '.btn.btn-default', text: I18n.t('homes.index.started')
        element :best_sellers_text, 'h3', text: I18n.t('homes.index.best_sellers')
      end

      section :footer, 'footer' do
        element :link_home, 'a.nav-link', text: I18n.t('layouts.footer.home')
        element :link_menu, 'a.nav-link', text: I18n.t('layouts.footer.menu')
        element :email, 'p.general-nav-mail', text: I18n.t('layouts.footer.some_email')
        element :phone_number, 'p.general-nav-number', text: I18n.t('layouts.footer.some_number')
        element :link_facebook, 'a.nav-link'
        element :link_twitter, 'a.nav-link'
        element :link_google_plus, 'a.nav-link'
        element :link_instagram, 'a.nav-link'
      end
    end
  end
end
