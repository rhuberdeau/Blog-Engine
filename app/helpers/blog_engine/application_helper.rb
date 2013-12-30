module BlogEngine
  module ApplicationHelper
    def coderay(text)
      Coderay.scan(text, :ruby).div(:line_numbers => :table)
    end
  end
end
