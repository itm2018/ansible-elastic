filter {
  if [type] == "syslog" {
	grok {
	  match => { "message" => "%{SYSLOGTIMESTAMP:syslog_timestamp} %{SYSLOGHOST:syslog_hostname} %{DATA:syslog_program}(?:\[%{POSINT:syslog_pid}\])?: %{GREEDYDATA:syslog_message}" }
	  add_field => [ "received_at", "%{@timestamp}" ]
	  add_field => [ "received_from", "%{host}" ]
	}
	syslog_pri { }
	date {
	  match => [ "syslog_timestamp", "MMM  d HH:mm:ss", "MMM dd HH:mm:ss" ]
	}
  }
}
