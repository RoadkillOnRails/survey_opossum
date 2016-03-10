class AuthorsController < ApplicationController
  before_action :set_author, only: [:edit, :update, :destroy]


  # GET /authors/new
  def new
    @author = Author.new
  end

  # GET /authors/1/edit
  def edit
  end

  # POST /authors
  def create
    @author = Author.new(author_params)

    if @author.save
      redirect_to root_path, notice: 'Author was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /authors/1
  def update
    if @author.update(author_params)
      redirect_to root_path, notice: 'Author was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /authors/1
  def destroy
    @author.destroy
    redirect_to login_path, notice: 'Author was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_author
      @author = Author.find(session[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def author_params
      params.require(:author).permit(:email, :password, :first_name, :last_name)
    end
end
