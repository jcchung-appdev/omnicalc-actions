class TextTagController < ApplicationController
  def text_tag
    @text = params.fetch("text")

    # ================================================================================
    # Your code goes below.
    # ================================================================================

    client = Algorithmia.client(ENV.fetch("ALGORITHMIA_KEY"))
    algo = client.algo('nlp/AutoTag/1.0.1')
 
    @tags = algo.pipe(@text).result

    # ================================================================================
    # Your code goes above.
    # ================================================================================

    render("text_tag_templates/text_tag.html.erb")
  end

  def text_tag_form
    render("text_tag_templates/text_tag_form.html.erb")
  end
end
