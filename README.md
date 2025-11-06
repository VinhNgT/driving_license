![Feature Graphic](resources/featureGraphic.png)

# Drive Ready

Ứng dụng di động giúp người dùng ôn tập kiến thức lý thuyết để chuẩn bị cho kỳ thi giấy phép lái xe hạng A và B. Cung cấp các câu hỏi trắc nghiệm và tài liệu học để người dùng có thể nắm vững kiến thức cần thiết.

## Thiết lập repository

### Công cụ cần thiết

- Git và Bash (Cygwin trên Windows)
- Flutter thông qua FVM
- uv (trình quản lý gói/môi trường Python)

Cài đặt nếu cần:

- FVM: https://fvm.app/documentation/getting-started/installation
- uv: https://docs.astral.sh/uv/getting-started/installation/

### 1) Bootstrap

Từ thư mục gốc của repo, chạy script bootstrap:

```bash
./bootstrap.sh
```

Sau khi chạy bootstrap và khởi động lại VS Code, IDE sẽ tự động sử dụng Flutter/Dart được cố định bởi FVM và môi trường ảo Python do uv quản lý.

- Trong terminal của VS Code, chỉ cần chạy các lệnh thông thường:

  - `flutter ...`, `dart ...` (không cần tiền tố `fvm`)
  - `python ...` (không cần `uv run`)

- Bên ngoài VS Code (hoặc khi PATH/môi trường khác nhau):
  - Sử dụng `fvm flutter ...` / `fvm dart ...` để đảm bảo dùng đúng SDK.
  - Kích hoạt môi trường ảo hoặc dùng `uv run python ...` cho Python.

### 2) Cài đặt Flutter dependencies

```bash
cd app
flutter pub get
```

### 3) Chạy codegen (khuyến nghị trong quá trình phát triển)

Sử dụng tác vụ VS Code "build_runner_watch" hoặc chạy:

```bash
cd app
dart run build_runner watch --delete-conflicting-outputs
```

### 4) Khởi chạy ứng dụng

Ở một terminal khác:

```bash
cd app
flutter run
```

## Thư mục hỗ trợ `scripts/`

Chứa các script tiện ích hỗ trợ tự động hóa tác vụ phát triển cục bộ và quy trình CI/CD.

### Quy ước viết script

- Bạn phải viết script bằng Bash hoặc Python.
- Chạy từ thư mục gốc của repo trừ khi script có yêu cầu khác.
- Script nên được thiết kế để có thể chạy lại nhiều lần một cách an toàn.
