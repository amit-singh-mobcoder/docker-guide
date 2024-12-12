import express from 'express'
import { configDotenv } from 'dotenv';
configDotenv()
const app = express()
const PORT = process.env.PORT || 8000;

app.get('/', (_, res) => {
    res.status(200).json({
        success: true,
        message: "I'm small nodejs server in docker container"
    })
})

app.listen(PORT, () => {
    console.log(`Server is listening at port: ${PORT}`)
})