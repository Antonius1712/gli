<template>
    <div class="row">
        <div class="col-lg-12 col-md-12">
            <button @click="changeButton()" id="add" class="btn btn-success" data-toggle="modal" data-target="#roleModal"> Add </button>
            <button id="editBtn" style="display:none;" class="btn btn-success" data-toggle="modal" data-target="#roleModal"> Edit </button>

            <input @input="loadRoles()" type="text" class="form-control" v-model="searchValue" placeholder="Search">
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th> # </th>
                        <th @click="thClick('name')" style="cursor:pointer;"> Name </th>
                        <th> Action </th>
                    </tr>
                </thead>
                <tbody>
                    <tr v-if="error == false" v-for="(role, key) in roles">
                        <td> {{ key+1 }} </td>
                        <td> {{ role.name }} </td>
                        <td>
                            <button @click="editData(role.id, role.name)" id="edit" class="btn btn-warning"> Edit </button>
                            <button @click="deleteData(role.id)" id="delete" class="btn btn-danger"> Delete </button>   
                        </td>
                    </tr>

                    <tr v-else>
                        <td colspan="3">
                            Empty Data.
                        </td>
                    </tr>
                </tbody>
                <tfoot>
                    <tr>
                        <td colspan="5" style="text-align:center">
                            <button class="btn btn-default" @click="loadRoles(prevUrl)"> Prev </button>
                            {{ From }} - {{ To }} of {{ Total }}
                            <button class="btn btn-default" @click="loadRoles(nextUrl)"> Next </button>
                        </td>
                    </tr>
                </tfoot>
            </table>
        </div>

        <div id="roleModal" class="modal fade" role="dialog">
            <div class="modal-dialog">
                <validationObserver v-slot="{handleSubmit}">
                    <form @submit.prevent="handleSubmit(submitData)">
                        <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title">{{ modalTitle }}</h4>
                        </div>
                        <div class="modal-body">
                            <ValidationProvider name="name" rules="required|min:2|max:15" v-slot="{ errors }">
                                <div class="col-lg-12 form-group">
                                    <label> Name </label>
                                    <input v-model="roleName" type="text" class="form-control">
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
                roles:[],
                modalTitle:'',
                roleName:'',
                length:5,
                searchValue:'',
                nextUrl:'',
                prevUrl: '',
                From:0,
                To:0,
                Total:0,
                column:'id',
                sortBy:'asc',
                error:false
            }
        },

        mounted(){
            this.loadRoles();
        },

        methods: {
            loadRoles(url = `${urlApi}user_roles`){
                axios.get(url, {
                    params: {
                        searchValue: this.searchValue,
                        length: this.length,
                        sortBy: this.sortBy,
                        column: this.column
                    }
                })
                .then((response) => {
                    this.roles = response.data.data;

                    this.nextUrl = response.data.next_page_url;
                    this.prevUrl = response.data.prev_page_url;
                    this.From = response.data.from;
                    this.To = response.data.to;
                    this.Total = response.data.total;
                })
                .catch(function(error){
                    console.log(error);
                    this.error = true;
                });
            },
            submitData(){
                if( this.modalTitle == 'Add' ){
                    axios.post(`${urlApi}storeUserRole`,{
                        name: this.roleName,
                    }).then((response) => {
                        if( response.data == 'Success' ){
                            this.loadRoles()
                            $('#closeModal').trigger('click');
                            this.roleName = '';
                        }
                    });
                }else if( this.modalTitle = 'Edit' ){
                    axios.post(`${urlApi}updateUserRole`,{
                        id: this.roleId,
                        name: this.roleName,
                    }).then((response) => {
                        if( response.data == 'Success' ){
                            this.loadRoles()
                            $('#closeModal').trigger('click');
                            this.roleName = '';
                        }
                    });
                }
            },
            changeButton(){
                this.modalTitle = 'Add';
                this.roleId = '';
                $('#saveData').show();
                $('#updateData').hide();
            },

            thClick(column){
                if( this.sortBy == 'asc' ){
                    this.sortBy = 'desc';
                }else if( this.sortBy == 'desc' ){
                    this.sortBy = 'asc';
                }

                this.column = column;
                this.loadRoles();
            },

            editData(id, roleName){
                this.modalTitle = 'Edit';
                this.roleId = id;
                this.roleName = roleName;
                $('#editBtn').trigger('click');
                $('#saveData').hide();
                $('#updateData').show();
            },

            deleteData(id){
                axios.post(`${urlApi}deleteUserRole`,{
                    id: id,
                }).then((response) => {
                    if( response.data == 'Success' ){
                        this.loadRoles()
                    }
                });
            }
        }
    }
</script>