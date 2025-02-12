const express = require('express');
const router = express.Router();
const programminglanguages = require('../services/programmingLanguages');

router.get('/', async (req, res, next) => 
{
    try
    {
        res.json(await programminglanguages.getMultiple(req.query.page));
    }
    catch (err)
    {
        console.log('Error:', err.message);
        next(err);
    }
});

router.get('/create/', async (req, res, next) =>
{
    try
    {
        res.json(await programminglanguages.create(req.body));
    }
    catch (err)
    {
        console.log('Error:', err.message);
        next(err);
    }
});

router.get('/update/:id', async (req, res, next) =>
{
    try
    {
        res.json(await programminglanguages.update(req.params.id, req.body));
    }
    catch (err)
    {
        console.log('Error:', err.message);
        next(err);
    }
});

router.delete('/delete/:id', async (req, res, next) =>
{
    try
    {
        res.json(await programminglanguages.remove(req.params.id));
    }
    catch (err)
    {
        console.log('Error:', err.message);
        next(err);
    }
});

router.get('/search/:id', async (req, res, next) =>
{
    try
    {
        res.json(await programminglanguages.search(req.params.id));
    }
    catch (err)
    {
        console.log('Error:', err.message);
        next(err);
    }
});

// 搜索编程语言
router.get('/searchLanguages/:searchTerm', async (req, res, next) => 
{
    try 
    {
        const searchTerm = req.params.searchTerm;
        res.json(await programminglanguages.searchLanguages(searchTerm));
    } 
    catch (err) 
    {
        console.log('Error:', err.message);
        next(err);
    }
});

// 添加编程语言及其框架
router.post('/addLanguageWithFrameworks', async (req, res, next) => 
{
    try 
    {
        const { language, frameworks } = req.body;
        res.json(await programminglanguages.addLanguageWithFrameworks(language, frameworks));
    } 
    catch (err) 
    {
        console.log('Error:', err.message);
        next(err);
    }
});

module.exports = router;