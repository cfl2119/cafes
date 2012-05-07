class Event < ActiveRecord::Base

  has_many :suggestions, :dependent => :destroy
  has_many :caves, :through => :suggestions
  has_many :invitations, :dependent => :destroy
  has_many :users, :through => :invitations

  def is_invited
    if Invitation.current_user.id
      return true
    else
      return false
    end
  end



  def rankings(user)
    return Ranking.where(:suggestion_id => self.suggestions.collect(&:id), :guest_id => user.id)
  end

  def top3

    all_rankings = Ranking.where(:suggestion_id => self.suggestions.collect(&:id))


  	cafeHash = Hash.new(0)
  	all_rankings.each do |temp|
      cur_name = Suggestion.find_by_id(temp.suggestion_id).cafe.name
  		cafeHash[cur_name]=temp.value + cafeHash[cur_name]
    end

    sorted = cafeHash.sort_by { |name , totalRank| totalRank }
    
    ret = Array.new

  
    for i in 0..2 do
      if (i>=sorted.length)
        break
      else
        ret.push(sorted[i][0])
      end
    end

    return ret
  end


end
