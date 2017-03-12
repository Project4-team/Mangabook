var GioHang = {
    init: function () {
        GioHang.regEvents();
    },
    regEvents: function () {
        $('#btnUpdate').off('click').on('click', function () {
            var listProduct = $('.txtSoLuong');
            var cartList = [];
            $.each(listProduct, function (i, item) {
                cartList.push({
                    iSoLuong: $(item).val(),
                    SessionGioHang: {
                        ID: $(item).data('iMaSach')
                    }
                });
            });

            $.ajax({
                url: '/Cart/Update',
                data: { cartModel: JSON.stringify(cartList) },
                dataType: 'json',
                type: 'POST',
                success: function (res) {
                    if (res.status == true) {
                        window.location.href = "/gio-hang";
                    }
                }
            })
        });
    }
}
GioHang.init();