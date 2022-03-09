class NewsModel {
    constructor(dbConnection) {
      this.dbConnection = dbConnection;
    }
  
    async create(news) {
      const {
        id, titulo, link_materia, url_image, subtitulo
      } = news;
  
      const sql = `
      INSERT INTO news (id ,titulo, link_materia, url_image, subtitulo) 
      VALUES (?,?,?,?,?)
      `;
  
      const [result] = await this.dbConnection.execute(
        sql,
        [id, titulo, link_materia, url_image, subtitulo],
      );
      return result.insertId;
      
    }

    async search(query) { //rever a query
        let sql = `
          SELECT m.*, c.titulo as titulo FROM news m 
          INNER JOIN  c.subtitulo as subtitulo 
          WHERE 1 = 1 
          `;
    
        const params = [];
    
        if (query.subtitulo) {
          sql += `
            AND m.subtitulo = ? 
            `;
          params.push(query.subtitulo);
        }
    
        if (query.titulo) {
          sql += `
          AND LOWER(m.titulo) like ? 
              `;
          params.push(`%${query.titulo.toLowerCase()}%`);
        }
    
        const [result] = await this.dbConnection.execute(sql, params);
        return result;
      }
  
    
  
  module.exports = UsersModel;