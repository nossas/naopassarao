class PokeMailer < ActionMailer::Base
  default from: "Anna - Minha Sampa <anna@minhasampa.org.br>"

  def thanks_for_poke poke
    @poke = poke
    headers["X-MC-Tags"] = "naopassarao,thanks_for_poke"
    mail(to: @poke.email, subject: "Obrigada por participar. Agora, vamos espalhar essa ideia!")
  end

  def fight_against_the_abuse_on_the_trains poke
    headers["X-MC-Tags"] = "naopassarao,fight_against_the_abuse_on_the_trains"
    mail(to: 'Luiz Antonio Carvalho Pacheco <josias.ds@gmail.com>', subject: "Exijo que o Metrô combata ativamente o abuso sexual em vagões e estações!", from: "#{poke.first_name} #{poke.last_name} <#{poke.email}>")
  end
end
