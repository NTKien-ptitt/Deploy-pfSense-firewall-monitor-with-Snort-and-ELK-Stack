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

## 1: Cài đặt pfSense
Tải về và cài đặt pfSense:
Tải ISO pfSense từ trang web chính thức.
Tạo USB bootable và cài đặt pfSense lên phần cứng hoặc máy ảo.
- Cấu hình cơ bản:
Thực hiện cấu hình ban đầu qua trình hướng dẫn để cài đặt các giao diện mạng, tài khoản quản trị, và cấu hình các thiết lập WAN/LAN.
Bước 2: Cài đặt Snort trên pfSense
Truy cập vào bảng điều khiển pfSense:

Đăng nhập vào giao diện web pfSense.
Cài đặt Snort:

Điều hướng đến System > Package Manager > Available Packages.
Tìm “Snort” và nhấn Install.
Cấu hình Snort:

Sau khi cài đặt, vào Services > Snort.
Kích hoạt Snort trên giao diện WAN (hoặc các giao diện khác bạn muốn giám sát).
Cấu hình các quy tắc bằng cách chọn các danh mục mong muốn và tải về chúng.
Bước 3: Cấu hình quy tắc (rules) cảnh báo cho Snort
Chọn danh mục quy tắc (rule categories):

Trong Snort > Global Settings, tìm đến phần Snort Rule Set Downloads and Updates.
Đăng ký tài khoản tại Snort.org để có thể tải về các rule của Snort. Sau đó, nhập oinkmaster code vào mục này nếu được yêu cầu.
Chọn các nguồn tải quy tắc mà bạn muốn sử dụng như Snort VRT, Emerging Threats (ET), v.v.
Nhấn Update để tải về các quy tắc mới nhất từ các nguồn này.
Cấu hình danh mục quy tắc cho giao diện cụ thể:

Quay lại Snort > Interfaces và chọn Edit (biểu tượng bút chì) trên giao diện bạn đã kích hoạt Snort (VD: WAN).
Trong phần cấu hình của giao diện, chọn tab Categories.
Bạn sẽ thấy danh sách các danh mục quy tắc (như policy, malware, trojan, web_client, v.v.) để bật/tắt tùy theo nhu cầu.
Tích chọn vào các danh mục quy tắc bạn muốn kích hoạt (VD: Policy Rules, Malware Rules, Trojan Rules).
Cấu hình các quy tắc cụ thể:

Chuyển đến tab Rules trong cấu hình của giao diện.
Tại đây, bạn có thể thấy danh sách chi tiết các quy tắc trong mỗi danh mục đã tải.
Bạn có thể kích hoạt/tắt từng quy tắc cụ thể bằng cách nhấn vào ô chọn bên cạnh quy tắc đó.
Ngoài ra, có thể chỉnh sửa các quy tắc cảnh báo, chẳng hạn như mức độ ưu tiên, loại hành động (chặn hoặc chỉ ghi log).
Thiết lập hành động (Action):
Cấu hình danh mục quy tắc cho giao diện cụ thể:

Quay lại Snort > Interfaces và chọn Edit trên giao diện mà bạn đã kích hoạt Snort (VD: WAN).
Trong phần cấu hình của giao diện, chọn tab Categories.
Tích chọn vào các danh mục quy tắc cần thiết (VD: Policy Rules, ICMP Rules cho chặn ping, Web Client Rules cho truy cập web).
Cấu hình quy tắc chặn ping:

Chuyển đến tab Rules trong cấu hình của giao diện.
Tìm kiếm ICMP rules hoặc các quy tắc liên quan đến ping (ICMP Protocol).
Kích hoạt quy tắc chặn ping bằng cách chọn Block. Nếu không có quy tắc có sẵn, bạn có thể thêm quy tắc thủ công như sau:
Action: Chọn Block.
Protocol: Chọn ICMP.
Source/Destination: Thiết lập nguồn và đích tùy theo yêu cầu (VD: Tất cả hoặc mạng cụ thể).

