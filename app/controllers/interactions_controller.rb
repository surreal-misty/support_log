class InteractionsController < ApplicationController
  before_action :authenticate_user!

  def index
    @interactions = Interaction.all
  end

  def new
    @interaction = Interaction.new
    @customers = Customer.all
  end

  def create
    @interaction = Interaction.new(interaction_params)
    @interaction.user = current_user

    if @interaction.save
      redirect_to customer_path(@interaction.customer), notice: "対応履歴を保存しました"
    else
      @customers = Customer.all
      render :new, status: :unprocessable_entity
    end
  end

def destroy
  @interaction = Interaction.find(params[:id])
  customer = @interaction.customer
  @interaction.destroy

  redirect_to customer_path(customer), notice: "対応履歴を削除しました"
end

  private

  def interaction_params
    params.require(:interaction).permit(
      :customer_id,
      :interaction_type,
      :history,
      :occurred_at
    )
  end
end
