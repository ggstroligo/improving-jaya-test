module IssueEventSerializer
  module_function

  def [](event)
    {
      action: event.action,
      created_at: event.created_at.iso8601
    }
  end
end