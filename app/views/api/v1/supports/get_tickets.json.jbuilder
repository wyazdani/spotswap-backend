json.pending_tickets @pending_tickets do |ticket|
  json.ticket ticket
  json.image ticket.image.attached? ? ticket.image.url : ""
end

json.completed_tickets @completed_tickets do |ticket|
  json.ticket ticket
  json.image ticket.image.attached? ? ticket.image.url : ""
end