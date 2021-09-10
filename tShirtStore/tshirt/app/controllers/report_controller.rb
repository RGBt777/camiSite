class ReportController < ApplicationController
  def custlist
  @custdata= Customer.order("firstname")
  end

  def prodlist
  @prodlist=Product.all
  end

  def salelist
  @salelist=Trandetail.all
  end

  def reportmenu
  end
  
end
