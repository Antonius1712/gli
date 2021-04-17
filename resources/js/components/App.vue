<template>
    <div class="container-fluid">
        <div class="row">
            <nav class="col-md-2 d-none d-md-block bg-light sidebar">
                <div class="sidebar-sticky">
                    <ul class="nav flex-column">

                        <li class="nav-item">
                            <router-link class="nav-link active" :to="{ name: 'home' }"> Dashboard </router-link>
                        </li>

                        <li class="nav-item">
                            <router-link class="nav-link" :to="{ name: 'user' }"> User </router-link>
                            
                        </li>

                        <li class="nav-item">
                            <router-link class="nav-link" :to="{ name: 'user_role' }"> User Role </router-link>
                        </li>
                    </ul>
                </div>
            </nav>

            <main role="main" class="col-md-9 ml-sm-auto col-lg-10 pt-3 px-4">
                <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pb-2 mb-3 border-bottom">
                    <h1 class="h2">Dashboard</h1>
                    <div class="btn-toolbar mb-2 mb-md-0">
                    <div class="btn-group mr-2">
                        <button class="btn btn-sm btn-outline-secondary">Share</button>
                        <button class="btn btn-sm btn-outline-secondary">Export</button>
                    </div>
                    <button class="btn btn-sm btn-outline-secondary dropdown-toggle">
                        <span data-feather="calendar"></span>
                        This week
                    </button>
                    </div>
                </div>
                <div class="wrap">
                    <router-view/>
                </div>
            </main>
        </div>
    </div>
</template>

<script>
    export default{
        data(){
            return{
                role:[]
            }
        }
    }
</script>