module ApplicationHelper
  def title(value = nil)
    @title = value if value
    @title ? "<APP NAME> | #{@title}" : "<APP NAME>"
  end
end