module ApplicationHelper
  include Pagy::Frontend

  def flash_alert_class(key)
    case key
    when 'notice', 'success'
      'success'
    when 'alert', 'error'
      'danger'
    when 'warning'
      'warning'
    else
      key
    end
  end

  def bootstrap_random_color
    %w[primary secondary success danger warning info dark].sample
  end

  def bootstrap_sequent_color(n = 0)
    %w[primary secondary success danger warning info dark].at(n % 7)
  end
end
