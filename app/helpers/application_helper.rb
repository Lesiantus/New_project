module ApplicationHelper
  def current_year
    Date.current.year
  end

  def github_url(author, repo)
    link_to t('.github', author: author, repo: repo), "https://github.com/#{author}/#{repo}", target: '_blank'
  end

  def flash_message(type)
    { notice: 'alert-info',
      alert: 'alert-danger' }[type.to_sym]
  end
end
