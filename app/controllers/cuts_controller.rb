class CutsController < ApplicationController
  def index
  	@c=Cut.new
  end

  def create
  	@c=Cut.new(cut_params)
  	@c.short=shorten(@c.original)
  	@c.save
  end

  def goto
  	@c=Cut.find_by(short: params[:id])
  	redirect_to @c.original
  end

  private

  def cut_params
  	params.require(:cut).permit(:original)
  end
  def shorten(org)
  	salt='abcdefghijklmnopqrstuvwxyz1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZ'.chars.sample(2).join
  	shorturl=org[8..13].crypt(salt).delete('/').delete('.')[1..6]
  	if Cut.find_by(short:shorturl)!= nil
  		shorturl=shorturl.crypt('/.').delete('/').delete('.')[1..6]
  	end
  	return shorturl 
  end
end
