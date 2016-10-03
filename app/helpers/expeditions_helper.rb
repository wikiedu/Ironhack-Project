module ExpeditionsHelper
  def expedition_svg(client, expedition)
    original_url = request.base_url + "/clients/#{client.id}/expeditions/#{expedition.id}"
    qr = RQRCode::QRCode.new( original_url)
    svg = qr.as_svg(offset: 0, color: '000', shape_rendering: 'crispEdges', module_size: 4)
  end
end
