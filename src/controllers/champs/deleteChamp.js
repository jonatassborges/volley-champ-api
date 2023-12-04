import champ from "../../models/modelChamp.js";

const deleteChamp = async (req, res) => {
  try {
    const champData = req.body;
    const userData = req.body;
    if (userData.id !== req.userLogged.id) {
      return res.status(400).json({
        error: `Usuário não autorizado a deletar.`,
      });
    }
    const [result] = await champ.remove(champData.id);
    if (result.affectedRows === 1) {
      res.json({
        success: "Campeonato Apagado com Sucesso!",
      });
    } else {
      res.status(404).json({
        error: `Campeonato id: ${champData.id} não Encontrado!`,
      });
    }
  } catch (error) {
    console.log(error);
    res.status(500).json({
      error: "Erro no servidor!",
    });
  }
};

export default deleteChamp;