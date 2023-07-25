class BooksController < ApplicationController
  def new
 @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
   if @book.save
      #flash[:notice] = "投稿に成功しました。"
    redirect_to book_path(@book.id)#どういったbookのIDにいきたいか？？
   else
     @user = current_user
    @books = Book.all
    #flash[:notice] = "投稿に失敗しました。"
    render :index
   end
  end

  def edit
  @book = Book.find(params[:id])

  end
  def update
   @book = Book.find(params[:id])
    @book.update(book_params)
    redirect_to book_path
  end
  def destroy
  book = Book.find(params[:id])
  book.destroy
  redirect_to books_path
  end
  def index
    @user =current_user
  # @user = User.find(params[:id])
    @book= Book.new
  #   #@books= @user.books
    @books= Book.all
  end
  def show
  @book = Book.find(params[:id])
  @newbook = Book.new
  @user = @book.user
  end
 private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end