class LandingsController < ApplicationController
  def savemail
    @mailinfo = Mailinfo.new
    @mailinfo.email = params.permit(:email)[:email]
    @res = @mailinfo.save
    @test = 1
  end
  
  def show
    @mailinfos = Mailinfo.all
  end
end
