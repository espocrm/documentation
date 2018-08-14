# Hướng dẫn sử dụng với thư điện tử

EspoCRM cung cấp khả năng lấy thư từ hộp thư IMAP. Điều này cho phép EspoCRM hoạt động như phần mềm thư điện tử có các tính năng đặc trưng của CRM.

## Tài khoản IMAP

*Lưu ý: Bạn cần có [cron](https://github.com/espocrm/documentation/blob/master/administration/server-configuration.md#setup-a-crontab) thiết lập đúng trong hệ thống để nhận được thư điện tử gửi đến.*

Người dung có thể thiết lập tài khoản IMAP trong trang Tài Khoản Thư điện tử cá nhân (Tab Thư điện tử > trình đơn góc phải > Tài Khoản Thư điện tử cá nhân).

Xác định thư mục nào cần theo dõi trong trường Các thư mục được theo. Mặc định, trường này được gán cho Hộp thư đến. Nếu bạn sử dụng các phần mềm thư điện tử ngoài để gửi thư thì bạn có thể thiết lập thư mục Đã gửi để lưu trữ lại những thư điện tử này.

*Lấy từ lúc* cho phép bạn chọn ngày thư điện tử nên được lưu trữ. Thiết lập nó tới những ngày trong quá khứ nếu bạn muốn lưu trữ những thư điện tử cũ.

Chương trình cũng có khả năng xác định *Thư mục* trong Tài khoản Thư điện tử cá nhận. Những thư điện tử gửi đến sẽ nằm trong thư mục này.

## Tài khoản SMTP

Người dùng có thể thiết lập cấu hình SMTP trong Ưa thích cũng như trong Tài khoản Thư điện tử cá nhân của. Quản trị viên cũng có khả năng cho phép sử dụng hệ thống SMTP (Bằng cách chia sẻ nó)

Người dùng có thể có nhiều tài khoản SMTP (từ phiên bản 4.2.0 trở đi). Tuy nhiên những địa chỉ thư điện tử mà người dùng có thể sử dụng để gửi đi cần được xác định trong danh sách các địa chỉ thư điện tử của bản ghi *Người dùng*.

## Làm việc với thư điện tử

Thư điện tử được lấy về bằng tác vụ (chạy ngầm) mỗi phút (thời gian chính xác có thể được quy định bởi quản trị viên).
Bạn có thể thấy tất cả thư điện tử trong tab Thư điện tử. Có những thư mục mặc định là Hộp thư đến, Thư đã gửi, Thư nháp nằm ở phía bên trái.

Trường *Trạng thái*. `Đã gửi` nghĩa là thư được gửi từ CRM, `Lưu trữ` – thư được lấy từ tài khoản IMAP hoặc được lưu trữ thủ công, `Nháp` – nghĩa là thư được tạo như một bản nháp.

Khi thư điện tử mới đến thì hệ thống sẽ cố gắng xác định thư này thuộc về bản ghi nào. Nó có thể liên kết với Tài khoản, Khách hàng tiềm năng, Cơ hội, Vụ việc (và Liên hệ khi ở chế độ B2C) etc. Nếu thư không được xác định thì người dùng có thể liên kết nó một cách thủ công bằng cách nhập vào trường “Nguồn gốc”.

Nếu thư điện tử đến từ một khách hàng tiềm năng người dùng có thể **chuyển nó vào bản ghi Khách hàng tiềm năng** . Người dùng chỉ cần mở Thư điện tử và nhấp chọn Tạo khách hàng tiềm năng ở trình đơn góc trên bên phải.

Bạn cũng có thể **tạo Tác vụ hoặc Vụ việc** từ một bản ghi thư điện tử.

Nếu những địa chỉ thư điện tử (Gửi từ, gửi đến, cc) trong một bản ghi thư điện tử là những địa chỉ hệ thống đã ghi nhận thì thư điện tử này sẽ hiển thị thông tin những người liên quan(Liên hệ, Khách hàng tiềm năng, Người dùng, etc). Nếu những địa chỉ thư điện tử này là hoàn toàn mới thì bạn có thể **tạo liên hệ** trực tiếp từ đây.

Mọi thư điện tử liên quan tới một bản ghi nhất định được hiển thị trong thanh Lịch sử của bản ghi đó. Ví dụ, nếu có thư điện tử liên quan tới một cơ hội mà cơ hội này lại liên quan tới một tài khoản, thì thư điện tử này sẽ hiển thị cả thông tin về cơ hội và tài khoản đó.

## Gửi thư điện tử

Bạn có thể soạn thư điện tử mới bằng một số cách sau đây:
* Nhấn nút* *Soạn thư* trong khung nhìn danh sách thư;
* phản hồi một thư điện tử;
* nhấp chọn thư điện tử của bản ghi nào đó;
* thực hiện hành động * *Soạn thư* trong thanh Các hoạt động.

Bạn cũng có thể **Lựa chọn mẫu** cho thư điện tử của bạn.

Bạn có thể thiết lập **chữ kí thư điện tử** trong mục Yêu thích.

## Thư mục thư điện tử

Người dùng có thể tạo thư mục thư điện tử của riêng họ để quản lý các loại thư điện tử một cách tiện lợi. Danh sách những thư mục khả dụng nằm ở phía bên trái trong trang Danh sách thư điện tử. Để tạo hoặc chỉnh sửa thư mục, người dùng cần vào Danh sách thư điện tử> trình đơn xổ xuống ở góc trên tùng bên phải > Danh sách thư mục. `Bỏ qua thông báo` nghĩa là bạn không muốn nhận được thông báo về các thư điện tử được gửi tới mà rơi vào một thư mục nào đó. Bằng cách tối ưu Bộc lọc thư, bạn có thể đặt Thư điện tử vào các thư mục một cách tự động dựa trên các tiêu chí nhất định.

## Bộ lọc thư điện tử

Quản trị viên có thể tạo bộ lọc thư  toàn cục để bỏ qua các thư điện tử không được mong muốn. Cấu hình này nằm ở mục Quản trị > Bộ lọc thư điện tử.

Người dùng thông thường có thể tạo bộ lọc cho Tài khoản thư điện tử cá nhân hoặc cho toàn bộ Hộp thư đến. Những cấu hình này nằm ở Danh sách thư điện tử > trình đơn xổ xuống ở góc trên cùng bên phải > Bộ lọc.

Có hai loại Bộ lọc:
* Bỏ qua – thư điện tử sẽ được đặt trong *Thùng rác* hoặc không được nhập vào nếu bộ lọc liên quan tới Tài khoản thư điện tử cá nhân;
* Phân loại vào thư mục  - nhập các thư điện tử vào các thư mục xác định của người dùng một cách tự động.

## Mẫu thư điện tử

Mẫu thư điện tử nằm ở Danh sách thư điện tử > trình đơn xổ xuống ở góc trên cùng bên phải > Mẫu thư điện tử. Chúng có thể được sử dụng cho cả việc gửi thư điện tử hàng loại và những thư điện tử thông thường. Checkbox `Một lần` nghĩa là mẫu thư điện tử được coi như là chỉ để dùng một lần, điều thường được sử dụng trong các chiến dịch quảng cáo bằng thư điện tử..

Người dùng cũng có thể sử dụng các kí hiệu giữ chỗ trong nội dung và tiêu đề của mẫu thư điện tử, ví dụ {Account.name}, {Person.emailAddress}. Những kí hiệu giữ chỗ này sẽ được thay thế khi gửi đi bằng giá trị của các bản ghi liên quanThey will be replaced with values of related records.

Bạn có thể sử dụng các kí hiệu giữ chỗ có sẵn trong mẫu nội dung như {optOutUrl} và {optOutLink}.
```
<a href="{optOutUrl}">Unsubscribe</a>
```
Đây là đường dẫn hủy đăng kí áp dụng trong việc gửi thư điện tử hàng loạt.
