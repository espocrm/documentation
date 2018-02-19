# In thành tập tin PDF

Lưu ý: Tính năng này chỉ khả dụng từ phiên bản EspoCRM 5.0.5.

Tính năng in thành tập tin PDF cho phép tạo ra tập tin PDF với dữ liệu của một bản ghi. Nội dung của tài liệu được định nghĩa bằng các mẫu có sẵn.


1. Bạn cần có ít nhất một mẫu có sẵn cho loại thực thể của bản ghi mà bạn muốn in.
2. 'In thành PDF' sẽ khả dụng khi xem chi tiết ở thanh xổ xuống gần nút 'Chỉnh sửa'.

## Các mẫu có sẵn

Tab các mẫu có sẵn mặc định được ẩn đi. Quản trị viên có thể thêm nó trong Quản trị > Giao diện người dùng.

Để chỉnh sửa một cách chính xác nhất thì bạn được đề xuất sử dụng chế độ góc nhìn mã chương trình.

Bạn có thể in các trường chi tiết của bản ghi cũng như các trường của các bản ghi liên quan bằng cách tối ưu các kí hiệu giữ chỗ trong mẫu có sẵn.

Ví dụ: 

* `{{name}}` – Tên của bản ghi;
* `{{assignedUserName}}` – Người dùng được chỉ định;
* `{{account.name}}` – Tên của tài khoản liên quan.

Bạn cũng có thể in trường hình ảnhIt's possible to print image fields:
```
<img src="{{file imageId}}">
```

ở `imageId` – là tên của trường hình ảnh tùy biến, được nối với hậu tố `Id`.

Để hiển thị số thực dấu phẩy động mà không có phần thập phân (như số nguyên) sử dụng cách biểu hiện sau:
```
{{numberFormat quantity_RAW decimals=0}}
```

Tùy chỉnh định dang cho các giá trị tiền tệ
```
{{numberFormat unitPrice_RAW decimals=2 decimalPoint=',' thousandsSeparator=' '}}
```

Giá trị `10000.5` sẽ được in ra là `10 000,50`.

Để hiện thị các trường văn bản (nhiều dòng) sử dungj dấu ngoặc ba lần liên tiếp: ```{{{description}}}```.
