# Pin npm packages by running ./bin/importmap

pin "application"
pin "@hotwired/turbo-rails", to: "turbo.min.js"
pin "@hotwired/stimulus", to: "stimulus.min.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin_all_from "app/javascript/controllers", under: "controllers"
pin "jquery", to: "jquery.min.js", preload: true
# pin "jquery", to: "https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.js", preload: true
pin "jquery_ujs", to: "jquery_ujs.js", preload: true
pin "popper", to: "popper.js", preload: true
pin "bootstrap" # @5.3.3
# pin "@popperjs/core", to: "https://unpkg.com/@popperjs/core@2/dist/umd/popper.js" # @2.11.8
