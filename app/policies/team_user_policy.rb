class TeamUserPolicy
  attr_reader :user, :team_user

  def initialize(user, team_user)
    raise Pundit::NotAuthorizedError, 'must be logged in' unless user
    @user = user
    @team_user = team_user
  end

  def is_owner?
    @team_user.team.owners.exists?(user.id)
  end

  alias_method :destroy?, :is_owner?
  alias_method :update?, :is_owner?
  alias_method :create?, :is_owner?

end