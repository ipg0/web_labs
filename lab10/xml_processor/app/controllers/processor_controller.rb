# frozen_string_literal: true

XML_SERVER = 'http://localhost:3000/?format=xml'
XSL_LINK = "\n<?xml-stylesheet href=\"/visualizer.xsl\" type=\"text/xsl\"?>\n"
XSLT = Nokogiri::XSLT(File.read('public/visualizer.xsl').gsub(%r{<rm>(.*)</rm>}, '<rm>server-side</rm>'))
MSG_NOT_ACCEPTABLE = '406: Not Acceptable: This page is only available in XML format'

# Processor controller
class ProcessorController < ApplicationController
  def input; end

  def get_xml(from, to)
    uri = URI(XML_SERVER)
    uri.query = URI.encode_www_form({ from: from, to: to })
    Net::HTTP.get_response(uri)
  end

  def render_client(xml)
    xml.insert(xml.index("\n"), XSL_LINK)
  end

  def render_server(xml)
    XSLT.transform(Nokogiri::XML(xml))
        .to_s
        .html_safe
  end

  def output
    xml = get_xml(params['from'], params['to']).body
    respond_to do |format|
      format.xml { render xml: render_client(xml) }
      format.html { render html: render_server(xml) }
      format.all do
        render html: ERR_NOT_ACCEPTABLE, status: :not_acceptable
      end
    end
  end
end
