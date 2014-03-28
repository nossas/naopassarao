class PokesController < InheritedResources::Base
  def create
    poke = Poke.create_from_user(permitted_params)

    PokeMailer.delay.thanks_for_poke(poke)
    PokeMailer.delay.fight_against_the_abuse_on_the_trains(poke)

    redirect_to root_path(anchor: "share")
  end

  def permitted_params
    {:poke => params.fetch(:poke, {}).permit(:first_name, :last_name, :email)}
  end
end
