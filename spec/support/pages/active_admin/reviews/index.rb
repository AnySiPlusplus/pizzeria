module Pages
  module ActiveAdmin
    module Reviews
      class Index < SitePrism::Page
        set_url '/admin/reviews'

        section :buttons, 'body' do
          element :all, 'li.scope.all'
          element :unprocessed, '.scope.unprocessed'
          element :approved, '.scope.approved'
          element :rejected, '.scope.rejected'
          element :view, '.view_link.member_link'
        end
      end
    end
  end
end
