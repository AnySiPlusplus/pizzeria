module Pages
  module ActiveAdmin
    module Reviews
      class Show < SitePrism::Page
        set_url '/admin/reviews/{id}'

        section :buttons, 'body' do
          element :approve, 'a', text: I18n.t('review.button.approve')
          element :reject, 'a', text: I18n.t('review.button.reject')
        end
      end
    end
  end
end
