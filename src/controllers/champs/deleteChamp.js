import champ from "../../models/modelChamp.js";

const deleteChamp = async (req, res) => {
  try {
    const champId = req.params.champId;
    const userId = req.userLogged.id;
    const [rows] = await champ.getById(champId);
    if (rows.length === 0) {
      res.status(404).json({ error: `nenhum  campeonato encontrado` });
    } else {
      if (rows[0].id_user !== userId) {
        return res.status(400).json({
          error: "Apenas o dono do campeonato pode deletá-lo!",
        });
      }
      const [result] = await champ.remove(champId);
      if (result.affectedRows === 1) {
        return res.json({
          success: "Campeonato deletado com Sucesso!",
        });
      }
    }
  } catch (error) {
    console.log(error.message);
    res.status(500).json({
      error: "Erro no servidor!",
    });
  }
};

export default deleteChamp