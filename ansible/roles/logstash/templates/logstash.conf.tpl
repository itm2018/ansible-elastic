input {
  beats {
	port => 5044
	ssl => true
	ssl_certificate => "/etc/pki/tls/certs/logstash-forwarder.crt"
	ssl_key => "/etc/pki/tls/private/logstash-forwarder.key"
  }
}
