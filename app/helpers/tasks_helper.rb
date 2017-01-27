module TasksHelper
  def format_value(value)
    return 'N/A' if value.nil?
    value.strftime("%m/%d/%Y")
  end

  def status_tag(status)
    status_tag_builder(status)
  end

  private

  def status_tag_builder(status)
    case status
    when "not started"
      "<span class='label label-default'>#{status.titleize}</span>".html_safe
    when "in progress"
      "<span class='label label-primary'>#{status.titleize}</span>".html_safe
    when "late"
      "<span class='label label-warning'>#{status.titleize}</span>".html_safe
    when "completed"
      "<span class='label label-success'>#{status.titleize}</span>".html_safe
    when "completed late"
      "<span class='label label-danger'>#{status.titleize}</span>".html_safe
    end
  end
end
