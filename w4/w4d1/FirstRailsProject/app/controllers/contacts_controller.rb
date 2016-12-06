class ContactsController < ApplicationController
  def index
    render json: Contact.contacts_for_user_id(params[:user_id])
  end

  def create
    @contact = Contact.new(contact_params)

    if @contact.save
      render json: @contact
    else
      render(
        json: @contact.errors.full_messages,
        status: :unprocessable_entity
      )
    end
  end

  def show
    @contact = Contact.find_by_id(params[:id])

    if @contact
      render json: @contact
    else
      render text: "No contact with ID #{params[:id]}"
    end
  end

  def update
    @contact = Contact.find_by_id(params[:id])

    if !@contact
      render text: "No contact with ID #{params[:id]}"
    elsif @contact.update(contact_params)
      render json: @contact
    else
      render(
        json: @contact.errors.full_messages,
        status: :unprocessable_entity
      )
    end
  end

  def destroy
    @contact = Contact.find_by_id(params[:id])

    if @contact
      @contact.destroy
      render json: @contact
    else
      render text: "No contact with ID #{params[:id]}"
    end
  end

  private
  def contact_params
    params[:contact_share].permit(:user_id, :name, :email)
  end
end
