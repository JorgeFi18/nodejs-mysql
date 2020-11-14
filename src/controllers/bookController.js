const controller = {};
const historyQuery = 'SELECT alumnos.carnet, alumnos.apellidos, alumnos.nombres, alumnos.direccion,'+
'alumnos.telefono, prestamos.fecha_prestamo, prestamos.fecha_devolucion FROM prestamos ' +
'INNER JOIN alumnos ON prestamos.id_alumno=alumnos.carnet WHERE prestamos.id_libro = ?';

controller.list = (req, res) => {
  req.getConnection((err, conn) => {
    conn.query('SELECT * FROM libros', (err, books) => {
     if (err) {
      res.json(err);
     }
     res.render('books', {
        data: books
     });
    });
  });
};

controller.save = (req, res) => {
  const data = req.body;
  console.log(req.body)
  req.getConnection((err, connection) => {
    const query = connection.query('INSERT INTO libros set ?', data, (err, customer) => {
      console.log(customer)
      res.redirect('/');
    })
  })
};

controller.edit = (req, res) => {
  const { id } = req.params;
  req.getConnection((err, conn) => {
    conn.query("SELECT * FROM libros WHERE codigo_libro = ?", [id], (err, rows) => {
      res.render('books_edit', {
        data: rows[0]
      })
    });
  });
};

controller.update = (req, res) => {
  const { id } = req.params;
  const newBook = req.body;
  req.getConnection((err, conn) => {

  conn.query('UPDATE libros set ? where codigo_libro = ?', [newBook, id], (err, rows) => {
    res.redirect('/');
  });
  });
};

controller.delete = (req, res) => {
  const { id } = req.params;
  req.getConnection((err, connection) => {
    connection.query('DELETE FROM libros WHERE codigo_libro = ?', [id], (err, rows) => {
      res.redirect('/');
    });
  });
}

controller.addBook = (req, res) => {
  res.render('books_add');
}

controller.history = async (req, res) => {
  const { id } = req.params;
  let bookInfo = {};
  await req.getConnection((err, conn) => {
    conn.query("SELECT * FROM libros WHERE codigo_libro = ?", [id], (err, rows) => {
      bookInfo = rows[0];
    });
  });
  req.getConnection((err, conn) => {
    conn.query(historyQuery, [id], (err, rows) => {
      res.render('history', {
        data: {
          book: bookInfo,
          history: rows
        }
      })
    });
  }); 
};

controller.addHistory = async (req, res) => {
  const { id } = req.params;
  let students = [];
  await req.getConnection((err, conn) => {
    conn.query("SELECT * FROM alumnos", [id], (err, rows) => {
      students = rows;
    });
  });
  req.getConnection((err, conn) => {
    conn.query("SELECT * FROM libros WHERE codigo_libro = ?", [id], (err, rows) => {
      res.render('history_add', {
        data: {
          book: rows[0],
          students: students
        }
      });
    });
  });
};

controller.saveHistory = (req, res) => {
  const { id } = req.params;
  const data = req.body;
  data['id_libro'] = id;
  console.log(req.body)
  req.getConnection((err, connection) => {
    const query = connection.query('INSERT INTO prestamos set ?', data, (err, prestamo) => {
      console.log(prestamo);
      res.redirect(`/history/${id}`);
    })
  })
};

module.exports = controller;
