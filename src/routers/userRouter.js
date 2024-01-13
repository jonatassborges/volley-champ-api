import express from 'express'
import createUser from '../controllers/users/createUser.js'
import listUsers from '../controllers/users/listUsers.js'
import deleteUser from '../controllers/users/deleteUser.js'
import updateUser from '../controllers/users/updateUser.js'
import getUser from '../controllers/users/getUser.js'
import auth from '../middlewares/auth.js'
import multer from "multer";


const router = express.Router()
const upload = multer({ dest: 'uploads/' });
// upload is being passed like a middleware to the route, so it will be executed before the route handler.
// but it's keep going to "createUser" and ends there, that's why the 'uploads' folder is insinde the 'controllers/users' folder.

router.get('/list', listUsers)
router.get('/', getUser)
router.post('/',upload.single("photo"), createUser)
router.delete('/', auth, deleteUser)
router.put('/', auth, upload.single("photo"), updateUser)





// router.get('/users', (req, res, next) => {
//     res.json({message: "Bem Vindo a nossa API!"})
// })
// router.post('/users', (req, res, next) => {
//     res.json({message: "POST API!"})
// })
// router.put('/users', (req, res, next) => {
//     res.json({message: "PUT API!"})
// })

// router.delete('/users', (req, res, next) => {
//     res.json({message: "DELETE API"})
// })
export default router