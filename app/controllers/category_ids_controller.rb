class CategoryIdsController < ApplicationController
  def index
    @category_ids = CategoryId.all

    render("category_ids/index.html.erb")
  end

  def show
    @category_id = CategoryId.find(params[:id])

    render("category_ids/show.html.erb")
  end

  def new
    @category_id = CategoryId.new

    render("category_ids/new.html.erb")
  end

  def create
    @category_id = CategoryId.new

    @category_id.name = params[:name]
    @category_id.cuisine = params[:cuisine]

    save_status = @category_id.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/category_ids/new", "/create_category_id"
        redirect_to("/category_ids")
      else
        redirect_back(:fallback_location => "/", :notice => "Category created successfully.")
      end
    else
      render("category_ids/new.html.erb")
    end
  end

  def edit
    @category_id = CategoryId.find(params[:id])

    render("category_ids/edit.html.erb")
  end

  def update
    @category_id = CategoryId.find(params[:id])

    @category_id.name = params[:name]
    @category_id.cuisine = params[:cuisine]

    save_status = @category_id.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/category_ids/#{@category_id.id}/edit", "/update_category_id"
        redirect_to("/category_ids/#{@category_id.id}", :notice => "Category updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Category updated successfully.")
      end
    else
      render("category_ids/edit.html.erb")
    end
  end

  def destroy
    @category_id = CategoryId.find(params[:id])

    @category_id.destroy

    if URI(request.referer).path == "/category_ids/#{@category_id.id}"
      redirect_to("/", :notice => "Category deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Category deleted.")
    end
  end
end
