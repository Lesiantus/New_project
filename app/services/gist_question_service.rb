class GistQuestionService
  def initialize(question)
    @question = question
    @test = @question.test
    @client = OctokitClient.new
  end

  def call
    @client.create_gist(gist_params)
  end

  def success?
    @client.success?
  end

  private

  def gist_params
    {
      description: I18n.t('gists.description', title: @test.title),
      files: {
        'test-guru-question.txt' => {
          content: gist_content
        }
      }
    }
  end

  def gist_content
    content = [@question.body]
    content += @question.answers.pluck(:body)
    content.join("\n")
  end
end
