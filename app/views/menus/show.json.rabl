@resto = Table.new(:number => 0, :restaurant => @resto) unless @resto.is_a? Table
object @resto
extends "models/table" 