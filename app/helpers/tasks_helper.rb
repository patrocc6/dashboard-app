module TasksHelper
  def format_value(value)
    return 'N/A' if value.nil?
    value.strftime("%m/%d/%Y")
  end

  def status_tag(status)
    case status
    when "not started"
      status_tag_builder(status, 'default')
    when "in progress"
      status_tag_builder(status, 'primary')
    when "late"
      status_tag_builder(status, 'warning')
    when "completed"
      status_tag_builder(status, 'success')
    when "completed late"
      status_tag_builder(status, 'danger')
    end
  end

  private

  def status_tag_builder(status, label)
    "<span class='label label-#{label}'>#{status.titleize}</span>".html_safe
  end
end
