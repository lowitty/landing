class LandingsController < ApplicationController
  def savemail
    @mailinfo = Mailinfo.new
    @mailinfo.email = params.permit(:email)[:email]
    @mailinfo.question = params.permit(:question)[:question]
    @res = @mailinfo.save

    respond = {}
    respond[:success] = @res
    respond[:email] = @mailinfo.email
    render json: respond
  end

  def moreinfo
    req_email = params.permit(:email)[:email]
    respond = {}

    @mailinfo = Mailinfo.find_by email: req_email
    render json: {success: false} and return if @mailinfo.nil?

    @mailinfo.company = params.permit(:company)[:company]
    @mailinfo.role = params.permit(:role)[:role]

    respond[:success] = @mailinfo.save
    render json: respond
  end

  def show
    @mailinfos = Mailinfo.all
  end
end
