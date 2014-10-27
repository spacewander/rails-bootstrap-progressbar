require 'bootstrap_progressbar/helper'

module BootstrapProgressbar
  module Rails
    class Engine < ::Rails::Engine
    end
  end
end

ActionView::Base.send :include, BootstrapProgressbar::Helper
