module Pages
  module Pizzas
    class Index < ApplicationPrism
      set_url 'pizzas'

      section :body, 'body' do
        element :button_all, 'a.filter-link', text: I18n.t('pizzas.categories_bar.all')
        element :button_sort_by, 'a.dropdown-toggle.lead.small'
        element :button_name_asc, 'a', text: I18n.t('pizzas.order_dropdown.name_asc')
        element :button_name_desc, 'a', text: I18n.t('pizzas.order_dropdown.name_desc')
        element :button_price_asc, 'a', text: I18n.t('pizzas.order_dropdown.price_asc')
        element :button_price_desc, 'a', text: I18n.t('pizzas.order_dropdown.price_desc')
        element :button_newest, 'a', text: I18n.t('pizzas.order_dropdown.newest')
        element :button_most_popular, 'a', text: I18n.t('pizzas.order_dropdown.most_popular')
        element :button_view_more, 'button.btn.btn-primary#view_more', text: I18n.t('pizzas.view_more.view_more')
        elements :pizzas, '.col-xs-6.col-sm-3'
      end

      def button_category
        body.find_all('a.filter-link').map(&:text).last.split("\n").first
      end

      def pizza
        body.find_all('.general-thumb-info p.title').map(&:text)
      end

      def pizzas_count
        body.find_all('.col-xs-6.col-sm-3').map(&:text).count
      end

      def button_show
        body.find('i.fa.fa-eye.thumb-icon')
      end
    end
  end
end
