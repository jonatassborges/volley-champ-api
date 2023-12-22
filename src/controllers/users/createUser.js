import user from "../../models/userModel.js";
import bcrypt from "bcrypt";
import path from "path";
import fs from "fs";
import { fileURLToPath } from 'url';
import { dirname } from 'path';

const __filename = fileURLToPath(import.meta.url);
const __dirname = dirname(__filename);
// Set up multer for file uploads


const createUser = async (req, res) => {
  try {
    // Hash password
    const hash = await bcrypt.hash(req.body.pass, 10);

    // Prepare user data
    const userData = {
      ...req.body,
      pass: hash,
    };

    // Check if upload directory exists, if not, create it
    const uploadDir = path.join(__dirname, '/uploads');
    if (!fs.existsSync(uploadDir)) {
      fs.mkdirSync(uploadDir);
    }

    // Move the uploaded file to the upload directory and update the file path
    const newFilePath = path.join(uploadDir, Date.now() + req.file.originalname);
    fs.renameSync(req.file.path, newFilePath);
    userData.photo = newFilePath;

    // Insert user data into the database
    const [result] = await user.insert(userData);
    delete userData.pass;
    if (result.affectedRows === 1) {
      res.json({
        success: "Usuário inserido com Sucesso!",
        user: {
          id: result.insertId,
          ...userData,
        },
      });
    }
  } catch (error) {
    console.log(error);
    res.status(500).json({
      error: "Erro no servidor!",
    });
  }
};

export default createUser;