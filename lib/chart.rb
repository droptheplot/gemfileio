class Chart
  def initialize(data)
    @data = data
  end

  def render
    view.content_tag(:div, class: 'chart') do
      data.collect do |value|
        view.content_tag(:span, nil, class: 'bar', style: bar_style(value))
      end.join.html_safe
    end.html_safe
  end

  private

    attr_reader :data

    def bar_style(value)
      "height: #{bar_height(value)}%; width: #{100.00 / data.size}%"
    end

    def bar_height(value)
      value.to_f / @data.max.to_f * 100.0
    rescue ZeroDivisionError
      0.0
    end

    def view
      ActionController::Base.helpers
    end
end
