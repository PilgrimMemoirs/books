class BooksController < ApplicationController
  before_action :find_book, only: [:show, :edit, :update, :destroy]

  # def index
  #   @books = Book.all
  # end

  def index
    if params[:genre_id]
      # localhost:3000/genres/2/books

      # we are in the nested route
      # retrieve books based on the genre
      #@books = Book.includes(:genres).where(genres: { id: params[:genre_id]})
      @books = Genre.find(params[:genre_id]).books
    else
      #localhost:3000/books
      # we are in our 'regular' route
      @books = Book.all
    end
  end

  def show; end

  def new
    @book = Book.new
  end

  def create
    @book = Book.create book_params

    if @book.id != nil
      flash[:success] = "Book added successfully"
      flash[:hello] = "Oh hey there!"
      redirect_to books_path
    else
      flash.now[:failure] = "Book did not save, try again"
      render :new
    end
  end

  def edit; end

  def update
    @book.title = book_params[:title]
    @book.author = book_params[:author]
    @book.description = book_params[:description]
    if book.save
      redirect_to book_path(@book.id)
    end
  end

  def destroy; end


   def buy
     user_book = UserBook.create(user_id: session[:user_id], book_id: params[:id])

     if user_book
       flash[:success] = "Book Bought!"
       redirect_to user_path(session[:user_id])
     end
   end



  private

  def book_params
    params.require(:book).permit(:title, :author, :description)
  end

  def find_book
    @book = Book.find_by_id(params[:id])
  end

end
