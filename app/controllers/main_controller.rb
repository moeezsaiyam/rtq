class MainController < ApplicationController
  def about
  end

  def duas
  end

  def contact
  end

  def credit
  end

  def faqs
  end
  
  def trans_setting
  @translation = Translation.all
  
  end

end
