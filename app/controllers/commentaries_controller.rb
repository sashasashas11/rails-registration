class CommentariesController < ApplicationController
  before_action :set_commentary, only: [:edit, :update, :destroy]
  before_filter :authenticate_user!

  # GET transactions/1/commentaries
  # GET transactions/1/commentaries.json
  def index
    @commentaries = Commentary.where(transaction_id: params[:transaction_id])
		@transaction = Transaction.find_by_id params[:transaction_id]
    @commentary = Commentary.new(:transaction=>@transaction)
  end

  # GET transactions/1/commentaries/new
  def new
	  @transaction = Transaction.find_by_id params[:transaction_id]
    @commentary = Commentary.new(:transaction=>@transaction)
  end

  # GET transactions/1/commentaries/1/edit
  def edit
	  @transaction = Transaction.find_by_id params[:transaction_id]
  end

  # POST transactions/1/commentaries
  # POST transactions/1/commentaries.json
  def create
    @commentary = Commentary.new(massage: params[:commentary][:massage], user_id: current_user.id, transaction_id: params[:transaction_id])

    respond_to do |format|
      if @commentary.save
        format.html { redirect_to action: 'index', notice: 'Commentary was successfully created.' }
        format.json { render action: 'show', status: :created, location: @commentary }
      else
        format.html { render action: 'new' }
        format.json { render json: @commentary.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT transactions/1/commentaries/1
  # PATCH/PUT transactions/1/commentaries/1.json
  def update
    respond_to do |format|
      if @commentary.update(massage: params[:commentary][:massage])
        format.html { redirect_to transaction_commentaries_path, notice: 'Commentary was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @commentary.errors, status: :unprocessable_entity }
      end
    end
  end

  def export
	  header_columns = ['fname', 'lname', 'email']
	  columns =  ['Ivan', 'Urgant', 'iu@gmail.com']

	  file = CSV.generate do |csv|
		  csv << header_columns
		  columns.each do |c|
			  row << c
		  end
	  end

	  send_data file, filename: "export.csv"

  end

  # DELETE transactions/1/commentaries/1
  # DELETE transactions/1/commentaries/1.json
  def destroy
    @commentary.destroy
    respond_to do |format|
      format.html { redirect_to transaction_commentaries_path }
      format.json { head :no_content }
    end
  end

  private
    def set_commentary
      @commentary = Commentary.find(params[:id])
    end

end
