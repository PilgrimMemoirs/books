class BooksController < ApplicationController
  before_action :require_login, except: [:index]

  def index
    @books = Book.all
  end

  def show
    @book = Book.find_by(id: params[:id])
    if @book.nil?
      head :not_found
    end
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.create book_params

    if @book.id != nil
      flash[:success] = "Book added successfully"
      redirect_to books_path
    else
      render :new
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    @book.title = book_params[:title]
    @book.author = book_params[:author]
    @book.description = book_params[:description]
    if @book.save
      redirect_to book_path(@book.id)
    end
  end

  def destroy
    @book = Book.find(params[:id])
  end



  private

  def book_params
    params.require(:book).permit(:title, :author, :description)
  end

end
