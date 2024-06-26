<!DOCTYPE html>
<html>

<head>
    <link rel="stylesheet" href="barang.css">
    <title>Barang</title>
</head>

<body>
    <?php include "menu.php"; ?>

    <?php

    require "koneksi.php";

    $sql = "SELECT * FROM barang";
    $query = mysqli_query($koneksi, $sql);
    ?>

    <div>
        <h1>Data Barang</h1>
        <form action="new-barang.php" method="GET">
            <button type="submit" class="tambah">Tambah</button>
        </form>
    </div>
    <table border="1" class="table-hover">
        <tr>
            <th>No.</th>
            <th>Nama</th>
            <th>genre</th>
            <th>Stok</th>
            <th>Harga beli</th>
            <th>Harga jual</th>
            <th>waktu dibuat</th>
            <th>waktu diubah</th>
            <th colspan="2">Aksi</th>
        </tr>

        <?php $i = 1; ?>
        <?php while ($barang = mysqli_fetch_array($query)) : ?>
            <tr>
                <td><?= $i ?></td>
                <td><?= $barang["nama"] ?></td>
                <td><?= $barang["genre"] ?></td>
                <td><?= $barang["stok"] ?></td>
                <td><?= $barang["harga_beli"] ?></td>
                <td><?= $barang["harga_jual"] ?></td>
                <td><?= $barang["created_at"] ?></td>
                <td><?= $barang["updated_at"] ?></td>
                <td>
                    <form action="read-barang.php" method="GET">
                        <input type="hidden" name="id" value='<?= $barang["id"] ?>'>
                        <button type="submit">Lihat</button>
                    </form>
                </td>
                <td>
                    <form action="delete-barang.php" method="POSt" onsubmit="return konfirmasi(this)">
                        <input type="hidden" name="id" value='<?= $barang["id"] ?>'>
                        <button type="submit">Delete</button>
                    </form>
                </td>
            </tr>
            <?php $i++; ?>
        <?php endwhile ?>
    </table>
    </div>
    <script>
        function konfirmasi(form) {
            formData = new FormData(form);
            id = formData.get("id");
            return confirm(`Hapus barang '${id}'?`);
        }
    </script>
</body>

</html>