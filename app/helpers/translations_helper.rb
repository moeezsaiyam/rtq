module TranslationsHelper

  def translation_selected(translation)
    @translation.try(:table_nam) == translation.table_nam
  end

end
