module ApplicationHelper
  def current_year
    Date.current.year
  end

  def github_url(author, repo)
    link_to 'Мой гитхаб с проектом по созданию и прохождению тестов',
            "https://github.com/#{author}/#{repo}", target: '_blank'
  end

  def flash_message(type, message)
    content_tag :p, message, class: "flash #{type}" if message
  end
end
