# Deploy pfSense firewall, monitor with Snort and ELK Stack

## Giới thiệu
Dự án này triển khai tường lửa pfSense, giám sát an ninh mạng bằng Snort và ELK Stack (Elasticsearch, Logstash, Kibana) để phát hiện và phân tích các mối đe dọa trong mạng LAN.

## Mục tiêu
- **pfSense**: Triển khai tường lửa để bảo vệ mạng, cài đặt các quy tắc firewall và NAT.
- **Snort**: Cài đặt và cấu hình để phát hiện các cuộc tấn công mạng, cung cấp cảnh báo.
- **ELK Stack**: Cài đặt và cấu hình để thu thập và phân tích dữ liệu từ Snort, hiển thị qua dashboard Kibana.

## Cấu trúc dự án
- **pfSense**: Cấu hình firewall và NAT.
- **Snort**: Luật phát hiện xâm nhập và log cảnh báo.
- **ELK Stack**: Tích hợp log từ Snort, hiển thị dashboard phân tích.

## Hướng dẫn triển khai
Chi tiết hướng dẫn triển khai pfSense, Snort và ELK Stack có trong thư mục `docs/`.

