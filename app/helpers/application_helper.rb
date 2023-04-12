module ApplicationHelper
  FLASH_ALERTS = { notice: 'alert-success', alert: 'alert-danger' }.freeze

  def current_year
    Date.current.year
  end

  def github_url(author, repo)
    link_to t('.github', author: author, repo: repo), "https://github.com/#{author}/#{repo}", target: '_blank'
  end

  def flash_message
    flash.map do |type, message|
      flash_class = "flash col-6 alert #{FLASH_ALERTS[type.to_sym]}"
      content_tag :div, message, class: flash_class if flash[type]
    end.join("\n").html_safe
  end
end
