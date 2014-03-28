class PokesController < InheritedResources::Base
  
  def create
    poke = Poke.create(poke_params)
    redirect_to root_path(anchor: "share")
  end

  def poke_params
    params.require(:poke).permit(:first_name, :last_name, :email, :ip)
  end
end
