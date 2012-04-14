object @resto
if @resto.is_a? Table
  extends "models/table"
else
  extends "models/restaurant"
end
 