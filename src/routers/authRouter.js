import express from 'express'
import login from '../controllers/auth/login.js'
import logout from '../controllers/auth/logout.js'
import loginToken from '../controllers/auth/loginToken.js'

const router = express.Router()

router.post('/login', login)
router.delete('/logout', logout)
router.delete('/login-token', loginToken)

export default router