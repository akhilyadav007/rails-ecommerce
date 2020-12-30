module InstrumentsHelper

  def instrument_autor(instrument)
    user_signed_in? && current_user.id == instrument.user_id
  end
  
end
