class DishesController < ApplicationController
  before_action :current_user_must_be_dish_user, :only => [:edit, :update, :destroy]

  def current_user_must_be_dish_user
    dish = Dish.find(params[:id])

    unless current_user == dish.user
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @dishes = Dish.page(params[:page]).per(10)

    render("dishes/index.html.erb")
  end

  def show
    @dish = Dish.find(params[:id])

    render("dishes/show.html.erb")
  end

  def new
    @dish = Dish.new

    render("dishes/new.html.erb")
  end

  def create
    @dish = Dish.new

    @dish.user_id = params[:user_id]
    @dish.venues_id = params[:venues_id]
    @dish.category_id = params[:category_id]

    save_status = @dish.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/dishes/new", "/create_dish"
        redirect_to("/dishes")
      else
        redirect_back(:fallback_location => "/", :notice => "Dish created successfully.")
      end
    else
      render("dishes/new.html.erb")
    end
  end

  def edit
    @dish = Dish.find(params[:id])

    render("dishes/edit.html.erb")
  end

  def update
    @dish = Dish.find(params[:id])
    @dish.venues_id = params[:venues_id]
    @dish.category_id = params[:category_id]

    save_status = @dish.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/dishes/#{@dish.id}/edit", "/update_dish"
        redirect_to("/dishes/#{@dish.id}", :notice => "Dish updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Dish updated successfully.")
      end
    else
      render("dishes/edit.html.erb")
    end
  end

  def destroy
    @dish = Dish.find(params[:id])

    @dish.destroy

    if URI(request.referer).path == "/dishes/#{@dish.id}"
      redirect_to("/", :notice => "Dish deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Dish deleted.")
    end
  end
end
