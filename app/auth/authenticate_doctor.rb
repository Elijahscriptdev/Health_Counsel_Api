class AuthenticateDoctor
  def initialize(email, password)
    @email = email
    @password = password
  end

  # Service entry point
  def call
    JsonWebToken.encode(doctor_id: doctor.id) if doctor
  end

  private

  attr_reader :email, :password

  # verify user credentials
  def doctor
    doctor = Doctor.find_by(email: email)
    return doctor if doctor&.authenticate(password)

    # raise Authentication error if credentials are invalid
    raise(ExceptionHandler::AuthenticationError, Message.invalid_credentials)
  end
end
