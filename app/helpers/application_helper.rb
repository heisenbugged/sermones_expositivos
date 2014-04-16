module ApplicationHelper

  def header_class
    @header_class || ""
  end

  def pretty_date(date)
    date.strftime("%b %d, %Y")
  end

end
