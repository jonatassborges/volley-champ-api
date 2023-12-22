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


router.get('/list', listUsers)
router.get('/', getUser)
router.post('/',upload.single("photo"), createUser)
router.delete('/', auth, deleteUser)
router.put('/', auth, updateUser)





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