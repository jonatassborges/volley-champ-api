import user from "../../models/userModel.js";
import bcrypt from "bcrypt";

const putUser = async (req, res, next) => {
  try {
    const userData = req.body;
    if (userData.id !== req.userLogged.id) {
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
