    <div class="d-flex flex-column flex-shrink-0 p-3 text-white"  style="height: 100vh; width: 250px; background-color: #59ab6e">
                    <ul class="list-unstyled templatemo-accordion">
                        <div class="d-flex flex-column justify-content-center align-items-center">
                            <img src="img/${sessionScope.account.avatar}" alt="alt" style="width: 150px;height: 150px;border-radius: 50%;object-fit: cover;display: block"/>
                            <p style="text-align: center;font-size: 20px;margin-top: 10px">Hello, ${sessionScope.account.username}</i> </p>
                        </div>
                    </ul>

                    <hr><!-- comment -->
                    <ul class="list-unstyled templatemo-accordion">


                        <ul class="collapse show list-unstyled pl-3">

                            <a href="list" class="nav-link d-flex align-items-center" style="color: white">
                                <i class="fa-solid fa-house pe-3" style="margin-right: 10px; "></i>
                                Home
                            </a>
                            </li>
                            
                            <li>
                                <a href="change-information" class="nav-link sidebarBtn" style="color: white">
                                    <i class=" fa-solid fa-user-edit pe-3" style="margin-right: 10px"></i>                            
                                    Information
                                </a>
                            </li>
                            <li>
                                <a href="history-purchase" class="nav-link sidebarBtn" style="color: white">
                                    <i class=" fa-solid fa-cart-plus pe-3" style="margin-right: 10px"></i>
                                   History
                                </a>
                            </li>
                            <li>
                                <a href="logout" class="nav-link sidebarBtn" style="color: white">
                                    <i class="fa-solid fa-user pe-3" style="margin-right: 10px"></i>
                                    Logout
                                </a>
                            </li>
                        </ul>
                    </ul>
                    <hr>
                </div>
