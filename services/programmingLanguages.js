const db = require('./db');
const helper = require('../helper');
const config = require('../config');
const mysql = require('mysql2/promise');

async function getMultiple(page = 1)
{
    const offset = helper.getOffset(page, config.listPerPage);
    const rows = await db.query
    (
        `SELECT id, name, released_year, githut_rank, pypl_rank, tiobe_rank 
        FROM programming_languages LIMIT ${offset},${config.listPerPage}`
    );

    const data = helper.emptyOrRows(rows);
    const meta = {page};

    return {data, meta};
}

async function create(programmingLanguage)
{
    const result = await db.query
    (
        `INSERT INTO programming_languages 
        (name, released_year, githut_rank, pypl_rank, tiobe_rank) 
        VALUES 
        ('${programmingLanguage.name}', ${programmingLanguage.released_year}, ${programmingLanguage.githut_rank}, ${programmingLanguage.pypl_rank}, ${programmingLanguage.tiobe_rank})`
    );

    let message = 'Error in creating programming language';

    if (result.affectedRows) 
    {
        message = 'Programming language created successfully';
    }

    return {message};
}

async function update(id, programmingLanguage)
{
    const result = await db.query
    (
        `UPDATE programming_languages
        SET name = '${programmingLanguage.name}', released_year = ${programmingLanguage.released_year}, githut_rank = ${programmingLanguage.githut_rank}, pypl_rank = ${programmingLanguage.pypl_rank}, tiobe_rank = ${programmingLanguage.tiobe_rank}
        WHERE id = ${id}`
    );

    let message = 'Error in updating programming language';

    if (result.affectedRows)
    {
        message = 'Programming language updated successfully';
    }

    return {message};
}

async function remove(id)
{
    const result = await db.query
    (
        `DELETE FROM programming_languages WHERE id = ${id}`
    );

    let message = 'Error in deleting programming language';

    if (result.affectedRows)
    {
        message = 'Programming language deleted successfully';
    }

    return {message};
}

async function search(id)
{
    const rows = await db.callSpSearch(id);
    const data = helper.emptyOrRows(rows);

    return {data};
}

async function searchLanguages(searchTerm) 
{
    const result = await db.query
    (`
      SELECT name, description,
             MATCH(name, description) AGAINST(?) as relevance
      FROM programming_languages
      WHERE MATCH(name, description) AGAINST(?)
      ORDER BY relevance DESC`,
      [searchTerm, searchTerm]
    );

    return result;
}

async function addLanguageWithFrameworks(language, frameworks)
{
    const connection = await mysql.createConnection(config.db);

    try
    {
        await connection.beginTransaction();
        const [languageResult] = await connection.execute
        (
            'INSERT INTO programming_languages (name, released_year) VALUES (?, ?)',
            [language.name, language.released_year]
        );

        const languageId = languageResult.insertId;

        for (const framework of frameworks)
        {
            await connection.execute
            (
                'INSERT INTO frameworks (language_id, name, release_date) VALUES (?, ?, ?)',
                [languageId, framework.name, framework.release_date]
            );
        }

        await connection.commit();
        return {success: true, languageId};
    }
    catch (err)
    {
        await connection.rollback();
        throw err;
    }
    finally
    {
        await connection.end();
    }
}

module.exports = 
{
    getMultiple,
    create,
    update,
    remove,
    search,
    searchLanguages,
    addLanguageWithFrameworks
};