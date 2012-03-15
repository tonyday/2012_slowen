class UploadsController < ApplicationController
  # GET /uploads
  # GET /uploads.json
  def index
    @uploads = Upload.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @uploads }
    end
  end

  # GET /uploads/1
  # GET /uploads/1.json
  def show
    @upload = Upload.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @upload }
    end
  end

  # GET /uploads/new
  # GET /uploads/new.json
  def new
    @upload = Upload.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @upload }
    end
  end

  # GET /uploads/1/edit
  def edit
    @upload = Upload.find(params[:id])
  end

  # POST /uploads
  # POST /uploads.json
  def create
    file_field = params['form']['file']
    ofx = OfxParser::OfxParser.parse(file_field)
    ofx.accounts.each do |account|
      p account.number
      p account.class.to_s.demodulize
      account.statement.transactions.each do |t|
        puts sprintf("\t%-10s %-40s %8.2f %-30s", t.date.strftime("%Y-%m-%d"), t.payee, t.amount, t.fit_id)
      end
    end
    render 'new'
    #@upload = Upload.new
    #@upload.user = current_user
    #@upload.file_name = file_field.original_filename
    #@upload.contents = file_field.read
    #@upload.save!
    #redirect_to @upload, notice: 'Upload was successfully updated.'
  end

  # PUT /uploads/1
  # PUT /uploads/1.json
  def update
    @upload = Upload.find(params[:id])

    respond_to do |format|
      if @upload.update_attributes(params[:upload])
        format.html { redirect_to @upload, notice: 'Upload was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @upload.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /uploads/1
  # DELETE /uploads/1.json
  def destroy
    @upload = Upload.find(params[:id])
    @upload.destroy

    respond_to do |format|
      format.html { redirect_to uploads_url }
      format.json { head :no_content }
    end
  end
end
