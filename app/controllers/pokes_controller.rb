class PokesController < InheritedResources::Base
  def create
    params[:ip] = request.remote_ip
    poke = Poke.create_from_user(params)

    PokeMailer.delay.thanks_for_poke(poke)
    PokeMailer.delay.fight_against_the_abuse_on_the_trains(poke)

    redirect_to root_path(anchor: "share")
  end
end
