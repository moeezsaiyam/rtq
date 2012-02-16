# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  def parse_tags(question)
    unless question.verse_ids.blank?
      html = Array.new
      verses_ids = question.verse_ids.split(",")
      tags = question.tags.split(",")
      verses_ids.each_with_index do |id,i|
        html.push("<a href='/verse/#{id}?prev=#{request.fullpath}'>Sura # #{tags[i].split(':')[0]}: Aya # #{tags[i].split(':')[1]}</a>")
      end
      html = html.join(" , ")
    end
  end

  def prev_aya(verse)
    id = verse.id-1
    return html = "<div class='left'><a href='/verse/#{id}'>Previous</a></div>" if id > 0
  end

  def nxt_aya(verse)
    id = verse.id+1
    return html = "<div class='right'><a href='/verse/#{id}'>Next</a></div>" if id < 6237
  end

end
