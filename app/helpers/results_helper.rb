module ResultsHelper
  def display_response(r_set, question)
    sets = get_sets(r_set)

    if sets.size == 0
      return_text = "-"
    end

    if sets.size == 1
      return_text = (sets.first.string_value || sets.first.text_value ||
        show_answer(sets.first))
    else
      txt = ""
      sets.each do |set|
        txt << show_answer(set) + "<br/>"
      end
      return_text = txt
    end
    return_text
  end

  def get_sets(r_set)
    r_set.responses.select do |r|
      r.question.display_order == question.display_order
    end
  end

  def show_answer(set)
     set.answer.text
  end
end