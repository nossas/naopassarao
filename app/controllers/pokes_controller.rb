class PokesController < InheritedResources::Base
  
  def create
    poke = Poke.find_by_email(params[:poke][:email])
    poke = Poke.create!(poke_params) if poke.nil?

    PokeMailer.thanks_for_poke(poke)
    PokeMailer.fight_against_the_abuse_on_the_trains(poke)

    redirect_to root_path(anchor: "share")
  end

  def poke_params
    params.require(:poke).permit(:first_name, :last_name, :email, :ip)
  end
end
