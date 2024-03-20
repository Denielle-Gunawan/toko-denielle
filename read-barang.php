<!DOCTYPE>
<html>

<head>
    <title>Read Barang</title>
</head>

<body>
    <?php include "menu.php"; ?>

    <?php

    require "koneksi.php";

    $id = $_GET["id"];

    $sql = "SELECT * FROM barang WHERE id = '$id'";
    $query = mysqli_query($koneksi, $sql);

    $barang = mysqli_fetch_array($query);
    ?>

    <div>
        <form action="update-barang.php" method="POST">
            <h1>Lihat Barang</h1>

            <input type="hidden" name="id" value="<?= $id ?>">

            <table>
                <tr>
                    <td>Nama</td>
                    <td><input type="text" name="nama" value="<?= $barang["nama"] ?>"></td>
                </tr>
                <tr>
                    <td>genre</td>
                    <td>
                        <select name="genre">
                            <option value="action" <?= $barang["genre"] == "action" ? "selected" : "" ?>>Action</option>
                            <option value="fighting" <?= $barang["genre"] == "fighting" ? "selected" : "" ?>>Fighting</option>
                            <option value="shooting" <?= $barang["genre"] == "shooting" ? "selected" : "" ?>>Shooting</option>
                            <option value="sport" <?= $barang["genre"] == "sport" ? "selected" : "" ?>>Sport</option>
                            <option value="racing" <?= $barang["genre"] == "racing" ? "selected" : "" ?>>Racing</option>
                            <option value="strategy" <?= $barang["genre"] == "strategy" ? "selected" : "" ?>>Strategy</option>
                            <option value="rpg" <?= $barang["genre"] == "rpg" ? "selected" : "" ?>>RPG</option>
                            <option value="adventure" <?= $barang["genre"] == "adventure" ? "selected" : "" ?>>Adventure</option>
                            <option value="simulation" <?= $barang["genre"] == "simulation" ? "selected" : "" ?>>Simulation</option>
                            <option value="multiplayer" <?= $barang["genre"] == "multiplayer" ? "selected" : "" ?>>Multiplayer</option>
                            <option value="horror" <?= $barang["genre"] == "horror" ? "selected" : "" ?>>Horror</option>
                            <option value="survival" <?= $barang["genre"] == "survival" ? "selected" : "" ?>>Survival</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Stok</td>
                    <td><input type="number" name="stok" value="<?= $barang["stok"] ?>"></td>
                </tr>
                <tr>
                    <td>Harga Beli</td>
                    <td><input type="number" name="harga_beli" value="<?= $barang["harga_beli"] ?>"></td>
                </tr>
                <tr>
                    <td>Harga Jual</td>
                    <td><input type="number" name="harga_jual" value="<?= $barang["harga_jual"] ?>"></td>
                </tr>
                <tr>
                    <td colspan="2">
                        <button type="submit">SIMPAN</button>
                        <button type="reset">RESET</button>
                    </td>
                </tr>
            </table>
        </form>
    </div>
</body>

</html>