Trong tab Preprocessors and Flow của giao diện, bạn có thể thiết lập hành động cho từng loại cảnh báo.
Chọn hành động Block nếu bạn muốn chặn các kết nối đáng ngờ, hoặc Alert nếu bạn chỉ muốn ghi log mà không chặn.
Lưu cấu hình và cập nhật quy tắc:

Sau khi hoàn tất cấu hình quy tắc, nhấn Save và sau đó chọn Apply để áp dụng các thay đổi.
Bạn có thể vào lại Global Settings để cập nhật quy tắc định kỳ hoặc cấu hình tự động cập nhật.
Bước 4: Kiểm tra và giám sát cảnh báo Snort
Xem log cảnh báo:

Đi tới Status > System Logs > Snort để xem log của các cảnh báo Snort.
Tại đây, bạn có thể kiểm tra các sự kiện mà Snort đã phát hiện và ghi lại, bao gồm thời gian, nguồn, và loại mối đe dọa.
Bước 1: Cài đặt Java
Elasticsearch cần Java để hoạt động. Cài đặt OpenJDK bằng lệnh sau:

bash

Copy
sudo apt update
sudo apt install openjdk-11-jdk
Bước 2: Cài đặt Elasticsearch
Thêm kho lưu trữ GPG:
bash

Copy
wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -
Thêm kho lưu trữ Elasticsearch:
bash

Copy
echo "deb https://artifacts.elastic.co/packages/7.x/apt/ stable main" | sudo tee -a /etc/apt/sources.list.d/elastic-7.x.list
Cài đặt Elasticsearch:
bash

Copy
sudo apt update
sudo apt install elasticsearch
Cấu hình Elasticsearch:
Mở tệp cấu hình:
bash

Copy
sudo nano /etc/elasticsearch/elasticsearch.yml
Thay đổi hoặc thêm các cấu hình sau:
yaml

Copy
network.host: localhost
http.port: 9200
Khởi động Elasticsearch:
bash

Copy
sudo systemctl start elasticsearch
sudo systemctl enable elasticsearch
Kiểm tra Elasticsearch:
Sử dụng lệnh sau để kiểm tra xem Elasticsearch có đang chạy không:
bash

Copy
curl -X GET "localhost:9200"
Bước 3: Cài đặt Logstash
Cài đặt Logstash:
bash

Copy
sudo apt install logstash
Tạo cấu hình Logstash:
Tạo tệp cấu hình cho Logstash:
bash

Copy
sudo nano /etc/logstash/conf.d/logstash.conf
Thêm cấu hình cơ bản:
plaintext

Copy
input {
    stdin {}
}

output {
    elasticsearch {
        hosts => ["localhost:9200"]
        index => "logstash-%{+YYYY.MM.dd}"
    }
}
Khởi động Logstash:
bash

Copy
sudo systemctl start logstash
sudo systemctl enable logstash
Bước 4: Cài đặt Kibana
Cài đặt Kibana:
bash

Copy
sudo apt install kibana
Cấu hình Kibana:
Mở tệp cấu hình:
bash

Copy
sudo nano /etc/kibana/kibana.yml
Thay đổi hoặc thêm các cấu hình sau:
yaml

Copy
server.port: 5601
server.host: "localhost"
elasticsearch.hosts: ["http://localhost:9200"]
Khởi động Kibana:
bash

Copy
sudo systemctl start kibana
sudo systemctl enable kibana
Bước 5: Truy cập Kibana
Mở trình duyệt và truy cập vào địa chỉ:


Copy
http://localhost:5601

Cấu hình pfSense để chuyển log Snort qua Syslog
Cấu hình Snort để gửi log qua Syslog:

Truy cập vào Services > Snort trên giao diện pfSense.
Chọn giao diện mà bạn đã bật Snort, sau đó vào phần cấu hình của giao diện đó.
Trong mục Alert Settings, bạn có thể chọn tùy chọn gửi log qua Syslog.
Cấu hình Syslog trên pfSense:

