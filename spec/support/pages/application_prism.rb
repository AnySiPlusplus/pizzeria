class ApplicationPrism < SitePrism::Page
  element :success_flash, '.alert-success'
  element :danger_flash, '.alert-danger'
  element :error_flash, '.alert-warning'
end
