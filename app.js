const express = require('express');
const app = express();
const port = 7529;
const programmingLanguagesRouter = require('./routes/programmingLanguages');

// 内置中间件
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

// 路由级别的中间件
app.use('/programming-Languages', programmingLanguagesRouter);

// 应用程序级别的中间件
app.use((req, res, next) =>
{
   console.log(`${new Date()} -- RequestURL: ${req.url}`);
   next();
});

// 错误处理中间件
app.use((err, req, res, next) => 
{
    const statusCode = err.statusCode || 500;
    console.error(err.message, err.stack);
    res.status(statusCode).json({ message: err.message });
    return;
});

// 静态文件中间件
app.use(express.static('public'));

// 配置主路由
app.get('/', (req, res) => 
{
    res.json({ message: 'Hello World!' });
});

// 启动服务器
app.listen(port, () => 
{
    console.log(`Example app listening at http://localhost:${port}`);
});