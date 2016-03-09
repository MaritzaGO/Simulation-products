class Producto < ActiveRecord::Base

validates :marca, :talla, :referencia, :color, :stock, :descripcion, :costo, :preciodeventa, presence: true
validates :marca, inclusion: {in: %w(Adidas Nike Reebok LaCoste Americanino Chevignon edc gef), message: "%{value} No es una marca valida"}
validates :talla, inclusion: {in: %w(S M L XL XXl), message: "%{value} No es una talla valida"}
validates :referencia, length: { is:5 }
validates :stock, numericality: {only_integer: true}
validates :color, exclusion: {in: %w(Amarillo Verde Anaranjado), message: "%{value} Color no esta disponible"}
validates :descripcion, length: {maximum: 100}
validates :costo, :preciodeventa, numericality: {greater_than: 0}

end
