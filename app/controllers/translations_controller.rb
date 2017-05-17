class TranslationsController < ApplicationController

  before_action :set_translation, only: [:show, :update, :destroy]

  def index
    @translations = Translation.all
    json_response(@translations)
  end

  # GET /translations/:id
  def show
    json_response(@translation)
  end

  # POST /translations
  def create
    @translation = Translation.create!(translation_params)
    json_response(@translation, :created)
  end

  # PUT /translations/:id
  def update
    @translation.update(translation_params)
    head :no_content
  end

  # DELETE /translations/:id
  def destroy
    @translation.destroy
    head :no_content
  end

  private

  def translation_params
    # whitelist params
    params.permit(:original_copy, :code, :translated_copy, :application_domain)
  end

  def set_translation
    @translation = Translation.find(params[:id])
  end

end