Vào Status > System Logs > Settings.
Tìm phần Remote Syslog Servers và nhập IP của máy chủ ELK (hoặc bất kỳ máy chủ log nào).
Đảm bảo rằng bạn chọn đúng các loại log muốn gửi, như là Snort Alerts.
Lưu các thay đổi.
Cấu hình Logstash để nhận log từ Syslog
Trên máy chủ ELK của bạn, hãy cấu hình Logstash để nhận log Snort qua Syslog.

Tạo file cấu hình cho Logstash: Ví dụ, tạo file /etc/logstash/conf.d/snort_syslog.conf với nội dung sau:

plaintext
Sao chép mã
input {
    syslog {
        port => 514
        type => "snort"
    }
}

filter {
    if [type] == "snort" {
        # Thêm filter nếu cần thiết để phân tích log Snort
    }
}

output {
    elasticsearch {
        hosts => ["http://localhost:9200"]
        index => "snort-logs-%{+YYYY.MM.dd}"
    }
}
Mở cổng Syslog:

Đảm bảo rằng firewall trên máy chủ ELK đã mở cổng 514 để nhận log Syslog.
Khởi động lại Logstash:

Khởi động hoặc khởi động lại Logstash để áp dụng cấu hình mới:
bash
Sao chép mã
sudo systemctl restart logstash
Kiểm tra log trong Kibana
Sau khi hoàn tất, bạn có thể vào Kibana và kiểm tra các log được gửi từ Snort. Nếu bạn đã tạo một chỉ mục (index) cho snort-logs-*, log sẽ hiển thị và bạn có thể tạo các bảng điều khiển (dashboard) tùy chỉnh.
Bước 1: Truy cập vào Kibana
Mở trình duyệt web và truy cập vào Kibana với địa chỉ http://<IP_CUA_KIBANA>:5601 (thay <IP_CUA_KIBANA> bằng địa chỉ IP của máy chủ Kibana).
Đăng nhập nếu Kibana yêu cầu xác thực.
Bước 2: Tạo Index Pattern cho log Snort
Vào mục Management:

Tại menu bên trái, chọn Stack Management > Kibana > Index Patterns.
Tạo Index Pattern mới:

Nhấn Create index pattern để bắt đầu.
Trong phần Index pattern name, nhập tên pattern là snort-logs-* (phù hợp với cấu hình trong Logstash mà chúng ta đã thiết lập trước đó).
Kibana sẽ tự động nhận diện các index phù hợp với tên pattern này.
Xác định trường thời gian:

Trong phần Time field, chọn trường thời gian chính xác nếu có (ví dụ: @timestamp), sau đó nhấn Create index pattern để hoàn tất.
Bước 3: Kiểm tra log Snort trong mục Discover
Vào mục Discover:

Chọn Discover từ menu bên trái.
Chọn Index Pattern:

Ở phần trên bên trái, chọn index pattern snort-logs-* để chỉ xem log Snort.
Kiểm tra dữ liệu log:

Kibana sẽ tải và hiển thị các log Snort mới nhất.
Bạn có thể sử dụng bộ lọc thời gian ở góc trên bên phải để chọn khoảng thời gian mong muốn (ví dụ: 15 phút qua, 24 giờ qua).
Bước 4: Tạo Dashboard để trực quan hóa log Snort
Vào mục Dashboard:

Từ menu bên trái, chọn Dashboard và nhấn Create dashboard.
Thêm biểu đồ và bảng dữ liệu:

Nhấn Add và chọn Visualizations hoặc Saved Searches dựa trên dữ liệu từ index snort-logs-*.
Bạn có thể tạo biểu đồ dạng thanh, biểu đồ tròn, hoặc bảng để trực quan hóa các sự kiện như cảnh báo xâm nhập, thời gian xảy ra sự kiện, v.v.
Lưu Dashboard:

Sau khi hoàn thành, nhấn Save để lưu lại dashboard cho lần xem tiếp theo.
Bước 5: Theo dõi log Snort theo thời gian thực
Kibana cung cấp khả năng cập nhật dữ liệu theo thời gian thực trong Discover và Dashboard. Bạn có thể bật tính năng tự động làm mới bằng cách chọn tần suất cập nhật ở góc trên bên phải (ví dụ: 10 giây, 1 phút) để giám sát log một cách liên tục.
