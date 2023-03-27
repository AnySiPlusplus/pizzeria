module Pages
  module Pizzas
    class Show < ApplicationPrism
      set_url '/pizzas/{id}'

      section :body, 'body' do
        element :button_back_result, 'i.fa.fa-long-arrow-left.mr-15'
        element :button_read_more, 'a.in-gold-500.ml-10#read_more', text: I18n.t('books.show.read_more')
        element :short_description, '#short_description'
        element :full_description, '#full_description'
        element :add_to_cart, '.btn.btn-default.pull-right.general-position'
      end

      element :button_form, '.btn.btn.btn-default.mb-20'

      def fill_review_form(params, invalid: false)
        params.delete(:title) if invalid
        choose_rating_stars(params.delete(:rating))
        params.each do |key, value|
          fill_in "review_#{key}",	with: value
        end
      end

      def choose_rating_stars(count_stars)
        find("#star_#{count_stars}").click
      end
    end
  end
end
