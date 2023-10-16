//const express = require('express')
import express from 'express'
import bodyParser from 'body-parser'
import cors from 'cors'
import { PORT } from './config.js'

import userRouter from './routers/userRouter.js'

const api = express()

// converte toda req com body p objeto e fica salvo
//no req.body
api.use(cors())
api.use(bodyParser.json())

api.use('/user', userRouter)


api.listen(PORT, () => {
    console.log(`server running at ${PORT}`)
})