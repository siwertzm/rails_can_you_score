module ApplicationHelper
  def top_players_class(index)
    case index
    when 0 then return "gold"
    when 1 then return "silver"
    when 2 then return "bronze"
    else
      return ""
    end
  end
end
