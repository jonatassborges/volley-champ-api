import express from 'express'
import createUser from '../controllers/users/createUser.js'
const router = express.Router()

router.post('/', createUser)




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