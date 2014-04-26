class ForwardEmailJob

  include SuckerPunch::Job

  def perform(email)
    ForwardMailer.forward_from_incoming(email).deliver
  end

end
