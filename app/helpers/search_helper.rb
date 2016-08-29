module SearchHelper

  def query_field(query_term, options={})
    tag :input, class: "search__input",
                id: "query",
                name: "query",
                type: "text",
                placeholder: "Search",
                value: query_term,
                **options
  end

end
