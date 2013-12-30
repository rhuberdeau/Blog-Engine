require 'bootstrap-sass'
require 'pygments.rb'

module BlogEngine
  class Engine < ::Rails::Engine
    isolate_namespace BlogEngine
  end
end
