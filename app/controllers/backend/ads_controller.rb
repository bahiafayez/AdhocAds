class Backend::AdsController < Backend::ResourceController
   
  # GET /products
  # GET /products.json
  def index
    #@ads = Ad.all
    @ads2 = Ad.order(:URL).search(params[:search])
    #@ads= @ads2.page(params[:page]).per(3)
    #.search(params[:search])
    @ads=Kaminari.paginate_array(@ads2).page(params[:page]).per(5)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @ads }
    end
  end

  # GET /products/1
  # GET /products/1.json
  def show
    @ad = Ad.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @ad }
    end
  end

  # GET /products/new
  # GET /products/new.json
  def new
    @ad = Ad.new
    #@ad.tags.build
    get_all_tags

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @ad }
    end
  end
  
  def get_all_tags
    @tags = Tag.find(:all, :order => 'name')
  end

  # GET /products/1/edit
  def edit
    @ad = Ad.find(params[:id])
    get_all_tags
  end

  # POST /products
  # POST /products.json
  def create
    @ad = Ad.new(params[:ad])
    get_all_tags
    respond_with(@ad) do |format|
      if @ad.save
        format.html { redirect_to backend_ad_path(@ad), notice: 'Ad was successfully created.' }
        format.json { render json: @ad, status: :created, location: @ad }
      else
        #flash[:error]= 'eeror'
        format.html { render action: "new" }
        format.json { render json: @ad.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /products/1
  # PUT /products/1.json
  def update
    #params[:tags] ||= {}
    @ad = Ad.find(params[:id])
    get_all_tags
    
    respond_to do |format|
      if @ad.update_attributes(params[:ad])
        format.html { redirect_to backend_ad_path(@ad), notice: 'Ad was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @ad.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @ad = Ad.find(params[:id])
    @ad.destroy

    respond_to do |format|
      format.html { redirect_to backend_ads_url }
      format.json { head :no_content }
    end
  end
  
  
end
