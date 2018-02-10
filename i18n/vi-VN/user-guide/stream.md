# Stream

Stream trong EspoCRM là một bảng tin nơi bạn có thể theo dõi các cập nhật và bổ sung cho bản ghi mà bạn đang theo dõi. Bạn cũng có thể đăng lên stream của riêng bạn và lên stream của những người dùng khác (từ phiên bản 3.8.0 trở đi). Có hai loại stream trong Espo CRM: stream bản ghi và stream người dùng.

Mặc định thì những thực thể sau có một stream: Tài khoản, Danh bạ, Khách hàng tiềm năng, Cơ hội, Vụ việc. Quản trị viên có thể kích hoạt hoặc vô hiệu hóa stream cho một thực thể nhất định trong [Entity Manager](../administration/entity-manager.md).

## Stream Bản Ghi

Steam Bản Ghi được hiển thị trong một bảng điều khiển Stream của một bản ghi nhất định khi xem chi tiết. Các bài viết, cập nhật và những bổ sung mới liên quan tới bản ghi hiện tại cũng được hiển thị ở đây.

## Stream Người Dùng

Người dùng có thể xem stream của họ trong Stream dashlet cũng như dưới tab Stream. Người dùng cũng có thể thấy stream của người dùng khác trong xem chi tiết người dùng, nếu họ có quyền truy cập được kiểm soát bởi trường `Quyền Người Dùng` của Danh sách Quyền.

Trong luồng người dùng bạn có thể xem bài viết, cập nhật và bổ sung mới liên quan tới các bản ghi mà người dùng đang theo dõi. Bạn cũng có thể xem các bài viết được gửi cho người dùng. Những bài viết này không liên quan tới bất kì bản ghi nào.

## Thông báo

Bạn sẽ nhận được thông báo về những bổ sung mới tới stream của bạn khi những thay đổi này được thực hiện bởi 1 người dùng khác.

## Bài viết

Bạn có thể tạo bài viết liên quan tới một bản ghi nhất định. Bạn cũng có thể đính kèm nhiều tập tin và hình ảnh vào bài viết của bạn. Nếu bạn muốn đề cập tới ai đó trong vài viết của mình bạn cần nhập kí hiệu `@` và bắt đầu nhập tên của người dùng đó. Người dùng mà bạn đề cập trong bài viết sẽ được thông báo về nó.

## Bài viết tới người dùng

_Tính năng này khả dụng từ phiên bản 3.8.0._

Người dùng có thể tạo bài viết tới một người dùng nhất định, tới những nhóm nhất định, tới mọi người dùng và tới bản thân. Quyền truy xuất tới khả năng này được kiểm soát bởi trường `Quyền Được Cấp` của Danh sách Quyền.


## Bộ Lọc

Bạn có thể lọc những gì muốn xem trong một stream:  `Tất cả`, `Bài Viết` hoặc `Cập nhật`.  

