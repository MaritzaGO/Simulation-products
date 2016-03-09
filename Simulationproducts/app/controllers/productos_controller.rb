class ProductosController < ApplicationController
  before_action :set_producto, only: [:show, :edit, :update, :destroy]

  # GET /productos
  # GET /productos.json
  def index
    @productos = Producto.all
    @productos = Producto.order(:marca)
    #@productos = Producto.find(10)
    #@productos = Producto.take(10)
    #@productos = Producto.first
    #@productos = Producto.last
    #@productos = Producto.find_by_color("blanco")
    #@productos = Producto.where(talla: ["s", "l"])
    #@productos = Producto.where.not(talla: ["s", "l"])
    #@productos = Producto.where.not(talla: ["s", "l"])
    #@productos = Producto.order(precio: :desc)
    #@productos = Producto.select(:costo, :precio)
    #@productos = Producto.limit(5).offset(10)
    #@productos = Producto.limit(5).offset(10)
    #@productos = Producto.group(:talla)
    #@productos = Producto.group(:tipo).having("sum(precio) > ?", 2800000)
    #@productos = Producto.all.readonly
    #@productos = Producto.includes(:categoria).limit(10)
    #@productos = Producto.where("cantidad > ? AND tipo = ?", 100, "hombre")
    @productos = Producto.where("referencia like  ? ", "%#{params[:referencia]}%")
    #pluck, sum, minimum, maximum, average
    @productos = Producto.sum(:stock)
    @productos = Producto.maximum(:costo)

  end

  # GET /productos/1
  # GET /productos/1.json
  def show
  end

  # GET /productos/new
  def new
    @producto = Producto.new
  end

  # GET /productos/1/edit
  def edit
  end

  # POST /productos
  # POST /productos.json
  def create
    @producto = Producto.new(producto_params)

    respond_to do |format|
      if @producto.save
        format.html { redirect_to @producto, notice: 'Producto was successfully created.' }
        format.json { render :show, status: :created, location: @producto }
      else
        format.html { render :new }
        format.json { render json: @producto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /productos/1
  # PATCH/PUT /productos/1.json
  def update
    respond_to do |format|
      if @producto.update(producto_params)
        format.html { redirect_to @producto, notice: 'Producto was successfully updated.' }
        format.json { render :show, status: :ok, location: @producto }
      else
        format.html { render :edit }
        format.json { render json: @producto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /productos/1
  # DELETE /productos/1.json
  def destroy
    @producto.destroy
    respond_to do |format|
      format.html { redirect_to productos_url, notice: 'Producto was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_producto
      @producto = Producto.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def producto_params
      params.require(:producto).permit(:referencia, :marca, :talla, :tipo_producto, :color, :categoria, :stock, :tela, :descripcion, :costo, :preciodeventa)
    end
end
