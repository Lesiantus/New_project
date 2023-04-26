class GistQuestionService
  def initialize(question)
    @question = question
    @test = @question.test
    @client = OctokitClient.new
  end

  def call
    response = @client.create_gist(gist_params)

    GistResult.new(response)
  end

  GistResult = Struct.new(:response) do
    def html_url
      response['html_url']
    end

    def success?
      html_url.present?
    end
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
    [@question.body, *@question.answers.pluck(:body)].join("\n")
  end
end
