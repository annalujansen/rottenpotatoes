class MoviesController < ApplicationController
  before_action :set_movie, only: %i[ show edit update destroy ]

  # GET /movies or /movies.json
  def index
    allowed_sorts = %w[title release_date]
    @all_ratings = Movie::RATINGS
    @sort = params[:sort] || session[:sort]
    @sort = nil unless allowed_sorts.include?(@sort)
    @ratings_to_show = ratings_to_show

    # Lembra a ordenação e o filtro escolhidos entre requisições.
    session[:sort] = @sort
    session[:ratings] = @ratings_to_show

    @movies = Movie.where(rating: @ratings_to_show)
    @movies = @movies.order(@sort) if @sort
  end

  # GET /movies/1 or /movies/1.json
  def show
  end

  # GET /movies/new
  def new
    @movie = Movie.new(release_date: Date.today)
  end

  # GET /movies/1/edit
  def edit
  end

  # POST /movies or /movies.json
  def create
    @movie = Movie.new(movie_params)

    respond_to do |format|
      if @movie.save
        format.html { redirect_to movies_path, notice: "#{@movie.title} was successfully created." }
        format.json { render :show, status: :created, location: @movie }
      else
        format.html { render :new, status: :unprocessable_content }
        format.json { render json: @movie.errors, status: :unprocessable_content }
      end
    end
  end

  # PATCH/PUT /movies/1 or /movies/1.json
  def update
    respond_to do |format|
      if @movie.update(movie_params)
        format.html { redirect_to @movie, notice: "Movie was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @movie }
      else
        format.html { render :edit, status: :unprocessable_content }
        format.json { render json: @movie.errors, status: :unprocessable_content }
      end
    end
  end

  # DELETE /movies/1 or /movies/1.json
  def destroy
    @movie.destroy!

    respond_to do |format|
      format.html { redirect_to movies_path, notice: "Movie was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  # POST /search_tmdb
  # Sad path only: nenhuma busca real é feita no TMDb ainda.
  def search_tmdb
    flash[:warning] = "'#{params[:search_terms]}' was not found in TMDb."
    redirect_to movies_path
  end

  private
    # Classificações marcadas no formulário; sem formulário, usa a sessão (ou todas).
    def ratings_to_show
      if params[:ratings]
        params[:ratings].keys & Movie::RATINGS
      elsif params[:commit] == "Refresh"
        []
      else
        session[:ratings] || Movie::RATINGS
      end
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_movie
      @movie = Movie.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def movie_params
      params.expect(movie: [ :title, :rating, :description, :release_date ])
    end
end
