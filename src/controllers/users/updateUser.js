import user from "../../models/userModel.js";
import bcrypt from "bcrypt";
import path from "path";
import fs from "fs";
import { fileURLToPath } from "url";
import { dirname } from "path";

const __filename = fileURLToPath(import.meta.url);
const __dirname = dirname(__filename);

const putUser = async (req, res, next) => {
  try {
    const userData = req.body;
    if (userData.id != req.userLogged.id) {
      return res.status(400).json({
        error: `Usuário não autorizado a fazer update.`,
      });
    }
    if (userData.pass) {
      bcrypt.hash(userData.pass, 10, async (error, hash) => {
        if (error)
          return res.status(500).json({
            error: "Erro ao gerar senha criptografada!",
          });
        userData.pass = hash;

        // Check if the upload directory exists; if not, create it
        const uploadDir = path.join(__dirname, "/uploads");
        if (!fs.existsSync(uploadDir)) {
          fs.mkdirSync(uploadDir);
        }

        // If a file is provided in the request, handle the file upload
        if (req.file) {
          try {
            const [rows] = await user.getById(req.userLogged.id);
            if (rows.length === 0) {
              res.status(404).json({ error: `nenhum  usuário encontrado` });
            }
            fs.unlinkSync(rows[0].photo);
          } catch (error) {
            console.error(`Error deleting file ${userData.photo}:`, error);
          }

          // Move the uploaded file to the upload directory and update the file path in the user data
          const newFilePath = path.join(
            uploadDir,
            Date.now() + req.file.originalname
          );
          fs.renameSync(req.file.path, newFilePath);
          userData.photo = newFilePath;
        }
        const [result] = await user.update(userData);
        delete userData.pass;
        if (result.affectedRows === 1) {
          res.json({
            success: "Usuário atualizado com Sucesso!",
            user: {
              ...userData,
            },
          });
        } else {
          res.status(404).json({
            error: `Usuário id: ${userData.id} não Encontrado!`,
          });
        }
      });
    }
  } catch (error) {
    console.log(error);
    res.status(500).json({
      error: "Erro no servidor!",
    });
  }
};

export default putUser;
