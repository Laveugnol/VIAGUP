module ApplicationHelper
  def separateur(arg)
    arg.to_s.split("").reverse.each_slice(3).map {|y| y.join("").reverse}.reverse.join(" ")
  end

end
