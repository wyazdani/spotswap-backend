class Admins::CarsController < ApplicationController
	before_action :authenticate_admin!
  before_action :car_model_params, only: [:create_model]

	def index
    @car_brands = CarBrand.all
	end

  def create_brand
    @car_brand = CarBrand.new(title: params[:name])
    @car_brand.image.attach(params[:image])
    if @car_brand.save
      redirect_to admins_cars_path
      flash[:alert] = "Car Brand has been added."
    else
      redirect_to admins_cars_path
      flash[:alert] = @car_brand.errors.full_messages.to_sentence
    end
  end

  def create_model
    @car_brand = CarBrand.find_by_id(params[:brand_id])
    @car_model = @car_brand.car_models.build(car_model_params)
    if @car_model.save
      redirect_to get_model_details_admins_cars_path(brand_id: @car_brand.id)
      flash[:alert] = "Car Model has been added."
    else
      redirect_to get_model_details_admins_cars_path(brand_id: @car_brand.id)
      flash[:alert] = @car_model.errors.full_messages.to_sentence
    end
  end

  def edit_model
    @model = CarModel.find_by_id(params[:id])
  end

  def update_model
    @car_model = CarModel.find_by_id(params[:id])
    @car_brand = @car_model.car_brand
    if @car_model.update(car_model_params)
      redirect_to get_model_details_admins_cars_path(brand_id: @car_brand.id)
      flash[:alert] = "Car Model has been updated."
    else
      redirect_to get_model_details_admins_cars_path(brand_id: @car_brand.id)
      flash[:alert] = @car_model.errors.full_messages.to_sentence
    end
  end

  def get_model_details
    @car_models = CarBrand.find_by_id(params[:brand_id]).car_models
  end

  def delete_model
    begin
      @car_model = CarModel.find_by_id(params[:id])
      if @car_model.destroy
        redirect_to get_model_details_admins_cars_path(brand_id: @car_model.car_brand.id)
        flash[:alert] = "Car Model has been deleted successfully."
      else
        redirect_to get_model_details_admins_cars_path(brand_id: @car_model.car_brand.id)
        flash[:alert] = @car_model.errors.full_messages.to_sentence
      end
    rescue  => e
      redirect_to get_model_details_admins_cars_path(brand_id: @car_model.car_brand.id)
      flash[:alert] = e
    end
    
  end

	private
  
  def authenticate_admin!
    if admin_signed_in?
      super
    else
      redirect_to new_admin_session_path, :notice => 'You need to sign in or sign up before continuing.'
    end
	end

  def car_model_params
    params.permit(:title, :color, :length, :width, :height, :released, :image)
  end
end
