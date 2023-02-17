<!DOCTYPE html>
<html lang="en">

<head>
    <link rel="stylesheet" href="assets/css/admin.css">
</head>

<body>
    <header>
        <div class="admin-header">
            <div class="admin-menu-icon">
                <img src="assets/icons/icons8-menu-rounded-100.png" alt="icon-menu">
            </div>
            <div class="admin-logo">
                <h2>ADMIN</h2>
            </div>
            <div class="admin-search-form">
                <div class="admin-search-input">
                    <input type="text" name="" id="" placeholder="Search...">
                </div>
                <div class="admin-search-icon">
                    <img src="assets/icons/icons8-search-50-blue.png" alt="icon-search">
                </div>
            </div>
            <div class="admin-notify-icon">
                <img src="assets/icons/icons8-notification-100.png" alt="icon-notify">
            </div>
            <div class="admin-avatar">
                <img src="assets/images/emiuuu.jpg" alt="img-avt">
            </div>
            <div class="admin-infor">
                <div class="admin-infor-name">
                    <p>Dao Thu Trang</p>
                </div>
                <div class="admin-infor-icon">
                    <img src="assets/icons/triangle32.png" alt="icon-triangle">
                </div>
            </div>
        </div>
    </header>

    <div class="admin-body">
        <nav class="navigation">
            <!-- DASHBOARD -->
            <ul class="dashboard">
                <li>
                    <div class="menu" id="sub-menu-dashboard">
                        <img src="assets/icons/icons8-home-page-96.png" alt="">
                        <h3>Dashboard</h3>
                    </div>

                </li>
            </ul>
            <!-- ORDER -->
            <ul>
                <li>
                    <div class="menu" id="sub-menu-order">
                        <img src="assets/icons/icons8-purchase-order-100.png" alt="">
                        <h3>Order</h3>
                        <p class="dropdown-sub-menu-order dropdown-menu">></p>
                    </div>
                </li>
            </ul>
            <!-- SUB MENU ORDER -->
            <div class="sub-menu-order none">
                <ul class="sub-menu-ul" id="order.html?management">
                    <li>Management</li>
                </ul>
                <ul class="sub-menu-ul" id="order.html?search">
                    <li>Search</li>
                </ul>
            </div>
            <!-- SHOES -->
            <ul>
                <li>
                    <div class="menu" id="sub-menu-shoes">
                        <img src="assets/icons/icons8-trainers-100.png" alt="">
                        <h3>Shoes</h3>
                        <p class="dropdown-sub-menu-shoes dropdown-menu">></p>
                    </div>

                </li>
            </ul>
            <!-- SUB MENU SHOES -->
            <div class="sub-menu-shoes none">
                <ul class="sub-menu-ul" id="shoes.html?product">
                    <li>Product</li>
                </ul>
                <ul class="sub-menu-ul" id="shoes.html?color-size">
                    <li>Color - Size</li>
                </ul>
                <ul class="sub-menu-ul" id="shoes.html?gallery">
                    <li>Gallery</li>
                </ul>
                <ul class="sub-menu-ul" id="shoes.html?bsg">
                    <li>B-S-G</li>
                </ul>
            </div>
            <!-- CUSTOMER -->
            <ul>
                <li>
                    <div class="menu" id="sub-menu-customer">
                        <img src="assets/icons/icons8-user-100.png" alt="">
                        <h3>Customer</h3>
                        <p class="dropdown-sub-menu-customer dropdown-menu">></p>
                    </div>

                </li>
            </ul>
            <!-- SUB MENU CUSTOMER -->
            <div class="sub-menu-customer none">
                <ul class="sub-menu-ul" id="customer.html?user">
                    <li>User</li>
                </ul>
                <ul class="sub-menu-ul" id="customer.html?role">
                    <li>Role</li>
                </ul>
            </div>
            <!-- PARAMETERS -->
            <ul>
                <li>
                    <div class="menu" id="sub-menu-parameters">
                        <img src="assets/icons/icons8-setting-100.png" alt="">
                        <h3>Parameters</h3>
                        <p class="dropdown-sub-menu-parameters dropdown-menu">></p>
                    </div>

                </li>
            </ul>
            <!-- SUB MENU PARAMETERS -->
            <div class="sub-menu-parameters none">
                <ul class="sub-menu-ul" id="parameters.html?revenue">
                    <li>Revenue</li>
                </ul>
                <ul class="sub-menu-ul" id="parameters.html?selling">
                    <li>Selling products</li>
                </ul>
            </div>

            <ul class="other-menu none">
                <li>
                    <div class="menu" id="sub-menu-news">
                        <img src="assets/icons/icons8-newspaper-64.png" alt="">
                        <h3>New</h3>
                        <p class="dropdown-sub-menu-news dropdown-menu">></p>
                    </div>
                </li>
            </ul>
            <!-- SUB MENU NEWS -->
            <div class="sub-menu-news none">
                <ul class="sub-menu-ul" id="news.html?revenue">
                    <li>Revenue</li>
                </ul>
                <ul class="sub-menu-ul" id="news.html?selling">
                    <li>Selling products</li>
                </ul>
            </div>

            <ul class="other-menu none">
                <li>
                    <div class="menu" id="sub-menu-poster">
                        <img src="assets/icons/icons8-poster-64.png" alt="">
                        <h3>Poster</h3>
                        <p class="dropdown-sub-menu-poster dropdown-menu">></p>
                    </div>
                </li>
            </ul>
            <!-- SUB MENU POSTER -->
            <div class="sub-menu-poster none">
                <ul class="sub-menu-ul" id="poster.html?revenue">
                    <li>Revenue</li>
                </ul>
                <ul class="sub-menu-ul" id="poster.html?selling">
                    <li>Selling products</li>
                </ul>
            </div>

            <!-- OTHER -->
            <ul class="other">
                <li>
                    <div class="menu">
                        <img src="assets/icons/icons8-view-more-80-white.png" alt="">
                        <h3>Other</h3>
                    </div>
                </li>
            </ul>

        </nav>
        <!-- ORDER MANAGEMENT -->
        <section class="admin-order-management none">
            <div class="title title-order-management">
                <img src="assets/icons/icons8-calendar-96.png" alt="">
                <h1>ORDER MANAGEMENT</h1>
            </div>
            <div class="title title-add-new importantNone">
                <img src="assets/icons/icons8-add-64-title.png" alt="">
                <h1>ADD NEW</h1>
            </div>
            <div class="title title-edit-new importantNone">
                <img src="assets/icons/icons8-edit-100-title.png" alt="">
                <h1>EDIT ORDER</h1>
            </div>
            <div class="nav-history">
                <div class="origin">
                    <img src="assets/icons/icons8-home-page-64.png" alt="">
                    <a href="">Home</a>
                </div>
                <div>
                    <p>/</p>
                    <img src="assets/icons/icons8-purchase-order-100-nav.png" alt="">
                    <a href="">Order</a>
                </div>

                <div>
                    <p>/</p>
                    <img src="assets/icons/icons8-calendar-96.png" alt="">
                    <a href="">Management</a>
                </div>

                <div class="addneworder-nav importantNone">
                    <p>/</p>
                    <img src="assets/icons/icons8-add-64-title.png" alt="">
                    <a href="">Add new</a>
                </div>
                <div class="editneworder-nav importantNone">
                    <p>/</p>
                    <img src="assets/icons/icons8-edit-100-title.png" alt="">
                    <a href="">Edit order</a>
                </div>
            </div>
            <div class="table-order table-order-add">
                <table class="order">
                    <thead>
                        <tr>
                            <th colspan="1000" class="td-addneworder">
                                <button class="addneworder" id="addneworder" name=""> <img
                                        src="assets/icons/icons8-add-64.png" alt="icon-plus">
                                    Add New</button>
                            </th>
                        </tr>
                        <tr>
                            <th>ID</th>
                            <th>Fullname</th>
                            <th>Email</th>
                            <th>Phone number</th>
                            <th>Address</th>
                            <th>Order date</th>
                            <th>Note</th>
                            <th>Status</th>
                            <th class="td-action">Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>1</td>
                            <td>Do Van Trung</td>
                            <td>dovantrung47201@gmail.com</td>
                            <td>0346 643 755</td>
                            <td>Cong Hoa - Kim Thanh - Hai Duong</td>
                            <td>15-02-2023</td>
                            <td></td>
                            <td>Cho xac nhan</td>
                            <td class="td-action">
                                <button class="btn-confirm-order" id="1"><img src="assets/icons/icons8-done-64.png"
                                        alt=""></button>
                                <button class="btn-edit-product" id="editneworder"><img
                                        src="assets/icons/icons8-edit-100.png" alt=""></button>
                                <button class="btn-details-order"><img src="assets/icons/icons8-eye-64.png"
                                        alt=""></button>
                            </td>
                        </tr>
                        <tr>
                            <td>1</td>
                            <td>Do Van Trung</td>
                            <td>dovantrung47201@gmail.com</td>
                            <td>0346 643 755</td>
                            <td>Cong Hoa - Kim Thanh - Hai Duong</td>
                            <td>15-02-2023</td>
                            <td></td>
                            <td>Cho xac nhan</td>
                            <td class="td-action">
                                <button class="btn-confirm-order" id="2"><img src="assets/icons/icons8-done-64.png"
                                        alt=""></button>
                                <button class="btn-edit-product" id="editneworder"><img
                                        src="assets/icons/icons8-edit-100.png" alt=""></button>
                                <button class="btn-details-order"><img src="assets/icons/icons8-eye-64.png"
                                        alt=""></button>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="add-new-order-form importantNone">
                <div class="customer-infor">
                    <h2>Customer information</h2>
                    <div class="customer-infor-form">
                        <div class="fullname">
                            <label> Full name: </label>
                            <input type="text">
                        </div>
                        <div class="email">
                            <label> Email: </label>
                            <input type="text">
                        </div>
                        <div class="phone-number">
                            <label> Phone number: </label>
                            <input type="text">
                        </div>
                        <div class="address">
                            <label> Address: </label>
                            <input type="text">
                        </div>
                    </div>
                </div>
            </div>
            <div class="edit-new-order-form importantNone">
                <div class="customer-infor">
                    <h2>Order information</h2>
                    <div class="customer-infor-form">
                        <div class="id">
                            <p> ID </p>
                            <input type="text">
                        </div>
                        <div class="fullname">
                            <p> Order date </p>
                            <input type="date">
                        </div>
                        <div class="email">
                            <p> Status </p>
                            <select class="selected-order status">
                                <option value="">Choose status</option>
                                <option value="1">Awaiting confirmation</option>
                                <option value="2">Packing</option>
                                <option value="3">Delivery</option>
                            </select>
                        </div>
                        <div class="phone-number">
                            <p> Method </p>
                            <select class="selected-order status">
                                <option value="">Choose method</option>
                                <option value="1">COD</option>
                            </select>
                        </div>
                        <div class="address">
                            <p> Voucher </p>
                            <select class="selected-order status">
                                <option value="">Choose voucher</option>
                                <option value="1">1-TET2023 </option>
                                <option value="2">2-TISHOESTET2023 </option>
                                <option value="3">3-TSTET2023 </option>
                            </select>
                        </div>
                    </div>
                    <h2>Customer information</h2>
                    <div class="customer-infor-form">

                        <div class="fullname">
                            <p> Full name </p>
                            <input type="text">
                        </div>
                        <div class="email">
                            <p> Email </p>
                            <input type="text">
                        </div>
                        <div class="phone-number">
                            <p> Phone number </p>
                            <input type="text">
                        </div>
                        <div class="address">
                            <p> Address </p>
                            <input type="text">
                        </div>
                        <div class="id">
                            <p> Note </p>
                            <input type="text">
                        </div>
                    </div>
                    <h2>Products</h2>
                    <div class="customer-infor-form table-product-order-edit">
                        <table class="order product-order">
                            <thead>
                                <tr>
                                    <th></th>
                                    <th>Name</th>
                                    <th>Price</th>

                                    <th class="td-display-center">Color</th>
                                    <th class="td-display-center">Size</th>
                                    <th class="td-display-center">Quantity</th>
                                    <th class="td-action">Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td class="td-img-product"><img src="assets/images/emiuuu.jpg" alt=""></td>

                                    <td>Nike Air Max 90 LTR</td>
                                    <td>$175.55</td>

                                    <td class="td-display-center">
                                        <select class="order-edit-select">
                                            <option value="1" style="background: aqua;" selected>Aqua</option>
                                            <option value="1" style="background: black;">Black</option>
                                        </select>
                                    </td>
                                    <td class="td-display-center"><select class="order-edit-select">
                                            <option value="1" selected>36</option>
                                            <option value="1">37</option>
                                        </select></td>
                                    <td class="td-display-center quantity-order">
                                        <input type="text" value="1">
                                    <td class="td-action">
                                        <button class="btn-del-order btn-del-order-edit" id="1" onclick="delProdInOrder(this)"><img
                                                src="assets/icons/icons8-remove-60.png" alt=""></button>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="td-img-product"><img src="assets/images/emiuuu.jpg" alt=""></td>

                                    <td>Nike Air Max 90 LTR</td>
                                    <td>$175.55</td>

                                    <td class="td-display-center"><span class="td-color-product"
                                            style="background: aqua;"></span></td>
                                    <td class="td-display-center">36</td>
                                    <td class="td-display-center">1</td>
                                    <td class="td-action">
                                        <button class="btn-del-order btn-del-order-edit" id="2" onclick="delProdInOrder(this)"><img
                                                src="assets/icons/icons8-remove-60.png" alt=""></button>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="td-img-product"><img src="assets/images/emiuuu.jpg" alt=""></td>

                                    <td>Nike Air Max 90 LTR</td>
                                    <td>$175.55</td>

                                    <td><span class="td-color-product" style="background: aqua;"></span></td>
                                    <td>36</td>
                                    <td>1</td>
                                    <td class="td-action">
                                        <button class="btn-del-order btn-del-order-edit" id="3" onclick="delProdInOrder(this)"><img
                                                src="assets/icons/icons8-remove-60.png" alt=""></button>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="td-img-product"><img src="assets/images/emiuuu.jpg" alt=""></td>

                                    <td>Nike Air Max 90 LTR</td>
                                    <td>$175.55</td>

                                    <td><span class="td-color-product" style="background: aqua;"></span></td>
                                    <td>36</td>
                                    <td>1</td>
                                    <td class="td-action">
                                        <button class="btn-del-order btn-del-order-edit" id="4" onclick="delProdInOrder(this)"><img
                                                src="assets/icons/icons8-remove-60.png" alt=""></button>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </section>
        <!-- ORDER SEARCH -->
        <section class="admin-order-search none">
            <div class="title">
                <img src="assets/icons/icons8-search-client-60.png" alt="">
                <h1>SEARCH ORDER</h1>
            </div>
            <div class="nav-history">
                <div class="origin">
                    <img src="assets/icons/icons8-home-page-64.png" alt="">
                    <a href="">Home</a>
                </div>
                <p>/</p>
                <div>
                    <img src="assets/icons/icons8-purchase-order-100-nav.png" alt="">
                    <a href="">Order</a>
                </div>
                <p>/</p>
                <div>
                    <img src="assets/icons/icons8-search-client-60.png" alt="">
                    <a href="">Search order</a>
                </div>
            </div>
            <div class="table-order">
                <table class="order">
                    <thead>
                        <tr>
                            <th colspan="1000" class="td-addneworder">
                                <button class="addneworder"> <img src="assets/icons/icons8-add-64.png" alt="icon-plus">
                                    Add New</button>
                            </th>
                        </tr>
                        <tr>
                            <th>ID</th>
                            <th>Fullname</th>
                            <th>Email</th>
                            <th>Phone number</th>
                            <th>Address</th>
                            <th>Order date</th>
                            <th>Note</th>
                            <th>Status</th>
                            <th class="td-action">Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>1</td>
                            <td>Maria Anders</td>
                            <td>Germany</td>
                            <td>Alfreds Futterkiste</td>
                            <td>Maria Anders</td>
                            <td>Germany</td>
                            <td>Alfreds Futterkiste</td>
                            <td>Maria Anders</td>
                            <td class="td-action">
                                <button class="btn-edit-order"><img src="assets/icons/icons8-edit-100.png"
                                        alt=""></button>
                                <button class="btn-del-order"><img src="assets/icons/icons8-remove-60.png"
                                        alt=""></button>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </section>
        <!-- PRODUCT -->
        <section class="admin-shoes-product none">
            <div class="title">
                <img src="assets/icons/icons8-trainers-100-title.png" alt="">
                <h1>PROCUCT</h1>
            </div>
            <div class="nav-history">
                <div class="origin">
                    <img src="assets/icons/icons8-home-page-64.png" alt="">
                    <a href="">Home</a>
                </div>
                <p>/</p>
                <div>
                    <img src="assets/icons/icons8-trainers-100-title.png" alt="">
                    <a href="">Shoes</a>
                </div>
                <p>/</p>
                <div>
                    <img src="assets/icons/icons8-calendar-96.png" alt="">
                    <a href="">Product</a>
                </div>
            </div>
            <div class="table-order">
                <table class="order">
                    <thead>
                        <tr>
                            <th colspan="1000" class="td-addnewshoes">
                                <button class="addnewshoes" id="addnewshoes-product"><img src="assets/icons/icons8-add-64.png"
                                        alt="icon-plus">Add New</button>
                            </th>
                        </tr>
                        <tr>
                            <th></th>
                            <th>ID</th>
                            <th>Name</th>
                            <th>Price</th>
                            <th>Discount</th>
                            <th>Style</th>
                            <th>Brand</th>
                            <th>Gender</th>
                            <th>Created at</th>
                            <th>Updated at</th>
                            <th>Published at</th>
                            <th>Sold</th>
                            <th>Most loved</th>
                            <th class="th-description">Description</th>
                            <th class="td-action">Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td class="td-img-product"><img src="assets/images/emiuuu.jpg" alt=""></td>
                            <td>1</td>
                            <td>Nike Air Max 90 LTR</td>
                            <td>$175.55</td>
                            <td>20</td>
                            <td>Running</td>
                            <td>Sneaker</td>
                            <td>Men & Women</td>
                            <td>15-02-2023</td>
                            <td>15-02-2023</td>
                            <td>15-02-2023</td>
                            <td>1234</td>
                            <td>5000</td>
                            <td></td>
                            <td class="td-action">
                                <button class="btn-edit-order"><img src="assets/icons/icons8-edit-100.png"
                                        alt=""></button>
                                <button class="btn-del-order"><img src="assets/icons/icons8-remove-60.png"
                                        alt=""></button>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </section>
        <!-- Color - Size -->
        <section class="admin-shoes-color-size none">
            <div class="title">
                <img src="assets/icons/icons8-paint-palette-64.png" alt="">
                <h1>COLOR - SIZE</h1>
            </div>
            <div class="nav-history">
                <div class="origin">
                    <img src="assets/icons/icons8-home-page-64.png" alt="">
                    <a href="">Home</a>
                </div>
                <p>/</p>
                <div>
                    <img src="assets/icons/icons8-trainers-100-title.png" alt="">
                    <a href="">Shoes</a>
                </div>
                <p>/</p>
                <div>
                    <img src="assets/icons/icons8-paint-palette-64.png" alt="">
                    <a href="">Color - Size</a>
                </div>
            </div>
            <div class="list-table">
                <div class="table-order">
                    <table class="order">
                        <thead>
                            <tr>
                                <th colspan="1000" class="td-addnewshoes">
                                    <button class="addnewshoes"> <img src="assets/icons/icons8-add-64.png"
                                            alt="icon-plus"> Add New</button>
                                </th>
                            </tr>
                            <tr>
                                <th></th>
                                <th>ID</th>
                                <th>Product</th>
                                <th>Color</th>
                                <th>Rgb</th>
                                <th>Size</th>
                                <th>Quantity</th>
                                <th class="td-action">Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td class="td-img-product"><img src="assets/images/emiuuu.jpg" alt=""></td>
                                <td>1</td>
                                <td>Nike Air Max 90 LTR</td>
                                <td>Aqua Anders</td>
                                <td><span class="td-color-product" style="background: aqua;"></span></td>
                                <td>37</td>
                                <td>1999</td>
                                <td class="td-action">
                                    <button class="btn-edit-order"><img src="assets/icons/icons8-edit-100.png"
                                            alt=""></button>
                                    <button class="btn-del-order"><img src="assets/icons/icons8-remove-60.png"
                                            alt=""></button>
                                </td>
                            </tr>
                        </tbody>
                    </table>

                </div>
                <div class="table-color">
                    <table class="order">
                        <thead>
                            <tr>
                                <th colspan="1000" class="td-addnewshoes">
                                    <button class="addnewshoes"> <img src="assets/icons/icons8-add-64.png"
                                            alt="icon-plus"> Add New</button>
                                </th>
                            </tr>
                            <tr>
                                <th>ID</th>
                                <th>Color</th>
                                <th>Rgb</th>
                                <th class="td-action">Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>

                                <td>1</td>
                                <td>Aqua Anders</td>
                                <td><span class="td-color-product" style="background: aqua;"></span></td>
                                <td class="td-action">
                                    <button class="btn-edit-order"><img src="assets/icons/icons8-edit-100.png"
                                            alt=""></button>
                                    <button class="btn-del-order"><img src="assets/icons/icons8-remove-60.png"
                                            alt=""></button>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="table-size">
                    <table class="order">
                        <thead>
                            <tr>
                                <th colspan="1000" class="td-addnewshoes">
                                    <button class="addnewshoes"> <img src="assets/icons/icons8-add-64.png"
                                            alt="icon-plus"> Add New</button>
                                </th>
                            </tr>
                            <tr>
                                <th>ID</th>
                                <th>Size number</th>
                                <th class="td-action">Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>

                                <td>1</td>
                                <td>37</td>
                                <td class="td-action">
                                    <button class="btn-edit-order"><img src="assets/icons/icons8-edit-100.png"
                                            alt=""></button>
                                    <button class="btn-del-order"><img src="assets/icons/icons8-remove-60.png"
                                            alt=""></button>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </section>
        <!-- Gallery -->
        <section class="admin-shoes-gallery none">
            <div class="title">
                <img src="assets/icons/icons8-image-gallery-100.png" alt="">
                <h1>GALLERY</h1>
            </div>
            <div class="nav-history">
                <div class="origin">
                    <img src="assets/icons/icons8-home-page-64.png" alt="">
                    <a href="">Home</a>
                </div>
                <p>/</p>
                <div>
                    <img src="assets/icons/icons8-trainers-100-title.png" alt="">
                    <a href="">Shoes</a>
                </div>
                <p>/</p>
                <div>
                    <img src="assets/icons/icons8-image-gallery-100.png" alt="">
                    <a href="">Gallery</a>
                </div>
            </div>
            <div class="table-order">
                <table class="order">
                    <thead>
                        <tr>
                            <th colspan="1000" class="td-addnewshoes">
                                <button class="addnewshoes"> <img src="assets/icons/icons8-add-64.png" alt="icon-plus">
                                    Add New</button>
                            </th>
                        </tr>
                        <tr>
                            <th>ID</th>
                            <th>Thumbnail</th>
                            <th>Product</th>
                            <th>Color</th>
                            <th>Description</th>
                            <th class="td-action">Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>1</td>
                            <td class="td-img-product"><img src="assets/images/emiuuu.jpg" alt=""></td>
                            <td>Germany Alfreds Futterkiste</td>
                            <td><span class="td-color-product" style="background: aqua;"></span></td>
                            <td></td>
                            <td class="td-action">
                                <button class="btn-details-gallery"><img src="assets/icons/icons8-eye-64.png"
                                        alt=""></button>
                                <button class="btn-edit-product"><img src="assets/icons/icons8-edit-100.png"
                                        alt=""></button>
                                <button class="btn-del-order"><img src="assets/icons/icons8-remove-60.png"
                                        alt=""></button>

                            </td>
                        </tr>
                    </tbody>
                </table>

            </div>
        </section>
        <!-- BRAND - STYLE - GENDER -->
        <section class="admin-shoes-brand-style-gender none">
            <div class="title">
                <img src="assets/icons/icons8-brand-58.png" alt="">
                <h1>BRAND - STYLE - GENDER</h1>
            </div>
            <div class="nav-history">
                <div class="origin">
                    <img src="assets/icons/icons8-home-page-64.png" alt="">
                    <a href="">Home</a>
                </div>
                <p>/</p>
                <div>
                    <img src="assets/icons/icons8-trainers-100-title.png" alt="">
                    <a href="">Shoes</a>
                </div>
                <p>/</p>
                <div>
                    <img src="assets/icons/icons8-brand-58.png" alt="">
                    <a href="">BRAND - STYLE - GENDER</a>
                </div>
            </div>
            <div class="list-table">
                <div class="table-brand">
                    <table class="order">
                        <thead>
                            <tr>
                                <th colspan="1000" class="td-addnewshoes">
                                    <button class="addnewshoes"> <img src="assets/icons/icons8-add-64.png"
                                            alt="icon-plus"> Add New</button>
                                </th>
                            </tr>
                            <tr>
                                <th>ID</th>
                                <th>Brand</th>
                                <th class="td-action">Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>1</td>
                                <td>Maria Anders</td>
                                <td class="td-action">
                                    <button class="btn-edit-order"><img src="assets/icons/icons8-edit-100.png"
                                            alt=""></button>
                                    <button class="btn-del-order"><img src="assets/icons/icons8-remove-60.png"
                                            alt=""></button>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="table-style">
                    <table class="order">
                        <thead>
                            <tr>
                                <th colspan="1000" class="td-addnewshoes">
                                    <button class="addnewshoes"> <img src="assets/icons/icons8-add-64.png"
                                            alt="icon-plus"> Add New</button>
                                </th>
                            </tr>
                            <tr>
                                <th>ID</th>
                                <th>Style</th>
                                <th class="td-action">Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>1</td>
                                <td>Maria Anders</td>
                                <td class="td-action">
                                    <button class="btn-edit-order"><img src="assets/icons/icons8-edit-100.png"
                                            alt=""></button>
                                    <button class="btn-del-order"><img src="assets/icons/icons8-remove-60.png"
                                            alt=""></button>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="table-gender">
                    <table class="order">
                        <thead>
                            <tr>
                                <th colspan="1000" class="td-addnewshoes">
                                    <button class="addnewshoes"> <img src="assets/icons/icons8-add-64.png"
                                            alt="icon-plus"> Add New</button>
                                </th>
                            </tr>
                            <tr>

                                <th>ID</th>
                                <th>Gender</th>
                                <th class="td-action">Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>1</td>
                                <td>Maria Anders</td>
                                <td class="td-action">
                                    <button class="btn-edit-order"><img src="assets/icons/icons8-edit-100.png"
                                            alt=""></button>
                                    <button class="btn-del-order"><img src="assets/icons/icons8-remove-60.png"
                                            alt=""></button>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </section>
        <!--
            USER
        -->
        <section class="admin-customer-user">
            <div class="title">
                <img src="assets/icons/icons8-customer-64.png" alt="">
                <h1>USER</h1>
            </div>
            <div class="nav-history">
                <div class="origin">
                    <img src="assets/icons/icons8-home-page-64.png" alt="">
                    <a href="">Home</a>
                </div>
                <p>/</p>
                <div>
                    <img src="assets/icons/icons8-user-64-title.png" alt="">
                    <a href="">Customer</a>
                </div>
                <p>/</p>
                <div>
                    <img src="assets/icons/icons8-customer-64.png" alt="">
                    <a href="">User</a>
                </div>
            </div>
            <div class="table-order">
                <table class="order">
                    <thead>
                        <tr>
                            <th colspan="1000" class="td-addnewshoes">
                                <button class="addnewshoes"> <img src="assets/icons/icons8-add-64.png" alt="icon-plus">
                                    Add New</button>
                            </th>
                        </tr>
                        <tr>
                            <th></th>
                            <th>ID</th>
                            <th>Fullname</th>
                            <th>Email</th>
                            <th>Phone number</th>
                            <th>Address</th>
                            <th>Password</th>
                            <th>Role</th>
                            <th class="td-action">Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td class="img-user"><img src="assets/images/emiuuu.jpg" alt=""></td>
                            <td>Maria Anders</td>
                            <td>Germany</td>
                            <td>Alfreds Futterkiste</td>
                            <td>Maria Anders</td>
                            <td>Germany</td>
                            <td>Alfreds Futterkiste</td>
                            <td>Maria Anders</td>
                            <td class="td-action">
                                <button class="btn-edit-user"><img src="assets/icons/icons8-edit-100.png"
                                        alt=""></button>
                                <button class="btn-lock-user"><img class="user-img"
                                        src="assets/icons/icons8-padlock-100.png" alt=""></button>
                            </td>
                        </tr>

                    </tbody>
                </table>
            </div>
        </section>
        <!--
            ROLE
        -->
        <section class="admin-customer-role none">
            <div class="title">
                <img src="assets/icons/icons8-role-66.png" alt="">
                <h1>ROLE</h1>
            </div>
            <div class="nav-history">
                <div class="origin">
                    <img src="assets/icons/icons8-home-page-64.png" alt="">
                    <a href="">Home</a>
                </div>
                <p>/</p>
                <div>
                    <img src="assets/icons/icons8-user-64-title.png" alt="">
                    <a href="">Customer</a>
                </div>
                <p>/</p>
                <div>
                    <img src="assets/icons/icons8-role-66.png" alt="">
                    <a href="">Role</a>
                </div>
            </div>
            <div class="table-order">
                <table class="order">
                    <thead>
                        <tr>
                            <th colspan="1000" class="td-addnewshoes">
                                <button class="addnewshoes"> <img src="assets/icons/icons8-add-64.png" alt="icon-plus">
                                    Add New</button>
                            </th>
                        </tr>
                        <tr>
                            <th>ID</th>
                            <th>Name</th>
                            <th>Description</th>
                            <th class="td-action">Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>Germany</td>
                            <td>Alfreds Futterkiste</td>
                            <td>Maria Anders</td>
                            <td class="td-action">
                                <button class="btn-edit-user"><img src="assets/icons/icons8-edit-100.png"
                                        alt=""></button>
                                <button class="btn-lock-user"><img class="user-img"
                                        src="assets/icons/icons8-remove-60.png" alt=""></button>
                            </td>
                        </tr>

                    </tbody>
                </table>
            </div>
        </section>
        <!-- REVENUE -->
        <section class="admin-parameters-revenue none">
            <div class="title">
                <img src="assets/icons/icons8-revenue-68.png" alt="">
                <h1>REVENUE</h1>
            </div>
            <div class="nav-history">
                <div class="origin">
                    <img src="assets/icons/icons8-home-page-64.png" alt="">
                    <a href="">Home</a>
                </div>
                <p>/</p>
                <div>
                    <img src="assets/icons/icons8-calendar-96.png" alt="">
                    <a href="">Parameters</a>
                </div>
                <p>/</p>
                <div>
                    <img src="assets/icons/icons8-revenue-68.png" alt="">
                    <a href="">Revenue</a>
                </div>
            </div>
            <div class="table-order">
                <table class="order">
                    <thead>
                        <tr>
                            <th colspan="1000" class="td-addnewshoes">
                                <button class="addnewshoes"> <img src="assets/icons/icons8-add-64.png" alt="icon-plus">
                                    Add New</button>
                            </th>
                        </tr>
                        <tr>
                            <th>ID</th>
                            <th>Name</th>
                            <th>Description</th>
                            <th class="td-action">Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>Germany</td>
                            <td>Alfreds Futterkiste</td>
                            <td>Maria Anders</td>
                            <td class="td-action">
                                <button class="btn-edit-user"><img src="assets/icons/icons8-edit-100.png"
                                        alt=""></button>
                                <button class="btn-lock-user"><img class="user-img"
                                        src="assets/icons/icons8-remove-60.png" alt=""></button>
                            </td>
                        </tr>

                    </tbody>
                </table>
            </div>
        </section>
        <!-- SELLING -->
        <section class="admin-parameters-selling none">
            <div class="title">
                <img src="assets/icons/icons8-fast-50.png" alt="">
                <h1>SELLING PRODUCTS</h1>
            </div>
            <div class="nav-history">
                <div class="origin">
                    <img src="assets/icons/icons8-home-page-64.png" alt="">
                    <a href="">Home</a>
                </div>
                <p>/</p>
                <div>
                    <img src="assets/icons/icons8-calendar-96.png" alt="">
                    <a href="">Parameters</a>
                </div>
                <p>/</p>
                <div>
                    <img src="assets/icons/icons8-fast-50.png" alt="">
                    <a href="">Selling products</a>
                </div>
            </div>
            <div class="table-order">
                <table class="order">
                    <thead>
                        <tr>
                            <th colspan="1000" class="td-addnewshoes">
                                <button class="addnewshoes"> <img src="assets/icons/icons8-add-64.png" alt="icon-plus">
                                    Add New</button>
                            </th>
                        </tr>
                        <tr>
                            <th>ID</th>
                            <th>Name</th>
                            <th>Description</th>
                            <th class="td-action">Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>Germany</td>
                            <td>Alfreds Futterkiste</td>
                            <td>Maria Anders</td>
                            <td class="td-action">
                                <button class="btn-edit-user"><img src="assets/icons/icons8-edit-100.png"
                                        alt=""></button>
                                <button class="btn-lock-user"><img class="user-img"
                                        src="assets/icons/icons8-remove-60.png" alt=""></button>
                            </td>
                        </tr>

                    </tbody>
                </table>
            </div>
        </section>
    </div>

    <div class="message msg-order none">
        <h2>Message</h2>
        <p class="content-msg"></p>
        <div class="btn-ok-cancel">
            <input class="cancel" type="button" value="Cancel">
            <input class="ok hover-btn" type="button" value="OK">
        </div>
    </div>

    <div class="msg-done importantNone">
        Done!
    </div>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    
    <script>
        function delProdInOrder (x) {
            $(".message").removeClass("none");
            $(".content-msg").text("Are you sure you want to delete this order?");
            var id_prod = x.id;
            $('.ok').click(function () {
                $(".message").addClass("none");
                setTimeout(function () {
                    $(".msg-done").removeClass("importantNone");
                    
                }, 500);
                setTimeout(function () {
                    $(".msg-done").addClass("importantNone");
                    
                }, 3000);
                $('.ok').removeData('clicked', true);
                alert(x.id);
                location.reload();
            });            
        }
    </script>
    
    <script>
        $('.cancel').click(function () {
            $(".message").addClass("none");
        });

    </script>
    <script>
        $('.btn-confirm-order').click(function () {
            $(".message").removeClass("none");
            $(".content-msg").text("Are you sure you want to browse this order?");
            var id_prod = this.id;
            $('.ok').click(function () {
                $(".message").addClass("none");
                setTimeout(function () {
                    $(".msg-done").removeClass("importantNone");
                    
                }, 500);
                setTimeout(function () {
                    $(".msg-done").addClass("importantNone");
                    
                }, 3000);
                $('.ok').removeData('clicked', true);
                alert(id_prod);
                location.reload();
            });       
        });
        $('.cancel').click(function () {
            $(".message").addClass("none");
        });
    </script>
    <script>
        $('.cancel').hover(function () {
            $(".ok").removeClass("hover-btn");
            $(".ok").removeClass("font-size-btn-msg");
            $(".cancel").addClass("hover-btn");
            $(".cancel").addClass("font-size-btn-msg");
        });
        $('.ok').hover(function () {
            $(".cancel").removeClass("hover-btn");
            $(".cancel").removeClass("font-size-btn-msg");
            $(".ok").addClass("hover-btn");
            $(".ok").addClass("font-size-btn-msg");
        });
    </script>
    <!-- ADD NEW ONCLICK-->
    <script>
        $('#addneworder').click(function () {
            $(".addneworder-nav").removeClass("importantNone");
            $(".table-order-add").addClass("importantNone");
            $(".title-add-new").removeClass("importantNone");
            $(".title-order-management").addClass("importantNone");
            $(".add-new-order-form").removeClass("importantNone");

        });
        $('#editneworder').click(function () {
            $(".editneworder-nav").removeClass("importantNone");
            $(".table-order-add").addClass("importantNone");
            $(".title-edit-new").removeClass("importantNone");
            $(".title-order-management").addClass("importantNone");
            $(".edit-new-order-form").removeClass("importantNone");

        });
    </script>
    <script>
        $('.other').click(function () {
            $(".other-menu").removeClass("none", 10000, "easeInBack");
        });
    </script>
    <script>
        $('.dashboard').click(function () {
            window.location.href = "admin.html";
        });
        $('.admin-logo').click(function () {
            window.location.href = "admin.html";
        });
    </script>

    <script>
        var arrSec = document.getElementsByTagName("section");
        $(document).ready(function () {
            $(".sub-menu-ul").click(function () {
               window.location.href= this.id;
            });
        });
    </script>

    <script>
        $(document).ready(function () {
            $(".admin-menu-icon").click(function () {
                $(".navigation").toggle("none");
            });
        });
    </script>


    <script>
        var arrDiv = document.getElementsByClassName("menu");
        var arrP = document.getElementsByClassName("dropdown-menu");
        $(document).ready(function () {
            $(".menu").click(function () {
                var classSubMenu = "." + this.id;
                $(classSubMenu).toggle("none");
                for (let i = 0; i < arrP.length; i++) {
                    if (arrP[i].className.includes(this.id)) {
                        $(arrP[i]).toggleClass("rotate");
                    }
                }
            });
        });
    </script>
    <script>
        var padlock = 'assets/icons/icons8-padlock-100.png';
        var lock = 'assets/icons/icons8-lock-100.png';
        $('.btn-lock-user').click(function () {
            if ($('.user-img').attr('src') === padlock) {
                $('.user-img').attr('src', lock);
            } else {
                $('.user-img').attr('src', padlock)
            }
        })
    </script>
</body>

</html>