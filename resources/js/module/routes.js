import env from '../env.js';
import tbl_user from '../components/User'
import tbl_user_role from '../components/UserRole'
import home from '../components/Home'

export default [
    {
        path:`${env.appPath()}/`,
        name:'home',
        component: home
    },
    {
        path:`${env.appPath()}/user`,
        name:'user',
        component: tbl_user
    },
    {
        path:`${env.appPath()}/user_role`,
        name:'user_role',
        component: tbl_user_role
    }
];  