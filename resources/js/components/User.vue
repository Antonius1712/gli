
<template>
    <div class="row">
        <div class="col-lg-12 col-md-12">
            <button @click="changeButton()" id="add" class="btn btn-success" data-toggle="modal" data-target="#myModal"> Add </button>
            <button id="edit" style="display:none;" class="btn btn-success" data-toggle="modal" data-target="#myModal"> Edit </button>
            
            <input @input="loadUsers()" type="text" class="form-control" v-model="searchValue" placeholder="Search">
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th> # </th>
                        <th @click="thClick('username')" style="cursor:pointer;"> Username </th>
                        <th @click="thClick('email')" style="cursor:pointer;"> Email </th>
                        <th @click="thClick('role_id')" style="cursor:pointer;"> Role </th>
                        <th> Action </th>
                    </tr>
                </thead>
                <tbody>
                    <tr v-for="(user, key) in users">
                        <td> {{ key+1 }} </td>
                        <td> {{ user.username }} </td>
                        <td> {{ user.email }} </td>
                        <td> {{ user.get_role ? user.get_role.name : '' }} </td>
                        <td>
                            <button @click="editData(user.id, user.username, user.email, user.get_role ? user.get_role.id : '')" id="edit" class="btn btn-warning"> Edit </button>
                            <button @click="deleteData(user.id)" id="delete" class="btn btn-danger"> Delete </button>
                        </td>
                    </tr>
                </tbody>
                <tfoot>
                    <tr>
                        <td colspan="5" style="text-align:center">
                            <button class="btn btn-default" @click="loadUsers(prevUrl)"> Prev </button>
                            {{ From }} - {{ To }} of {{ Total }}
                            <button class="btn btn-default" @click="loadUsers(nextUrl)"> Next </button>
                        </td>
                    </tr>
                </tfoot>
            </table>
        </div>

        <div id="myModal" class="modal fade" role="dialog">
            <div class="modal-dialog">
                <validationObserver v-slot="{handleSubmit}">
                    <form @submit.prevent="handleSubmit(submitData)">
                        <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title">{{ modalTitle }}</h4>
                        </div>
                        <div class="modal-body">
                            <ValidationProvider name="username" rules="required|min:6|max:15" v-slot="{ errors }">
                                <div class="col-lg-12 form-group">
                                    <label> Username </label>
                                    <input v-model="username" type="text" class="form-control">
                                    <span style="color:red; font-size:12px; font-weight:bold"> {{ errors[0] }} </span>
                                </div>
                            </ValidationProvider>

                            <ValidationProvider name="password" rules="required|min:6|max:15" v-slot="{ errors }">
                                <div class="col-lg-12 form-group">
                                    <label> password </label>
                                    <input v-model="password" type="password" class="form-control">
                                    <span style="color:red; font-size:12px; font-weight:bold"> {{ errors[0] }} </span>
                                </div>
                            </ValidationProvider>

                            <ValidationProvider name="email" rules="required|email" v-slot="{ errors }">
                                <div class="col-lg-12 form-group">
                                    <label> email </label>
                                    <input v-model="email" type="email" class="form-control">
                                    <span style="color:red; font-size:12px; font-weight:bold"> {{ errors[0] }} </span>
                                </div>
                            </ValidationProvider>

                            <ValidationProvider name="role" rules="required" v-slot="{ errors }">
                                <div class="col-lg-12 form-group">
                                    <label> Role </label>
                                    <select v-model="role" class="form-control">
                                        <option v-bind:value="role.id" v-for="(role, key) in listRole">
                                            {{ role.name }}
                                        </option>
                                    </select>
                                    <span style="color:red; font-size:12px; font-weight:bold"> {{ errors[0] }} </span>
                                </div>
                            </ValidationProvider>
                        </div>
                        <div class="modal-footer">
                            <button type="submit" class="btn btn-primary" id="saveData">Save</button>
                            <button type="submit" class="btn btn-primary" id="updateData" style="display:none">update</button>
                            <button id="closeModal"type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        </div>
                        </div>
                    </form>
                </validationObserver>
            </div>
        </div>
    </div>
</template>

<script>
    export default{
        data(){
            return{
                users:[],
                listRole:[],
                userId:'',
                username:'',
                password:'',
                email:'',
                role:'',
                modalTitle:'',
                searchUser:'',
                length:5,
                searchValue:'',
                nextUrl:'',
                prevUrl: '',
                From:0,
                To:0,
                Total:0,
                column:'id',
                sortBy:'asc'
            }
        },

        mounted(){
            this.loadUsers();
            this.getRole();
        },

        methods: {
            loadUsers(url = `${urlApi}users`){
                axios.get(url,{
                    params: {
                        searchValue: this.searchValue,
                        length: this.length,
                        sortBy: this.sortBy,
                        column: this.column
                    }
                })
                .then((response) => {
                    this.users = response.data.data;
                    this.nextUrl = response.data.next_page_url;
                    this.prevUrl = response.data.prev_page_url;
                    this.From = response.data.from;
                    this.To = response.data.to;
                    this.Total = response.data.total;
                })
                .catch((error) =>{
                    console.log(error);
                });
            },
            
            thClick(column){
                if( this.sortBy == 'asc' ){
                    this.sortBy = 'desc';
                }else if( this.sortBy == 'desc' ){
                    this.sortBy = 'asc';
                }

                this.column = column;
                this.loadUsers();
            },

            getRole(){
                axios.get(`${urlApi}listRole`)
                    .then((response) => {
                        this.listRole = response.data
                    })
                    .catch((error) =>{
                        console.log(error);
                    });
            },
            submitData(){
                if( this.modalTitle == 'Add' ){
                    axios.post(`${urlApi}storeUser`,{
                        username: this.username,
                        password: this.password,
                        email: this.email,
                        role: this.role
                    }).then((response) => {
                        if( response.data == 'Success' ){
                            this.loadUsers()
                            $('#closeModal').trigger('click');
                            this.username = '';
                            this.password = '';
                            this.email = '';
                            this.role = '';
                        }
                    });
                }else if( this.modalTitle = 'Edit' ){
                    axios.post(`${urlApi}updateUser`,{
                        id: this.userId,
                        username: this.username,
                        password: this.password,
                        email: this.email,
                        role: this.role
                    }).then((response) => {
                        if( response.data == 'Success' ){
                            this.loadUsers()
                            $('#closeModal').trigger('click');
                            this.username = '';
                            this.password = '';
                            this.email = '';
                            this.role = '';
                        }
                    });
                }
            },

            editData(id, username, email, role){
                this.getRole();
                this.modalTitle = 'Edit';
                this.userId = id;
                this.username = username;
                this.email = email;
                this.role = role;
                this.password = '';
                $('#edit').trigger('click');
                $('#saveData').hide();
                $('#updateData').show();
            },

            deleteData(id){
                axios.post(`${urlApi}deleteUser`,{
                        id: id,
                    }).then((response) => {
                        if( response.data == 'Success' ){
                            this.loadUsers()
                        }
                    });
            },

            changeButton(){
                this.modalTitle = 'Add';
                this.userId = '';
                this.username = '';
                this.password = '';
                this.email = '';
                this.role = '';
                $('#saveData').show();
                $('#updateData').hide();
            }
        }
    }
</script>