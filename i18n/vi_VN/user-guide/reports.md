# Báo cáo

Tính năng báo cáo chỉ khả dụng ở [Bản Mở Rộng](https://www.espocrm.com/extensions/advanced-pack/).

Có hai loại báo cáo: Danh sách và Lưới.

## Báo Cáo Danh sách

Kết quả của báo cáo danh sách là danh sách các bản ghi phù hợp với các tiêu chí nhất định.

Để tạo báo cách danh sách mới thì nhấp chuột vào tab báo cáo rồi nhấp vào nút Tạo báo cáo. Chọn loại đối tượng cần thiết rồi nhấp vào nút Tạo ở khu vực báo cáo danh sách.

Ở trường _Cột_ chọn những trường mà bạn muốn hiển thị. Bạn cũng có thể chọn các biến hiển thị cho từng cột, ví dụ độ rộng và căn lề.

Chọn thứ tự sắp xếp cần thiết ở trường _Thứ tự danh sách_.

Ở khu vực _Bộ lọc_ bạn có thể xác định tiêu chí định hình nên bản ghi sẽ được liệt kê trong danh sách của bạn. Bạn có thể sử dụng toán tử luận lý như 'OR' hoặc 'AND' ở đây.

_Bộ lọc Runtime_ cho phép bạn xác định các bộ lọc khác nhau trước khi bạn chạy báo cáo.

Bạn có thể __xuất__ kết quả của báo cáo danh sách thành định dạng excel và csv.

##  Báo cáo lưới

Kết quả của báo cáo lưới tóm tắt các giá trị được gộp thành nhóm dựa trên các trường xác định. Những báo cáo này có thể được hiển thị thành một biểu đồ.

![Báo cáo lưới](../_static/images/user-guide/reports/grid.png)

Để tạo báo cách danh sách mới thì nhấp chuột vào tab báo cáo rồi nhấp vào nút Tạo báo cáo. Chọn loại đối tượng cần thiết rồi nhấp vào nút Tạo ở khu vực báo cáo lưới.

Ở trường _Nhóm theo_ bạn chọn một hoặc hai trường mà bạn muốn dữ liệu báo cáo được nhóm theo. Có thể chọn nhóm theo năm, tháng, ngày cho những trường về ngày tháng. Nếu bạn nhóm theo hai trường thì báo cáo của bạn sẽ được xem như báo cáo ba chiều.

Ở trường _Cột_ có thể chọn một hoặc nhiều chức năng tổng hợp như COUNT, SUM(tính tổng), MIN, MAX, AVG (tính trung bình).

Trường _Xếp theo_ xác định dữ liệu báo cáo sẽ được sắp xếp như thế nào.

Ở khu vực _Bộ lọc_ bạn có thể xác định tiêu chí định hình nên bản ghi sẽ được liệt kê trong báo cáo của bạn. Bạn có thể sử dụng toán tử luận lý như 'OR' hoặc 'AND' ở đây.

_Bộ lọc Runtime_ cho phép bạn xác định các bộ lọc khác nhau trước khi bạn chạy báo cáo.

Báo cáo lưới cho phép hiển thị kết quả ở dạng biểu đồ. Có _các loại biểu đồ_ sau : Cột (Ngang), Cột (Dọc), Tròn, đường.

Bạn có thể __xuất__ kết quả của báo cáo danh sách thành định dạng excel và csv.

## Bộ lọc

### Bộ lọc theo trường

Các loại bộ lọc có thể sử dụng một cách rất dễ dàng. Bạn cũng có thể chọn các trường cho thực thể cần cũng như các thực thể liên quan.

![Bộ lọc theo trường](../_static/images/user-guide/reports/filter-field.png)

### Nhóm theo toán tử OR

Toán tử OR hay toán tử hoặc nghĩa là các phần tử của nhóm phải thỏa mãn ít nhất một điều kiện.

![Nhóm theo toán tử OR](../_static/images/user-guide/reports/filter-or.png)

### Nhóm theo toán tử AND

Toán tử AND hay toán tử và nghĩa là các phần tử của nhóm phải thỏa mãn tất cả các điều kiệnt.

### Nhóm theo toán tử NOT

Cung cấp khả năng lọc các bản ghi không phù hợp các tiêu chí nhất định. Ví dụ liệt kê danh sách các tài khoản không có tiềm năng nào có trạng thái Thành công đã đóng hoặc Mất đã đóng.

![Nhóm theo toán tử NOT](../_static/images/user-guide/reports/filter-not.png)

### Ngôn ngữ biểu hiện

Đối với các nhu cầu sử dụng nâng cao. Bạn có thể áp dụng hàm cho các cột dữ liệu nhất định và so sánh nó với kết quả của [công thức](../administration/formula.md) hiển thị.

Lưu ý: Nếu bạn cần so sánh chỉ với một giá trị chuỗi đơn giản thì bạn nên đặt nó vào ngoặc đơn `'chuỗi nào đó'`.

Lưu ý: Các hàm có mục đích tương tác với bản ghi thực thể sẽ không thể chạy ở đây bởi vì hàm không được áp dụng với bản ghi nhất định.

![Bộ lọc Ngôn ngữ biểu hiện](../_static/images/user-guide/reports/filter-complex.png)

## Hiển thị trên bảng điều khiển

Bạn có thể hiển thị bất kì báo cáo nào trên bảng điều khiển. Để làm được điều này bạn cần thêm dashlet Báo cáo và chọn báo cáo cần hiển thị trong các lựa chọn của dashlet.

## Gửi thư điện tử

Bạn có thể thiết lập hệ thống gửi kết quả báo cáo tới các người dùng nhất định theo một lịch thường xuyên vào một khoảng thời gian nhất định. Thiết lập này phải được thực hiện với từng báo cáo một cách độc lập.

## Đồng bộ với các danh sách mục tiêu

Bạn có thể có các danh sách mục tiêu được đồng bộ với các kết quả của danh sách báo cáo. Điều này tiện cho việc gửi thư điện tử hàng loạt khi bạn chỉ muốn gửi thư tới các liên hệ thỏa mãn vài tiêu chí tại thời điểm thư điện tử được gửi đi. Tính năng này có sẵn khi bạn xem chi tiết của bất kì danh sách mục tiêu nào tại thanh 'Đồng bộ với Báo cáo'. 
