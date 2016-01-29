class VerticalMarketPolicy < ApplicationPolicy
  attr_reader :user, :vertical_market

  def initialize(user, vertical_market)
    @user = user
    @vertical_market = vertical_market
  end

  def index?
    true
  end

  def show?
    true
  end

  def create?
    original_content_writer?
  end

  def new?
    original_content_writer?
  end

  def translate?
    @user.translator?
  end

  def update?
    original_content_writer?
  end

  def edit?
    original_content_writer?
  end

  def destroy?
    original_content_writer?
  end

  private

  def original_content_writer?
    @user.admin?
  end
end
