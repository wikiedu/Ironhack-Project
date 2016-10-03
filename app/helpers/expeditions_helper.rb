module ExpeditionsHelper
  def expedition_svg(client, expedition)
    original_url = request.base_url + "/clients/#{client.id}/expeditions/#{expedition.id}"
    qr = RQRCode::QRCode.new( original_url)
    svg = qr.as_svg(offset: 0, color: '000', shape_rendering: 'crispEdges', module_size: 4)
  end

  def expedition_state_row_class(expedition)
    if expedition.state == "delivered"
      'success'
    elsif expedition.state == "picked_up"
      'warning'
    elsif expedition.state == "canceled"
      'danger'
    else
      'info'
    end

  end
end
